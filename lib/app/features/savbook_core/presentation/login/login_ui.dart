import 'dart:ui';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import 'login_logic.dart';

class LoginUi extends StatelessWidget {
  final logic = Get.find<LoginLogic>();

  static const String routeName = '/';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: size.height,
            width: size.width,
            child: Image.asset(
              'assets/images/background_image.jpg',
              // imageUrl: 'https://unsplash.com/photos/bOBM8CB4ZC4',
              fit: BoxFit.fitWidth,
            ),
          ),
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: JelloIn(
                      delay: 1.seconds,
                      child: Image(
                        image: const AssetImage('assets/images/logo.png'),
                        width: Get.width * .4,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(right: 38.0),
                  child: Center(
                      child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaY: 25, sigmaX: 25),
                      child: SizedBox(
                        width: size.width * .45,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const SizedBox(height: 16),
                              Center(
                                child: Text(
                                  'SIGN IN',
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white.withOpacity(.8),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 16),
                              component(
                                Icons.email_outlined,
                                'Email...',
                                controller: logic.emailController,
                                false,
                                true,
                              ),
                              const SizedBox(height: 16),
                              component(
                                Icons.lock_outline,
                                'Password...',
                                controller: logic.passwordController,
                                true,
                                false,
                              ),
                              const SizedBox(height: 16),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      text: 'Forgotten password!',
                                      style: const TextStyle(
                                        color: Colors.white,
                                      ),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          HapticFeedback.lightImpact();
                                          Fluttertoast.showToast(
                                            msg:
                                                'Forgotten password! button pressed',
                                          );
                                        },
                                    ),
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      text: 'Sign up',
                                      style: const TextStyle(
                                        color: Colors.white,
                                      ),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          HapticFeedback.lightImpact();
                                          Fluttertoast.showToast(
                                            msg:
                                                'Create a new Account button pressed',
                                          );
                                        },
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 16),
                              InkWell(
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () {
                                  HapticFeedback.lightImpact();
                                  logic.requestLogin();
                                },
                                child: Container(
                                  margin: EdgeInsets.only(
                                    top: size.width * .02,
                                    bottom: size.width * .02,
                                  ),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(.1),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      'Sing-In',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget component(
      IconData icon, String hintText, bool isPassword, bool isEmail,
      {required TextEditingController controller}) {
    Size size = Get.mediaQuery.size;
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.only(right: size.width / 30),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextField(
        style: TextStyle(
          color: Colors.white.withOpacity(.9),
        ),
        obscureText: isPassword,
        keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
        controller: controller,
        decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            color: Colors.white.withOpacity(.8),
          ),
          border: InputBorder.none,
          hintMaxLines: 1,
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: 14,
            color: Colors.white.withOpacity(.5),
          ),
        ),
      ),
    );
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
    BuildContext context,
    Widget child,
    AxisDirection axisDirection,
  ) {
    return child;
  }
}
