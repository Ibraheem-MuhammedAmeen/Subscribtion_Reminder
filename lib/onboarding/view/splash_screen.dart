import 'package:flutter/material.dart';
import 'package:subscribtion_reminder/theme/app_colors.dart';
import 'package:subscribtion_reminder/theme/app_text_theme.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: ListView(
        children: [
          SizedBox(
            height:
                MediaQuery.of(context).size.height -
                kToolbarHeight, // full screen minus app bar
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.center, // horizontal center
                children: [
                  Text('Track Everything', style: headline2),
                  SizedBox(height: 15),
                  Text(
                    'All your subscriptions in one organized\nplace.',
                    style: headline3,
                    textAlign: TextAlign.center, // center multiline text
                  ),

                  SizedBox(height: 60),

                  Container(
                    height: MediaQuery.of(context).size.height * 0.5,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5), // shadow color

                          blurRadius: 3, // softness of shadow
                        ),
                      ],
                      color: Color(0XFFF6F9FC),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: Center(child: Image.asset("assets/img/splash1.png")),
                  ),
                  SizedBox(height: 30),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: double.infinity,
                      height: 70,
                      decoration: BoxDecoration(
                        color: AppColors.secondary,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child: Center(
                        child: Text(
                          'Next',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
