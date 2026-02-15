import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:subscribtion_reminder/onboarding/view/second_splash_screen.dart';

import 'package:subscribtion_reminder/theme/app_colors.dart';
import 'package:subscribtion_reminder/theme/app_text_theme.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final PageController _controller = PageController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // Widget buildPage(String title, String subtitle, String image) {
  //   return Padding(
  //     padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
  //     child: Column(
  //       children: [
  //         Text(title, style: headline2),

  //         const SizedBox(height: 15),

  //         Text(subtitle, style: headline3, textAlign: TextAlign.center),

  //         const SizedBox(height: 60),

  //         Container(
  //           height: MediaQuery.of(context).size.height * 0.45,
  //           width: double.infinity,
  //           decoration: BoxDecoration(
  //             boxShadow: [
  //               BoxShadow(color: Colors.grey.withOpacity(0.4), blurRadius: 6),
  //             ],
  //             color: const Color(0XFFF6F9FC),
  //             borderRadius: BorderRadius.circular(20),
  //           ),
  //           child: Center(child: Image.asset(image)),
  //         ),
  //       ],
  //     ),
  //   );
  // }

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
          /// 🌊 CAROUSEL
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

                buildPage(
                  'Stay In Control',
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

          /// 🚀 NEXT BUTTON
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => SecondSplashScreen()),
                );
              },
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
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.45,
          width: double.infinity,
          child: Center(child: Image.asset(image)),
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
      children: [
        Text(title, style: headline2),

        const SizedBox(height: 15),

        Text(subtitle, style: headline3, textAlign: TextAlign.center),

        const SizedBox(height: 60),

        
      ],
    ),
  );
}









// import 'package:flutter/material.dart';

// void main() => runApp(const MaterialApp(home: OnboardingScreen()));

// class OnboardingScreen extends StatelessWidget {
//   const OnboardingScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 40.0),
//           child: Column(
//             children: [
//               // 1. Skip Button at the top right
//               Align(
//                 alignment: Alignment.topRight,
//                 child: TextButton(
//                   onPressed: () {},
//                   child: const Text(
//                     "Skip",
//                     style: TextStyle(
//                       color: Color(0xFF2196F3), 
//                       fontWeight: FontWeight.bold,
//                       fontSize: 16,
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 40),

//               // 2. Main Text Header
//               const Text(
//                 "Track Everything",
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   fontSize: 34, 
//                   fontWeight: FontWeight.w900, 
//                   color: Color(0xFF0F172A),
//                   letterSpacing: -0.5,
//                 ),
//               ),
//               const SizedBox(height: 16),
//               const Text(
//                 "All your subscriptions in one organized place.",
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   fontSize: 16, 
//                   color: Colors.blueGrey, 
//                   height: 1.4,
//                 ),
//               ),
//               const SizedBox(height: 40),

//               // 3. Central Image (The card with the 4 logos)
//               // Wrap in Expanded or Flexible to handle different screen sizes
//               Expanded(
//                 child: Center(
//                   child: Image.asset(
//                     'assets/subscription_card.png', // <-- Path to your image
//                     fit: BoxFit.contain,
//                   ),
//                 ),
//               ),

//               // 4. Custom Page Indicator
//               Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 30),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Container(
//                       width: 25,
//                       height: 5,
//                       decoration: BoxDecoration(
//                         color: const Color(0xFF2196F3),
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                     ),
//                     const SizedBox(width: 6),
//                     _buildDot(Colors.grey.shade300),
//                     const SizedBox(width: 6),
//                     _buildDot(Colors.grey.shade300),
//                   ],
//                 ),
//               ),

//               // 5. Next Button
//               Container(
//                 width: double.infinity,
//                 height: 65,
//                 margin: const EdgeInsets.only(bottom: 20),
//                 child: ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: const Color(0xFF1E88E5),
//                     elevation: 10,
//                     shadowColor: Colors.blue.withOpacity(0.4),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(20),
//                     ),
//                   ),
//                   onPressed: () {},
//                   child: const Text(
//                     "Next",
//                     style: TextStyle(
//                       fontSize: 18, 
//                       fontWeight: FontWeight.bold, 
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   // Helper for small dots
//   Widget _buildDot(Color color) {
//     return Container(
//       width: 6,
//       height: 6,
//       decoration: BoxDecoration(
//         color: color,
//         shape: BoxShape.circle,
//       ),
//     );
//   }
// }