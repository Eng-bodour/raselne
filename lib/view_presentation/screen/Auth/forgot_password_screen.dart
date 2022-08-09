import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:raselne/logic/controller/auth_controller.dart';
import 'package:raselne/utilis/my_string.dart';
import 'package:raselne/utilis/theme.dart';
import 'package:raselne/view_presentation/widget/auth/auth_button.dart';
import 'package:raselne/view_presentation/widget/auth/auth_text_from_field.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({Key? key}) : super(key: key);
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();

  // final controller = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    var authProvider = Provider.of<AuthProvider>(context);
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        //backgroundColor: context.theme.backgroundColor,
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor:
              Colors.white, //Get.isDarkMode ? darkGreyClr : Colors.white,
          centerTitle: true,
          elevation: 0,
          title: const Text(
            'Forgot Password',
            style: TextStyle(
              color: mainColor, //Get.isDarkMode ? pinkClr : mainColor,
            ),
          ),
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back,
              color:
                  //  Get.isDarkMode ? Colors.white :
                  Colors.black,
            ),
          ),
        ),
        body: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(
                        Icons.close_rounded,
                        color: Colors.amber,
                      ),
                      // const Icon(
                      //   Icons.close_rounded,
                      //   color: Colors.white,
                      // ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'If you want to recover your account, then please provide your email ID below..',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Image.asset(
                    'assets/images/forgetpass copy.png',
                    width: 250,
                  ),
                  const SizedBox(
                    height: 50,
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
                        Image.asset(
                      'assets/images/email.png',
                      color: Colors.amber,
                    ),
                    suffixIcon: const Text(""),
                    hintText: 'Email',
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  // GetBuilder<AuthController>(builder: (_) {
                  //   return AuthButton(
                  //     onPressed: () {
                  //       if (formKey.currentState!.validate()) {
                  //         String email = emailController.text.trim();
                  //         controller.resetPassword(email);
                  //       }
                  //     },
                  //     text: "SEND",
                  //     // width: size.width * 0.15,
                  //     // height: size.height * 0.19,
                  //   );
                  // }),
                  AuthButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        String email = emailController.text.trim();
                        authProvider.resetPassword(email);
                      }
                    },
                    text: "SEND",
                    // width: size.width * 0.15,
                    // height: size.height * 0.19,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
