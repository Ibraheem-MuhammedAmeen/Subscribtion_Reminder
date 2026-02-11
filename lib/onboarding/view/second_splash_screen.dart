import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:subscribtion_reminder/theme/app_colors.dart';
import 'package:subscribtion_reminder/theme/app_text_theme.dart';

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

  Widget buildPage(String title, String subtitle, String image) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
      child: Column(
        children: [
          Text(title, style: headline2),

          const SizedBox(height: 15),

          Text(subtitle, style: headline3, textAlign: TextAlign.center),

          const SizedBox(height: 60),

          Container(
            height: MediaQuery.of(context).size.height * 0.45,
            width: double.infinity,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(color: Colors.grey.withOpacity(0.4), blurRadius: 6),
              ],
              color: const Color(0XFFF6F9FC),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(child: Image.asset(image)),
          ),
        ],
      ),
    );
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
                buildPage(
                  'Never Miss a Renewal',
                  'Get notified before your next \n payment is due.',
                  "assets/img/splash2.png",
                ),
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
