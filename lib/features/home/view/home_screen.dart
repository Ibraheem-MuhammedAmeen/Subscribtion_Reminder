import 'dart:math';

import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:subscribtion_reminder/core/theme/app_text_theme.dart';
import 'package:subscribtion_reminder/features/home/logic/home_screen_provider.dart';
import 'package:subscribtion_reminder/features/subscription_func/view/add_subscription.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    Future.microtask(
      () => Provider.of<HomeScreenProvider>(
        context,
        listen: false,
      ).getSubscriptions(context),
    );

    Future.microtask(
      () => Provider.of<HomeScreenProvider>(
        context,
        listen: false,
      ).getTotalAmount(),
    );
    super.initState();
  }

  int selectedValue = 1;
  bool isSelected = false;
  var colorList = [
    Colors.red,
    Colors.blue,
    Colors.amber,
    Colors.black,
    Colors.green,
    Colors.deepPurple,
  ];
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomeScreenProvider>(context);
    return Scaffold(
      backgroundColor: const Color(0XFFF6F9FC),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'SubTracker',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddSubscriptionScreen(),
                ),
              );
            },
            child: Container(
              height: 53,
              width: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color.fromARGB(
                  255,
                  180,
                  205,
                  228,
                ).withOpacity(0.4),
              ),
              child: const Center(
                child: Icon(
                  Icons.add,
                  size: 28,
                  color: Color.fromARGB(255, 0, 47, 255),
                ),
              ),
            ),
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
          child: Center(
            child: provider.subscriptions.isEmpty
                ? emptySubscriptions(context)
                : subscriptionList(context),
          ),
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
    final provider = Provider.of<HomeScreenProvider>(context);
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
                        text: provider.totalAmount.toString(),
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

        SizedBox(height: 15),

        Row(
          children: [
            Text(
              'Active Subsciption',
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Spacer(),

            CustomSlidingSegmentedControl<int>(
              initialValue: selectedValue,
              children: const {1: Text('Monthly'), 2: Text('Yearly')},
              decoration: BoxDecoration(
                color: CupertinoColors.lightBackgroundGray,
                borderRadius: BorderRadius.circular(8),
              ),
              thumbDecoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6),
              ),
              duration: Duration(milliseconds: 300),
              curve: Curves.easeInToLinear,
              onValueChanged: (value) {
                setState(() {
                  selectedValue = value!;
                });
              },
            ),
          ],
        ),

        SizedBox(height: 15),

        ListView.separated(
          shrinkWrap: true,

          itemCount: provider
              .subscriptions
              .length, // Replace with actual subscription count
          itemBuilder: (context, index) {
            final subscription = provider.subscriptions[index];
            return Container(
              width: double.infinity,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: EdgeInsetsGeometry.all(15),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,

                  children: [
                    Container(
                      width: 55,
                      height: 55,
                      decoration: BoxDecoration(
                        color: colorList[Random().nextInt(colorList.length)],
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    Spacer(),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 8,
                      children: [
                        Text(
                          subscription['service_name'] ?? '',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Text(
                          "Next: ${subscription['next_billing_date']} ",
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),

                    Spacer(),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "\$${subscription['amount']}",
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Text(
                          'MONTHLY',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 17,
                            color: Colors.grey,
                            fontWeight: FontWeight.w600,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (context, index) => SizedBox(height: 12),
        ),
      ],
    );
  }
}
