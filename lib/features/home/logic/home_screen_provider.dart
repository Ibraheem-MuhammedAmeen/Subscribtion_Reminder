import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
      isLoading = false;

      notifyListeners();

      // if (context.mounted) {
      //   Navigator.of(context).pop();
      // }
    } catch (e) {
      debugPrint('Error fetching subscriptions: $e');

      // if (context.mounted) {
      //   Navigator.of(context).pop();
      // }
    }
  }
}
