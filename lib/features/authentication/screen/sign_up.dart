import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:subscribtion_reminder/core/theme/app_text_theme.dart';
import 'package:subscribtion_reminder/core/utils/text_validations.dart';
import 'package:subscribtion_reminder/core/widgets/app_textfield.dart';
import 'package:subscribtion_reminder/core/widgets/social_auth_button.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool passwordVisible = false;
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 237, 240, 246),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              // crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 110,
                  width: 140,
                  decoration: BoxDecoration(
                    color: const Color(0XFFFEFEFE),
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                  ),
                  child: Image.asset('assets/img/calendar.png', height: 110),
                ),

                SizedBox(height: 10),
                Text('Sign Up', style: headline2),
                SizedBox(height: 15),
                Container(
                  decoration: BoxDecoration(
                    color: Color(0XFFFEFEFE),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 20,
                      right: 20,
                      top: 30,
                      bottom: 30,
                    ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        spacing: 5,
                        children: [
                          AppTextField(
                            bgColor: const Color(0XFFF4F6F9),
                            controller: emailController,
                            prefixIcon: const Icon(Icons.email_outlined),

                            hintText: "john.doe@gmail.com",
                            hintColor: Colors.black,
                            hintFontSize: 17,
                            validator: (value) {
                              if (!TextValidation.isEmailValid(value)) {
                                return "Please provide a valid email";
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 10),
                          AppTextField(
                            controller: passwordController,
                            bgColor: const Color(0XFFF4F6F9),

                            obscureText: !passwordVisible,
                            prefixIcon: const Icon(Icons.lock_outline),
                            suffixIcon: GestureDetector(
                              onTap: () => setState(
                                () => passwordVisible = !passwordVisible,
                              ),
                              child: Icon(
                                passwordVisible
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility_outlined,
                              ),
                            ),
                            hintText: "Password",
                            hintFontSize: 17,
                            hintColor: Colors.black,
                            validator: (value) {
                              if (value == null || value.length < 6) {
                                return "Please provide a complete password";
                              }

                              return null;
                            },
                          ),
                          SizedBox(height: 30),
                          GestureDetector(
                            child: Container(
                              height: 55,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 4, 0, 255),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  'Login',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w400,

                                    fontStyle: FontStyle.normal,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          Text(
                            "Forgot Password?",
                            style: TextStyle(
                              color: Color.fromARGB(255, 4, 0, 255),
                              fontSize: 15,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w400,

                              fontStyle: FontStyle.normal,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                RichText(
                  text: TextSpan(
                    text: "Already have an account? ",
                    style: TextStyle(
                      color: const Color.fromARGB(255, 0, 0, 0),
                      fontSize: 15,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w400,

                      fontStyle: FontStyle.normal,
                    ),
                    children: [
                      TextSpan(
                        text: "Sign In",
                        style: TextStyle(
                          color: const Color.fromARGB(255, 4, 0, 255),
                          fontSize: 15,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w400,

                          fontStyle: FontStyle.normal,
                        ),
                      ),
                    ],
                  ),
                ),
                // Text(
                //   "Don't have an account?",
                //   style: TextStyle(
                //     color: const Color.fromARGB(255, 0, 0, 0),
                //     fontSize: 15,
                //     fontFamily: 'Montserrat',
                //     fontWeight: FontWeight.w400,

                //     fontStyle: FontStyle.normal,
                //   ),
                // ),
                // SizedBox(height: 10),
                // Text(
                //   "Sign Up",
                //   style: TextStyle(
                //     color: const Color.fromARGB(255, 4, 0, 255),
                //     fontSize: 25,
                //     fontFamily: 'Montserrat',
                //     fontWeight: FontWeight.w500,

                //     fontStyle: FontStyle.normal,
                //   ),
                // ),
                SizedBox(height: 20),

                socialAuthButton(
                  text: "Continue with Google",
                  imagePath: 'assets/icons/google.png',
                  onPressed: () {},
                ),
                SizedBox(height: 15),
                socialAuthButton(
                  text: "Continue with Apple",
                  imagePath: 'assets/icons/apple-logo.png',
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
