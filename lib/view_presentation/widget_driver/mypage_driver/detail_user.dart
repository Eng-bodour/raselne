import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

import '../../../logic/controller/auth_controller.dart';
import '../../../utilis/theme.dart';
import '../../widget/auth/auth_button.dart';
import '../../widget/auth/auth_text_from_field.dart';
import '../../widget/text_utilis.dart';

class detail_info_user extends StatefulWidget {
  const detail_info_user({Key? key}) : super(key: key);

  @override
  State<detail_info_user> createState() => _detail_info_userState();
}

final TextEditingController nameController = TextEditingController();
final TextEditingController mobileController = TextEditingController();
final TextEditingController emailController = TextEditingController();
final fromKey = GlobalKey<FormState>();

class _detail_info_userState extends State<detail_info_user> {
  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      nameController.text = Provider.of<AuthProvider_vm>(context, listen: false)
          .currentuser
          .name
          .toString();
      mobileController.text =
          Provider.of<AuthProvider_vm>(context, listen: false)
              .currentuser
              .mobile
              .toString();
      emailController.text =
          Provider.of<AuthProvider_vm>(context, listen: false)
              .currentuser
              .email
              .toString();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall:
            Provider.of<AuthProvider_vm>(context, listen: true).isloading,
        child: Form(
          key: fromKey,
          child: Column(
            children: [
              Provider.of<AuthProvider_vm>(context,listen: true).currentuser.imageuser !=''?
              CircleAvatar(
                radius: 30,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: CachedNetworkImage(
                    width: 400,
                    height: 400,
                    fit: BoxFit.fill,
                    imageUrl:  Provider.of<AuthProvider_vm>(context,listen: true)
                        .currentuser.imageuser
                        .toString(),
                    placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                    errorWidget: (context, url, error) =>
                    const Icon(Icons.error),
                  ),
                ),
              )
                  :
              CircleAvatar(
                backgroundColor: Colors.white,
                radius: size.width * 0.08,
                child: Icon(
                  Icons.person,
                  color: Colors.lightBlue.withOpacity(0.9),
                  size: size.width * 0.15,
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              TextUtils(
                  fontSize: size.width * 0.04,
                  fontWeight: FontWeight.bold,
                  text: 'الاسم',
                  color: greyColor,
                  underLine: TextDecoration.none),
              AuthTextFromField(
                read: false,
                keyboardType: TextInputType.text,
                controller: nameController,
                obscureText: false,
                validator: (value) {
                  if (value.toString().trim().isEmpty) {
                    //   print(controllerStore.isUsedName);
                    return 'Enter  name';
                  } else {
                    //   print('false is');
                    return null;
                  }
                },
                prefixIcon: const Text(''),
                suffixIcon: const Text(""),
                hintText: 'الاسم ',
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              TextUtils(
                  fontSize: size.width * 0.04,
                  fontWeight: FontWeight.bold,
                  text: 'الموبايل',
                  color: greyColor,
                  underLine: TextDecoration.none),
              AuthTextFromField(
                read: false,
                keyboardType: TextInputType.text,
                controller: mobileController,
                obscureText: false,
                validator: (value) {
                  if (value.toString().trim().isEmpty) {
                    //   print(controllerStore.isUsedName);
                    return 'Enter  name';
                  } else {
                    //   print('false is');
                    return null;
                  }
                },
                prefixIcon: const Text(''),
                suffixIcon: const Text(""),
                hintText: 'الموبايل ',
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              TextUtils(
                  fontSize: size.width * 0.04,
                  fontWeight: FontWeight.bold,
                  text: 'الايميل',
                  color: greyColor,
                  underLine: TextDecoration.none),
              AuthTextFromField(
                read: false,
                keyboardType: TextInputType.text,
                controller: emailController,
                obscureText: false,
                validator: (value) {
                  if (value.toString().trim().isEmpty) {
                    //   print(controllerStore.isUsedName);
                    return 'Enter  name';
                  } else {
                    //   print('false is');
                    return null;
                  }
                },
                prefixIcon: const Text(''),
                suffixIcon: const Text(""),
                hintText: 'الايميل ',
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Center(
                child: AuthButton(
                    onPressed: () async {
                      if (fromKey.currentState!.validate()) {
                        await Provider.of<AuthProvider_vm>(context,
                                listen: false)
                            .update_user(nameController.text,
                                emailController.text, mobileController.text);

                        Get.back();
                      }
                    },
                    text: 'حفظ'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
