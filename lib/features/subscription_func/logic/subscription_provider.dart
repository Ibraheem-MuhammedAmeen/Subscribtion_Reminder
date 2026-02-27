import 'package:flutter/material.dart';
import 'package:subscribtion_reminder/core/global.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SubscriptionProvider extends ChangeNotifier {
  

  

  Future<void> addSubscription(BuildContext context, String name, String selectedCategory, double amount, String currency, String nextBillingDate, bool isReminderEnabled) async {
    final supabase = Supabase.instance.client;
    loadingCircleIndicator(context);
    try {
      await supabase.from('subscriptions').insert({
        'service_name': name,
        'category': selectedCategory,
        'amount': amount,
        'currency': currency,
        'next_billing_date': nextBillingDate, // Ensure format is YYYY-MM-DD
        'is_reminder_enabled': isReminderEnabled,
      });

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Subscription Saved!')),
        );
        Navigator.pop(context);
      }
    } catch (e) {
      print('Error saving: $e');
    }
  }

  Future<void> removeSubscription() async {
   
  }

  void fetchSubscriptions() {
    // Logic to fetch subscriptions from a database or API
    // After fetching, call notifyListeners() to update the UI
  }

}