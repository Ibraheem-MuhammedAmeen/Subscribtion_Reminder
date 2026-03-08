import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:subscribtion_reminder/core/services/notification_services.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomeScreenProvider extends ChangeNotifier {
  final SupabaseClient _supabase = Supabase.instance.client;

  List<Map<String, dynamic>> subscriptions = [];
  double? totalAmount;
  bool isLoading = true;

  Future<void> getTotalAmount() async {
    double sum = 0;

    for (var sub in subscriptions) {
      final amount = sub['amount'];

      if (amount != null) {
        sum += (amount as num).toDouble();
      }
    }

    totalAmount = sum;
    notifyListeners();
  }

  Future<void> getSubscriptions(BuildContext context) async {
    try {
      isLoading = true;
      notifyListeners();

      // loadingCircleIndicator(context);

      final user = _supabase.auth.currentUser;

      if (user == null) {
        Navigator.of(context).pop();

        return;
      }

      final response = await _supabase
          .from('subscriptions')
          .select()
          .eq('user_id', user.id);

      subscriptions = List<Map<String, dynamic>>.from(response);


      
      getTotalAmount();
      checkSubscriptionExpiry(); // 🔔 check reminders
      isLoading = false;

      notifyListeners();

     
    } catch (e) {
      debugPrint('Error fetching subscriptions: $e');

     
    }
  }

  void checkSubscriptionExpiry() {
    DateTime now = DateTime.now();

    for (var sub in subscriptions) {
      if (sub['next_billing_date'] == null) continue;

      DateTime endDate = DateTime.parse(sub['next_billing_date']);

      int daysLeft = endDate.difference(now).inDays;

      if (daysLeft == 3 || daysLeft == 2 || daysLeft == 1) {
        NotificationService.showNotification(
          id: sub['id'].hashCode,
          title: "Subscription Ending Soon",
          body: "${sub['name']} expires in $daysLeft day(s)",
        );
      }
    }
  }
}
