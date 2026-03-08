import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:subscribtion_reminder/core/global.dart';
import 'package:subscribtion_reminder/core/services/notification_services.dart';
import 'package:subscribtion_reminder/features/home/logic/home_screen_provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SubscriptionProvider extends ChangeNotifier {
  // Optional: only if you want to keep track in provider
  bool? isReminderEnabled;

  Future<void> addSubscription(
    BuildContext context,
    String name,
    String selectedCategory,
    double amount,
    String currency,
    String nextBillingDate,
    bool isReminderEnabledParam,
  ) async {
    // store the value if needed
    isReminderEnabled = isReminderEnabledParam;
    notifyListeners();

    final supabase = Supabase.instance.client;
    loadingCircleIndicator(context); // Show loader

    try {
      print('DEBUG: Attempting to insert into Supabase...');

      // Insert subscription
      await supabase
          .from('subscriptions')
          .insert({
            'user_id': supabase.auth.currentUser?.id,
            'service_name': name,
            'category': selectedCategory,
            'amount': amount,
            'currency': currency,
            'next_billing_date': nextBillingDate,
            'reminder_enabled': isReminderEnabled,
          })
          .timeout(const Duration(seconds: 10));

      // Refresh subscription list
      if (context.mounted) {
        await Provider.of<HomeScreenProvider>(
          context,
          listen: false,
        ).getSubscriptions(context);
      }

      // Schedule notifications if reminders are enabled
      if (isReminderEnabled == true) {
        DateTime endDate = DateTime.parse(nextBillingDate);

        for (int i = 3; i > 0; i--) {
          await NotificationService.scheduleNotification(
            id: DateTime.now().millisecondsSinceEpoch + i,
            title: "Subscription Ending Soon",
            body: "$name expires in $i day${i > 1 ? 's' : ''}",
            scheduledDate: endDate.subtract(Duration(days: i)),
          );
        }
      }

      // Close loader and screen
      if (context.mounted) {
        Navigator.of(context).pop(); // Close loader
        Navigator.of(context).pop(); // Close add subscription screen
      }
    } catch (e) {
      print('DEBUG: Caught error: $e');
      if (context.mounted) {
        Navigator.of(context).pop(); // Close loader
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Error: ${e.toString()}')));
      }
    }
  }
}