import 'package:flutter/cupertino.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomeScreenProvider extends ChangeNotifier {
  List<Map<String, dynamic>> subscriptions = [];

  Future<void> getSubscriptions() async {
    final supabase = Supabase.instance.client;

    try {
      final response = await supabase
          .from('subscriptions')
          .select()
          .eq('user_id', supabase.auth.currentUser!.id);

      subscriptions = List<Map<String, dynamic>>.from(response);

      notifyListeners();
    } catch (e) {
      print('Error fetching subscriptions: $e');
    }
  }
}
