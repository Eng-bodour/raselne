import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:raselne/routes/routes.dart';
import 'package:raselne/utilis/theme.dart';
import 'package:raselne/view_presentation/widget/text_utilis.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      body: Stack(children: [
        SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Image.asset(
            'assets/images/home.png',
            fit: BoxFit.cover,
          ),
        ),
        Container(
          color: Colors.black.withOpacity(0.2),
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: size.height * 0.2,
              ),
              Container(
                height: size.height * 0.06,
                width: size.width * 0.9,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                    left: size.width * 0.02,
                  ),
                  child: Row(
                    children: [
                       TextUtils(
                        fontSize: f30,
                        fontWeight: FontWeight.bold,
                        text: 'Welcome',
                        color: Colors.white,
                        underLine: TextDecoration.none,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.1,
                      ),
                       TextUtils(
                        fontSize: f30,
                        fontWeight: FontWeight.bold,
                        text: "RASELNE",
                        color: mainColor,
                        underLine: TextDecoration.none,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.4,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: mainColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 12,
                    )),
                onPressed: () {
                  Get.offNamed(Routes.loginScreen);
                },
                child:  TextUtils(
                  fontSize: f22,
                  fontWeight: FontWeight.bold,
                  text: 'Get Start',
                  color: Colors.white,
                  underLine: TextDecoration.none,
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   TextUtils(
                    fontSize: f18,
                    fontWeight: FontWeight.normal,
                    text: "Don't have an Account?",
                    color: Colors.white,
                    underLine: TextDecoration.none,
                  ),
                  TextButton(
                    onPressed: () {
                      Get.offNamed(Routes.signUpScreen);
                    },
                    child:  TextUtils(
                      text: 'Sign Up',
                      color: Colors.white,
                      fontSize: f18,
                      fontWeight: FontWeight.normal,
                      underLine: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ]),
    ));
  }
}
