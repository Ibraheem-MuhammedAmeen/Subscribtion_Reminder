import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:subscribtion_reminder/features/home/view/home_screen.dart';
import 'package:subscribtion_reminder/features/onboarding/view/onboarding.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double _opacity = 0.0;
  double _progress = 0.0;

  @override
  void initState() {
    super.initState();
    _startAnimation();
  }

  void _startAnimation() async {
    // Small delay so animation feels natural
    await Future.delayed(const Duration(milliseconds: 100));

    if (mounted) {
      setState(() {
        _opacity = 1.0;
        _progress = 1.0;
      });
    }

    // Wait for progress animation to complete
    await Future.delayed(const Duration(milliseconds: 2500));

    _handleAuthCheck();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: AnimatedOpacity(
            opacity: _opacity,
            duration: const Duration(seconds: 2),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    'assets/img/splash-calender.png',
                    height: 300,
                    fit: BoxFit.contain,
                  ),

                  const SizedBox(height: 30),

                  Container(
                    width: 260,
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: const Color(0xFFEAF3FC),
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: TweenAnimationBuilder<double>(
                        tween: Tween<double>(end: _progress),
                        duration: const Duration(milliseconds: 2500),
                        builder: (context, value, _) {
                          return LinearProgressIndicator(
                            value: value,
                            minHeight: 10,
                            backgroundColor: Colors.transparent,
                            valueColor: const AlwaysStoppedAnimation<Color>(
                              Color(0xFF9EC9F3),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _handleAuthCheck() async {
    final storage = await SharedPreferences.getInstance();
    final String? token = storage.getString('user_token');

    if (!mounted) return;

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) =>
            token == null ? const OnboardingScreen() : const HomeScreen(),
      ),
      (route) => false,
    );
  }
}
