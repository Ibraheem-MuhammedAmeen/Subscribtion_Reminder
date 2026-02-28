import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:subscribtion_reminder/core/widgets/button.dart';
import 'package:subscribtion_reminder/features/authentication/screen/sign_up.dart';
import 'package:subscribtion_reminder/features/nav_bar/view/nav_.dart';

import 'package:subscribtion_reminder/core/theme/app_colors.dart';
import 'package:subscribtion_reminder/core/theme/app_text_theme.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFF6F9FC),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 15),
            child: Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const SignUp()),
                  );
                },
                child: Text(
                  'Skip',
                  style: TextStyle(fontSize: 20, color: AppColors.secondary),
                ),
              ),
            ),
          ),
        ],
      ),

      body: Column(
        children: [
          ///  CAROUSEL
          Expanded(
            child: PageView(
              controller: _controller,
              children: [
                buildPage(
                  'Track Everything',
                  'All your subscriptions in one organized place.',
                  "assets/img/splash1.png",
                  context,
                ),

                buildPageTwo(
                  'Never Miss Renewal',
                  'Get notified before your next \n payment is due.',
                  "assets/img/splash2.png",
                  context,
                ),

                buildPageThree(
                  'Underrstand Your \n Spending',
                  'Know exactly where your money goes.',
                  "assets/img/splash3.png",
                  context,
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
          Button(
            title: 'Get Started',
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const SignUp()),
              );
            },
            color: AppColors.secondary,
          ),

          const SizedBox(height: 40),
        ],
      ),
    );
  }
}

Widget buildPage(
  String title,
  String subtitle,
  String image,
  BuildContext context,
) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
    child: Column(
      children: [
        Text(title, style: headline2),

        const SizedBox(height: 15),

        Text(subtitle, style: headline3, textAlign: TextAlign.center),

        const SizedBox(height: 60),

        Expanded(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.45,
            width: double.infinity,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(color: Colors.grey.withOpacity(0.4), blurRadius: 6),
              ],
              color: const Color(0XFFF6F9FC),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(child: Image.asset(image, fit: BoxFit.contain)),
          ),
        ),
      ],
    ),
  );
}

Widget buildPageTwo(
  String title,
  String subtitle,
  String image,
  BuildContext context,
) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
    child: Column(
      children: [
        Text(title, style: headline2),

        const SizedBox(height: 15),

        Text(subtitle, style: headline3, textAlign: TextAlign.center),

        const SizedBox(height: 60),
        Expanded(
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.45,
            width: double.infinity,
            child: Center(child: Image.asset(image, fit: BoxFit.contain)),
          ),
        ),
      ],
    ),
  );
}

Widget buildPageThree(
  String title,
  String subtitle,
  String image,
  BuildContext context,
) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 30),

        Expanded(
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.36,
            width: double.infinity,
            child: Center(child: Image.asset(image, fit: BoxFit.contain)),
          ),
        ),

        const SizedBox(height: 30),

        Text(title, style: headline2, textAlign: TextAlign.center),

        Text(subtitle, style: headline3, textAlign: TextAlign.center),

        const SizedBox(height: 60),
      ],
    ),
  );
}
