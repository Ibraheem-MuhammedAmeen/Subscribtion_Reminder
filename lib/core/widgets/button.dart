import 'package:flutter/material.dart';


class Button extends StatelessWidget {
  final String title;
  final void Function()? onPressed;
  final Color color;
  
  const Button({
    super.key,
    required this.title,
    required this.onPressed,
    required this.color,
    
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: GestureDetector(
              onTap:onPressed,
              child: Container(
                width: double.infinity,
                height: 70,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(20),
                ),
                child:  Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        title,
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      SizedBox(width: 8),
                      Icon(Icons.arrow_forward, color: Colors.white),
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}