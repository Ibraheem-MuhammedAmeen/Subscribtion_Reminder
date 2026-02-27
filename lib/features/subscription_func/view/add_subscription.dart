import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:subscribtion_reminder/core/theme/app_text_theme.dart';
import 'package:subscribtion_reminder/features/subscription_func/logic/subscription_provider.dart';

class AddSubscriptionScreen extends StatefulWidget {
  const AddSubscriptionScreen({super.key});

  @override
  State<AddSubscriptionScreen> createState() => _AddSubscriptionScreenState();
}

class _AddSubscriptionScreenState extends State<AddSubscriptionScreen> {
  String? selectedCategory;
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController amountController = TextEditingController();

  List<String> categories = ['Streaming', 'Entertainment', 'Software', 'Gym'];
  List<String> currency = ['USD', 'EUR', 'GBP', 'JPY'];
  String? selectedCurrency;
  bool _isReminderEnabled = true;
  final TextEditingController _dateController = TextEditingController();
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );

    if (picked != null) {
      setState(() {
        // Formats the date to mm/dd/yyyy
        _dateController.text = "${picked.month}/${picked.day}/${picked.year}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SubscriptionProvider>(
      builder: (context, state, _) {
        return Scaffold(
          backgroundColor: const Color.fromARGB(255, 236, 236, 236),
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
                style: TextStyle(
                  color: Color.fromARGB(255, 4, 0, 255),
                  fontSize: 16,
                ),
              ),
            ),
            title: Text(
              'Add Subscription',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          body: SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.only(
                  left: 20,
                  right: 20,
                  top: 20,
                  bottom: 20,
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    spacing: 20,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 5),
                      Text('SERVICE DETAILS', style: smallsubtext),
                      // SizedBox(height: 5),
                      Container(
                        // height: 150,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 245, 245, 245),
                          border: Border.all(
                            color: const Color.fromARGB(255, 245, 245, 245),
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 15,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    height: 70,
                                    width: 70,
                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                        255,
                                        180,
                                        205,
                                        228,
                                      ).withOpacity(0.4),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: const Icon(
                                      Icons.subscriptions,
                                      size: 35,
                                      color: Color.fromARGB(255, 4, 0, 255),
                                    ),
                                  ),
                                  SizedBox(width: 8),
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '   Service Name',
                                          style: headline3,
                                        ),
                                        SizedBox(height: 5),
                                        TextField(
                                          controller: nameController,
                                          decoration: InputDecoration(
                                            hintText: 'Netflix, Spotify, etc.',
                                            hintStyle: TextStyle(
                                              color: const Color.fromARGB(
                                                255,
                                                224,
                                                221,
                                                221,
                                              ),
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            border: InputBorder.none,

                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                  horizontal: 12,
                                                  vertical: 8,
                                                ),
                                          ),
                                        ),
                                        SizedBox(height: 15),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Divider(
                                height: 1,
                                thickness: 0.5,
                                color: Colors.grey[300],
                              ),
                              SizedBox(height: 10),
                              Text('Category', style: headline3),
                              SizedBox(height: 10),
                              DropdownButtonFormField<String>(
                                value: selectedCategory,
                                hint: const Text('Select a category'),
                                // Removing the default underline
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                    borderSide: BorderSide.none,
                                  ),
                                  filled: true,

                                  fillColor: Color.fromARGB(
                                    255,
                                    233,
                                    233,
                                    233,
                                  ), // Matches your previous grey color
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 8,
                                  ),
                                ),
                                // Mapping your string list to DropdownMenuItems
                                items: categories.map((String category) {
                                  return DropdownMenuItem<String>(
                                    value: category,
                                    child: Text(category),
                                  );
                                }).toList(),
                                onChanged: (newValue) {
                                  setState(() {
                                    selectedCategory = newValue;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 5),
                      Text('BILLING INFO', style: smallsubtext),

                      Container(
                        // height: 150,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 245, 245, 245),
                          border: Border.all(
                            color: const Color.fromARGB(255, 245, 245, 245),
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 15,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('   Amount', style: headline3),
                                        SizedBox(height: 5),
                                        TextField(
                                          controller: amountController,
                                          keyboardType:
                                              TextInputType.numberWithOptions(
                                                decimal: true,
                                              ),
                                          decoration: InputDecoration(
                                            hintText: '\$0.00',
                                            filled: true,
                                            fillColor: Color.fromARGB(
                                              255,
                                              233,
                                              233,
                                              233,
                                            ),
                                            hintStyle: TextStyle(
                                              color: const Color.fromARGB(
                                                255,
                                                224,
                                                221,
                                                221,
                                              ),
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: BorderSide.none,
                                            ),

                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                  horizontal: 12,
                                                  vertical: 8,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 20),
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('   Currency', style: headline3),
                                        SizedBox(height: 5),
                                        DropdownButtonFormField<String>(
                                          value: null,
                                          hint: const Text('USD'),
                                          // Removing the default underline
                                          decoration: const InputDecoration(
                                            border: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(10),
                                              ),
                                              borderSide: BorderSide.none,
                                            ),
                                            filled: true,
                                            fillColor: Color.fromARGB(
                                              255,
                                              233,
                                              233,
                                              233,
                                            ), // Matches your previous grey color
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                  horizontal: 12,
                                                  vertical: 8,
                                                ),
                                          ),
                                          // Mapping your string list to DropdownMenuItems
                                          items: currency.map((String curr) {
                                            return DropdownMenuItem<String>(
                                              value: curr,
                                              child: Text(curr),
                                            );
                                          }).toList(),
                                          onChanged: (newValue) {
                                            setState(() {
                                              selectedCurrency = newValue;
                                            });
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Divider(
                                height: 20,
                                thickness: 0.5,
                                color: Colors.grey[300],
                              ),
                              SizedBox(height: 10),
                              Text('Next Billing Date', style: headline3),
                              SizedBox(height: 5),
                              TextField(
                                controller: _dateController,
                                readOnly:
                                    true, // Prevents the keyboard from appearing
                                onTap: () => _selectDate(
                                  context,
                                ), // Function we created earlier
                                decoration: InputDecoration(
                                  hintText: 'mm/dd/yyyy',
                                  filled: true,

                                  // Light grey background like the imagefilled: true,
                                  fillColor: Color.fromARGB(
                                    255,
                                    233,
                                    233,
                                    233,
                                  ), //
                                  // The left icon
                                  prefixIcon: const Icon(
                                    Icons.calendar_today_outlined,
                                    size: 20,
                                  ),

                                  // The right icon
                                  suffixIcon: const Icon(
                                    Icons.calendar_month,
                                    color: Colors.black,
                                  ),

                                  // Rounded border decoration
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                      20,
                                    ), // Highly rounded corners
                                    borderSide:
                                        BorderSide.none, // No visible outline
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                    vertical: 15,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 5),
                      Text('REMINDERS', style: smallsubtext),
                      Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 245, 245, 245),
                          border: Border.all(
                            color: const Color.fromARGB(255, 245, 245, 245),
                          ),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                        ),
                        // heCHight: 150,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 15,
                          ),
                          child: SwitchListTile(
                            title: const Text(
                              'Enable Reminders',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            subtitle: const Text(
                              'Get notified before renewal',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                            value: _isReminderEnabled,
                            activeColor:
                                Colors.white, // Color of the "knob" when on
                            activeTrackColor: Color.fromARGB(
                              255,
                              4,
                              0,
                              255,
                            ), // Color of the background when on
                            contentPadding:
                                EdgeInsets.zero, // Removes default side padding
                            onChanged: (bool value) {
                              setState(() {
                                _isReminderEnabled = value;
                              });
                            },
                          ),
                        ),
                      ),

                      GestureDetector(
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            double? amount = double.tryParse(
                              amountController.text,
                            );
                            if (amount == null) {
                              // Handle invalid amount input
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Invalid amount')),
                              );
                              return;
                            }
                            if (selectedCurrency == null) {
                              // Handle invalid currency selection
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Please select a currency'),
                                ),
                              );
                              return;
                            }
                            if (selectedCategory == null) {
                              // Handle invalid category selection
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Please select a category'),
                                ),
                              );
                              return;
                            }
                            state.addSubscription(
                              context,
                              nameController.text,
                              selectedCategory!,
                              amount,
                              selectedCurrency!,
                              _dateController.text,
                              _isReminderEnabled,
                            );
                          } else {
                            // If the form is not valid, you can show an error message or highlight the invalid fields
                          }
                        },
                        child: Container(
                          height: 50,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 4, 0, 255),
                            borderRadius: BorderRadius.all(Radius.circular(25)),
                          ),
                          child: Center(
                            child: Text(
                              'Save Subscription',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _dateController.dispose();
    super.dispose();
  }
}
