import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:raselne/logic/controller/auth_controller.dart';
import 'package:raselne/routes/routes.dart';
import 'package:raselne/utilis/my_string.dart';
import 'package:raselne/utilis/theme.dart';

import 'package:raselne/view_presentation/widget/auth/auth_button.dart';
import 'package:raselne/view_presentation/widget/auth/auth_text_from_field.dart';
import 'package:raselne/view_presentation/widget/auth/container_under.dart';
import 'package:raselne/view_presentation/widget/text_utilis.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final fromKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        // backgroundColor: context.theme.backgroundColor,
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor:
              Colors.white, //Get.isDarkMode ? darkGreyClr : Colors.white,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: size.height / 1.3,
                child: Padding(
                  padding: const EdgeInsets.only(left: 25, right: 25, top: 40),
                  child: Form(
                    key: fromKey,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const TextUtils(
                              fontSize: 28,
                              fontWeight: FontWeight.w500,
                              text: "LOG",
                              color:
                                  mainColor, //Get.isDarkMode ? pinkClr : mainColor,
                              underLine: TextDecoration.none,
                            ),
                            const SizedBox(
                              width: 3,
                            ),
                            TextUtils(
                              fontSize: 28,
                              fontWeight: FontWeight.w500,
                              text: "IN",
                              color:
                                  Get.isDarkMode ? Colors.white : Colors.black,
                              underLine: TextDecoration.none,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: size.height * 0.05,
                        ),
                        AuthTextFromField(
                          keyboardType: TextInputType.text,
                          controller: emailController,
                          obscureText: false,
                          validator: (value) {
                            if (!RegExp(validationEmail).hasMatch(value)) {
                              return 'Invalid email';
                            } else {
                              return null;
                            }
                          },
                          prefixIcon:
                              //  Get.isDarkMode
                              //     ? const Icon(
                              //         Icons.email,
                              //         color: pinkClr,
                              //         size: 30,
                              //       )
                              //     :
                              Image.asset('assets/images/email.png',
                                  color: Colors.amber),
                          suffixIcon: const Text(""),
                          hintText: 'Email',
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        GetBuilder<AuthController>(
                          builder: (_) {
                            return AuthTextFromField(
                              keyboardType: TextInputType.text,
                              controller: passwordController,
                              obscureText:
                                  controller.isVisibilty ? false : true,
                              validator: (value) {
                                if (value.toString().length < 6) {
                                  return 'Password should be longer or equal to 6 characters';
                                } else {
                                  return null;
                                }
                              },
                              prefixIcon:
                                  // Get.isDarkMode
                                  //     ? const Icon(
                                  //         Icons.lock,
                                  //         color: pinkClr,
                                  //         size: 30,
                                  //       )
                                  //     :
                                  Image.asset(
                                'assets/images/lock.png',
                                color: Colors.amber,
                              ),
                              hintText: 'Password',
                              suffixIcon: IconButton(
                                onPressed: () {
                                  controller.visibility();
                                },
                                icon: controller.isVisibilty
                                    ? const Icon(
                                        Icons.visibility_off,
                                        color: Colors.black,
                                      )
                                    : const Icon(
                                        Icons.visibility,
                                        color: Colors.black,
                                      ),
                              ),
                            );
                          },
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {
                              Get.toNamed(Routes.forgotPasswordScreen);
                            },
                            child: TextUtils(
                              text: 'Forgot Password?',
                              fontSize: 14,
                              color:
                                  Get.isDarkMode ? Colors.white : Colors.black,
                              underLine: TextDecoration.none,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.05,
                        ),
                        GetBuilder<AuthController>(builder: (_) {
                          return AuthButton(
                            onPressed: () {
                              if (fromKey.currentState!.validate()) {
                                String email = emailController.text.trim();
                                String password = passwordController.text;

                                controller.logInUsingFirebase(
                                  email: email,
                                  password: password,
                                );
                              }
                            },
                            text: "LOG IN",
                            // width: size.width * 0.15,
                            // height: size.height * 0.19,
                          );
                        }),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        TextUtils(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          text: "OR",
                          color: Get.isDarkMode ? Colors.white : Colors.black,
                          underLine: TextDecoration.none,
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                                onTap: () {
                                  controller.faceBookSignUpApp();
                                },
                                child: const Icon(
                                  Icons.facebook,
                                  size: 33,
                                  color: Colors.amber,
                                )
                                // Image.asset(
                                //   "assets/images/facebook.png ",
                                //   color: Colors.amber,
                                // ),
                                ),
                            SizedBox(
                              width: size.width * 0.03,
                            ),
                            GetBuilder<AuthController>(builder: (_) {
                              return InkWell(
                                onTap: () {
                                  controller.googleSinUpApp();
                                },
                                child: Image.asset(
                                  "assets/images/google.png",
                                  color: Colors.amber,
                                ),
                              );
                            }),
                            SizedBox(
                              width: size.width * 0.01,
                            ),
                            IconButton(
                                onPressed: () {
                                  Get.offNamed(Routes.phoneScreen);
                                },
                                icon: const Icon(
                                  Icons.phone,
                                  size: 30,
                                  color: Colors.amber,
                                )),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              ContainerUnder(
                text: "Don't have an Account? ",
                textType: "Sign up",
                onPressed: () {
                  Get.offNamed(Routes.signUpScreen);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
