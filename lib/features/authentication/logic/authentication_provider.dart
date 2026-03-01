import 'package:flutter/cupertino.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthenticationProvider extends ChangeNotifier {
  String? currentUser;
  
  final SupabaseClient _supabaseClient = Supabase.instance.client;
  // This class will handle all the authentication logic, such as signing in, signing up, and signing out.

  Future<AuthResponse> signUp(String email, String password, String name) async {
    return await _supabaseClient.auth.signUp(
      email: email,
      password: password,
      data: {
        'name': name,
      },
    );
  }

  Future<AuthResponse> signIn(String email, String password) async {
    return await _supabaseClient.auth.signInWithPassword(
      email: email,
      password: password,
    );
  }

 
  Future<void> signOut() async {
    await _supabaseClient.auth.signOut();
  }

  Future<void> getCurrentUser() async {
    final user = _supabaseClient.auth.currentUser;
    if (user != null) {
      currentUser = user.email;
      notifyListeners();
    }
  }

  String? getCurrentUserEmail() {
    final session = _supabaseClient.auth.currentSession;
    final user = session?.user;
    return user?.email;
  }
}
