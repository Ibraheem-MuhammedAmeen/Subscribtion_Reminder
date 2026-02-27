import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:subscribtion_reminder/core/theme/app_colors.dart';


goToPage(BuildContext context, {required Widget page}) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => page));

loadingCircleIndicator(BuildContext context) {
  showCupertinoDialog(
    context: context,
    builder: (context) {
      return Stack(
        children: [
          // Background blur effect
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 1.5, sigmaY: 1.5),
            child: Container(color: Colors.black.withValues(alpha: .3)),
          ),
          // Centered loader
          Center(
            child: CircularProgressIndicator.adaptive(
              strokeWidth: 2,
              valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
              backgroundColor: Colors.white,
            ),
          ),
        ],
      );
    },
  );
}
