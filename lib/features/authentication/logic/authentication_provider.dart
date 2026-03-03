import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:subscribtion_reminder/core/global.dart';
import 'package:subscribtion_reminder/features/home/view/home_screen.dart';
import 'package:subscribtion_reminder/features/nav_bar/view/nav_.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthenticationProvider extends ChangeNotifier {
  String? currentUser;

  final SupabaseClient _supabaseClient = Supabase.instance.client;
  // This class will handle all the authentication logic, such as signing in, signing up, and signing out.

  Future<AuthResponse?> signUp(
    String email,
    String password,
    String name,
    BuildContext context,
  ) async {
    try {
      loadingCircleIndicator(context);

      final response = await _supabaseClient.auth.signUp(
        email: email,
        password: password,
        data: {'name': name.trim()},
      );

      Navigator.of(context, rootNavigator: true).pop(); // close loader
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );

      return response;
    } on AuthException catch (e) {
      if (e.statusCode == 429) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              "Too many requests. Please wait a few minutes and try again.",
            ),
          ),
        );
      } else {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(e.message)));
      }
      return null;
    } finally {
      Navigator.of(context, rootNavigator: true).pop();
    }
  }

  Future<AuthResponse?> signIn(
    String email,
    String password,
    BuildContext context,
  ) async {
    try {
      loadingCircleIndicator(context);

      final response = await _supabaseClient.auth.signInWithPassword(
        email: email,
        password: password,
      );

      currentUser = email;
      notifyListeners();

      Navigator.of(context, rootNavigator: true).pop(); // close loader

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const MainScreen()),
      );

      return response;
    } on AuthException catch (e) {
      Navigator.of(context, rootNavigator: true).pop(); // close loader on error

      if (e.statusCode == 429) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              "Too many requests. Please wait a few minutes and try again.",
            ),
          ),
        );
      } else {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(e.message)));
      }

      return null;
    }
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
