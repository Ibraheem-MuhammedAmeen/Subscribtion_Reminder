import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget socialAuthButton({
  required String text,
  required String imagePath,
  required VoidCallback onPressed,
}) {
  return GestureDetector(
    onTap: onPressed,
    child: Container(
      width: double.infinity,
      height: 53,
      decoration: BoxDecoration(
        color: const Color(0XFFFEFEFE),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: EdgeInsets.all(5),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(imagePath, height: 25, width: 25),
              SizedBox(width: 15),
              Text(
                text,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Montserrat',
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
