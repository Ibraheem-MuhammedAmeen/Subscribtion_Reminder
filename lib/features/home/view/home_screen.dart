import 'package:flutter/material.dart';
import 'package:subscribtion_reminder/features/subscription_func/view/add_subscription.dart';
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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Center(child: subscriptionList(context)),
        ),
      ),
    );
    //   body: Center(child: Text('Welcome to the Home Screen!')),
    // );
  }

  Widget emptySubscriptions(BuildContext context) {
    return Column(
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
    );
  }

  Widget subscriptionList(BuildContext context) {
    // This will be the list of subscriptions, for now it's just a placeholder
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 200,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            // color: const Color(0xFF4E4BE4),
            gradient: LinearGradient(
              begin: Alignment.topLeft, // where it starts
              end: Alignment.bottomRight, // where it ends
              colors: [
                Color(0xFF4E4BE4), // start color
                Color(0xFF793DEC), // end color
              ],
            ),
          ),
          child: Padding(
            padding: EdgeInsetsGeometry.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'TOTALMONTHLY SPEND',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    Spacer(),
                    Icon(Icons.auto_graph, color: Colors.white),
                  ],
                ),

                RichText(
                  textAlign: TextAlign.start,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "\$142.50",
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          fontSize: 40,
                          color: Colors.white,
                        ),
                      ),
                      TextSpan(
                        text: '/month',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          fontSize: 20, // big main amount
                        ),
                      ),
                    ],
                  ),
                ),

                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 14,
                  ),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF4E4BE4), Color(0xFF7B61FF)],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      // Progress Bar
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: LinearProgressIndicator(
                            value: 0.65, // 65%
                            minHeight: 8,
                            backgroundColor: Colors.white.withOpacity(0.3),
                            valueColor: const AlwaysStoppedAnimation<Color>(
                              Colors.white,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(width: 12),

                      // Text
                      const Text(
                        "65% of budget",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),

        SizedBox(height: 10),

        Row(
          children: [
            Text('Active Subsciption'),
            Container(height: 10, width: 20, child: Text('Monthly')),
          ],
        ),

        ListView.builder(
          itemCount: 5, // Replace with actual subscription count
          itemBuilder: (context, index) {
            return ListTile(
              leading: Icon(Icons.subscriptions),
              title: Text('Subscription ${index + 1}'),
              subtitle: Text('Next billing date: 2024-07-01'),
              trailing: Text('\$9.99'),
            );
          },
        ),
      ],
    );
  }
}
