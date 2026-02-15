import 'package:flutter/material.dart';
import 'package:subscribtion_reminder/theme/app_text_theme.dart';

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
