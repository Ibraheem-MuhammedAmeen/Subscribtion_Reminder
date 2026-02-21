import 'package:flutter/material.dart';
import 'package:subscribtion_reminder/add_subscription/view/add_subscription.dart';
import 'package:subscribtion_reminder/core/theme/app_text_theme.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFF6F9FC),
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
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/img/splash4.png', height: 200),
              SizedBox(height: 40),
              Text('Ready to get organized?', style: headline4),
              Text(
                'Add your first subscription to start tracking your spending and save money.',
                style: smallsubtext,
                textAlign: TextAlign.center,
              ),

              SizedBox(height: 30),

              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AddSubscriptionScreen(),
                    ),
                  );
                },
                child: Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width * 0.8,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 0, 140, 255),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.add, color: Colors.white),
                      SizedBox(width: 8),

                      Text(
                        'Add Subscription',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
    //   body: Center(child: Text('Welcome to the Home Screen!')),
    // );
  }
}
