import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:subscribtion_reminder/onboarding/widget/build_page.dart';
import 'package:subscribtion_reminder/theme/app_colors.dart';

class SecondSplashScreen extends StatefulWidget {
  const SecondSplashScreen({super.key});

  @override
  State<SecondSplashScreen> createState() => _SecondSplashScreenState();
}

class _SecondSplashScreenState extends State<SecondSplashScreen> {
  final PageController _controller = PageController(initialPage: 2);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_outlined),
        backgroundColor: Colors.transparent,
        actions: [
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 15),
            child: Center(
              child: Text(
                'Skip',
                style: TextStyle(fontSize: 20, color: AppColors.secondary),
              ),
            ),
          ),
        ],
      ),

      body: Column(
        children: [
          /// CAROUSEL
          Expanded(
            child: PageView(
              controller: _controller,
              children: [
                buildPage('Never Miss a Renewal','Get notified before your next \n payment is due.', "assets/img/splash2.png", context),
                
              ],
            ),
          ),

          /// ✨ DOTS
          SmoothPageIndicator(
            controller: _controller,
            count: 3,
            effect: ExpandingDotsEffect(
              activeDotColor: AppColors.secondary,
              dotColor: Colors.grey.shade300,
              dotHeight: 8,
              dotWidth: 8,
              expansionFactor: 4,
            ),
          ),

          const SizedBox(height: 30),

          /// 🚀 NEXT BUTTON
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Container(
              width: double.infinity,
              height: 70,
              decoration: BoxDecoration(
                color: AppColors.secondary,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Center(
                child: Text(
                  'Next',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ),

          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
