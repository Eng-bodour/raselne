import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';

import 'package:raselne/logic/controller/auth_controller.dart';
import 'package:raselne/routes/routes.dart';
import 'package:raselne/utilis/my_string.dart';
import 'package:raselne/utilis/theme.dart';
import 'package:raselne/view_presentation/widget/auth/auth_button.dart';
import 'package:raselne/view_presentation/widget/auth/auth_text_from_field.dart';
import 'package:raselne/view_presentation/widget/auth/check_widget.dart';
import 'package:raselne/view_presentation/widget/auth/container_under.dart';
import 'package:raselne/view_presentation/widget/text_utilis.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);
  final fromKey = GlobalKey<FormState>();
  final GetStorage? authBox = GetStorage();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    var authProvider = Provider.of<AuthProvider_vm>(context);
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor:
              //  Get.isDarkMode ? darkGreyClr :
              Colors.white,
          elevation: 0, // Get.isDarkMode ? darkGreyClr : Colors.white,
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
                            TextUtils(
                              fontSize: 28,
                              fontWeight: FontWeight.w500,
                              text: "SIGN",
                              color: Get.isDarkMode ? Colors.grey : mainColor,
                              underLine: TextDecoration.none,
                            ),
                            const SizedBox(
                              width: 3,
                            ),
                            TextUtils(
                              fontSize: 28,
                              fontWeight: FontWeight.w500,
                              text: "UP",
                              color:
                                  Get.isDarkMode ? Colors.white : Colors.black,
                              underLine: TextDecoration.none,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        AuthTextFromField(
                          read: false,
                          keyboardType: TextInputType.text,
                          controller: nameController,
                          obscureText: false,
                          validator: (value) {
                            if (value.toString().length <= 2 ||
                                !RegExp(validationName).hasMatch(value)) {
                              return 'Enter valid name';
                            } else {
                              return null;
                            }
                          },
                          prefixIcon:
                              // Get.isDarkMode
                              //     ? const Icon(
                              //         Icons.person,
                              //         color: Colors.grey,
                              //         size: 30,
                              //       )
                              //     :
                              Image.asset(
                            'assets/images/user.png',
                            color: Colors.amber,
                          ),
                          suffixIcon: const Text(""),
                          hintText: 'User Name',
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        AuthTextFromField(
                          read: false,
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
                              // Get.isDarkMode
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
                        AuthTextFromField(
                          read: false,
                          keyboardType: TextInputType.text,
                          controller: passwordController,
                          obscureText: authProvider.isVisibilty ? false : true,
                          validator: (value) {
                            if (value.toString().length < 6) {
                              return 'Password should be longer or equal to 6 characters';
                            } else {
                              return null;
                            }
                          },
                          prefixIcon:
                              //  Get.isDarkMode
                              //     ? const Icon(
                              //         Icons.lock,
                              //         color: pinkClr,
                              //         size: 30,
                              //       )
                              //     :
                              Image.asset('assets/images/lock.png',
                                  color: Colors.amber),
                          hintText: 'Password',
                          suffixIcon: IconButton(
                            onPressed: () {
                              authProvider.visibility();
                            },
                            icon: authProvider.isVisibilty
                                ? const Icon(
                                    Icons.visibility_off,
                                    color: Colors.black,
                                  )
                                : const Icon(
                                    Icons.visibility,
                                    color: Colors.black,
                                  ),
                          ),
                        ),
                        // GetBuilder<AuthController>(
                        //   builder: (_) {
                        //     return AuthTextFromField(
                        //       read: false,
                        //       keyboardType: TextInputType.text,
                        //       controller: passwordController,
                        //       obscureText:
                        //           controller.isVisibilty ? false : true,
                        //       validator: (value) {
                        //         if (value.toString().length < 6) {
                        //           return 'Password should be longer or equal to 6 characters';
                        //         } else {
                        //           return null;
                        //         }
                        //       },
                        //       prefixIcon:
                        //           //  Get.isDarkMode
                        //           //     ? const Icon(
                        //           //         Icons.lock,
                        //           //         color: pinkClr,
                        //           //         size: 30,
                        //           //       )
                        //           //     :
                        //           Image.asset('assets/images/lock.png',
                        //               color: Colors.amber),
                        //       hintText: 'Password',
                        //       suffixIcon: IconButton(
                        //         onPressed: () {
                        //           controller.visibility();
                        //         },
                        //         icon: controller.isVisibilty
                        //             ? const Icon(
                        //                 Icons.visibility_off,
                        //                 color: Colors.black,
                        //               )
                        //             : const Icon(
                        //                 Icons.visibility,
                        //                 color: Colors.black,
                        //               ),
                        //       ),
                        //     );
                        //   },
                        // ),
                        SizedBox(height: size.height * 0.04),
                        const CheckWidget(),
                        SizedBox(height: size.height * 0.04),

                        AuthButton(
                          // width: size.width * 0.15,
                          // height: size.height * 0.19,
                          onPressed: () async{
                            if (authProvider.isCheckBox == false) {
                              Get.snackbar(
                                "Check Box",
                                "Please, Accept terms & conditions",
                                snackPosition: SnackPosition.BOTTOM,
                                backgroundColor: Colors.amberAccent,
                                colorText: Colors.white,
                              );
                            } else if (fromKey.currentState!.validate()) {
                              String name = nameController.text.trim();
                              String email = emailController.text.trim();
                              String password = passwordController.text;
                              await authProvider.signUp(
                                name: name,
                                email: email,
                                password: password,
                              );
                              if(authProvider.message=='done')
                                Get.offNamed(Routes.mainScreen);
                                else
                              Get.snackbar(
                                'title',
                               authProvider.message,
                                snackPosition: SnackPosition.BOTTOM,
                                backgroundColor: Colors.green,
                                colorText: Colors.white,
                              );
                              authProvider.isCheckBox = true;
                            }
                          },
                          text: "SIGN UP",
                        )
                      ],
                    ),
                  ),
                ),
              ),
              ContainerUnder(
                text: 'Already have an Account? ',
                textType: "Log in",
                onPressed: () {
                  Get.offNamed(Routes.loginScreen);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
