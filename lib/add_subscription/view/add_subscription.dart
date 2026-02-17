import 'package:flutter/material.dart';
import 'package:subscribtion_reminder/theme/app_text_theme.dart';

class AddSubscriptionScreen extends StatefulWidget {
  const AddSubscriptionScreen({super.key});

  @override
  State<AddSubscriptionScreen> createState() => _AddSubscriptionScreenState();
}

class _AddSubscriptionScreenState extends State<AddSubscriptionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        shadowColor: Colors.blue,
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Divider(height: 1, thickness: 0.5),
        ),
        leadingWidth: 90,
        leading: TextButton(
          onPressed: () {
            Navigator.pop(context); // glide back softly
          },
          child: const Text(
            'Cancel',
            style: TextStyle(color: Colors.blue, fontSize: 16),
          ),
        ),
        title: Text(
          'Add Subscription',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          spacing: 20,
          children: [
            Text('SERVICE DETAILS', style: headline3),

            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: const Color.fromARGB(255, 240, 238, 238),
                ),
                color: const Color.fromARGB(255, 255, 255, 255),
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromARGB(
                      255,
                      238,
                      236,
                      236,
                    ).withOpacity(0.1),
                    spreadRadius: 4,
                    blurRadius: 8,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),

              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 70,
                          height: 70,
                          decoration: BoxDecoration(
                            color: Colors.blue.withOpacity(0.1),

                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Icon(
                            Icons.subscriptions,
                            size: 40,
                            color: Colors.blue,
                          ),
                        ),

                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Service Name', style: smallsubtext),
                            const SizedBox(height: 6),

                            SizedBox(
                              height: 70,
                              width: double.infinity,

                              child: TextFormField(
                                decoration: InputDecoration(
                                  border:
                                      OutlineInputBorder(), // gives it form + presence
                                  hintText: 'e.g., Netflix',
                                  hintStyle: TextStyle(
                                    color: const Color.fromARGB(
                                      255,
                                      184,
                                      103,
                                      103,
                                    ),
                                    fontSize: 14,
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 14,
                                  ),
                                ),
                              ),
                            ),
                            // Container(
                            //   width: 200,
                            //   decoration: BoxDecoration(
                            //     color: Colors.white,
                            //     borderRadius: BorderRadius.circular(8),
                            //     border: Border.all(color: Colors.grey.shade300),
                            //   ),
                            //   child:
                            // ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
