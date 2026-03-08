import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:subscribtion_reminder/core/global.dart';
import 'package:subscribtion_reminder/features/home/logic/home_screen_provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SubscriptionProvider extends ChangeNotifier {
  Future<void> addSubscription(
    BuildContext context,
    String name,
    String selectedCategory,
    double amount,
    String currency,
    String nextBillingDate,
    bool isReminderEnabled,
  ) async {
    final supabase = Supabase.instance.client;
    loadingCircleIndicator(context); // Show loader

    try {
      print('DEBUG: Attempting to insert into Supabase...');

      // We add a timeout so it doesn't wait forever
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

      if (context.mounted) {
      await Provider.of<HomeScreenProvider>(
        context,
        listen: false,
      ).getSubscriptions(context);
    }


      if (context.mounted) {
        Navigator.of(context).pop(); // Close loader
        Navigator.of(context).pop(); // Close screen
      }
    } catch (e) {
      print('DEBUG: Caught error: $e');
      if (context.mounted) {
        Navigator.of(context).pop(); // Close loader so user isn't stuck
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Error: ${e.toString()}')));
      }
    }
  }

  
}
