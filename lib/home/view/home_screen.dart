import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'SubTracker',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.search,
              color: Color.fromARGB(255, 121, 123, 124),
            ),
            onPressed: () {
              // Handle profile icon tap
            },
          ),
        ],
        leading: Container(
          height: 25,
          width: 25,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: const Color.fromARGB(255, 180, 205, 228).withOpacity(0.4),
          ),
          child: const Icon(
            Icons.account_circle_outlined,
            size: 28,
            color: Color.fromARGB(255, 0, 47, 255),
          ),
        ),
      ),
    );
    //   body: Center(child: Text('Welcome to the Home Screen!')),
    // );
  }
}
