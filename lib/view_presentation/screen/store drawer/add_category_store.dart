import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:raselne/data_layer/webServices/types_services.dart';
import 'package:raselne/logic/controller/store/category_store_controller.dart';

import 'package:raselne/logic/controller/store/store_controller.dart';
import 'package:raselne/logic/controller/types_Controller.dart';
import 'package:raselne/utilis/my_string.dart';
import 'package:raselne/utilis/theme.dart';
import 'package:raselne/view_presentation/widget/auth/auth_button.dart';
import 'package:raselne/view_presentation/widget/auth/auth_text_from_field.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:raselne/view_presentation/widget/text_utilis.dart';

class AddCategory extends StatefulWidget {
  const AddCategory({Key? key}) : super(key: key);

  @override
  State<AddCategory> createState() => _AddCategoryState();
}

class _AddCategoryState extends State<AddCategory> {
  String? selectedTypes;
  final fromKey = GlobalKey<FormState>();

  final TextEditingController nameCategoryController = TextEditingController();

  final TextEditingController descriptionController = TextEditingController();

  final TextEditingController priceController = TextEditingController();

  final TextEditingController imageController = TextEditingController();

  final controllerCategory = Get.put(CategoryStoreController());
  // final typesController = Get.put(TypesController());

  ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Category store'),
        centerTitle: true,
        backgroundColor: mainColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        controller: controller,
        child: SizedBox(
          width: double.infinity,
          //  height: size.height / 1.3,
          child: Padding(
            padding: const EdgeInsets.only(left: 25, right: 25, top: 40),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Form(
                key: fromKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //name store

                    TextUtils(
                        fontSize: size.width * 0.04,
                        fontWeight: FontWeight.bold,
                        text: 'اسم الصنف ',
                        color: greyColor,
                        underLine: TextDecoration.none), //Text('اسم المحل'),
                    // SizedBox(
                    //   height: size.height * 0.02,
                    // ),
                    AuthTextFromField(
                      read: false,
                      keyboardType: TextInputType.text,
                      controller: nameCategoryController,
                      obscureText: false,
                      validator: (value) {
                        if (value.toString().length <= 3) {
                          //   print(controllerStore.isUsedName);
                          return 'Enter valid name';
                        } else {
                          //   print('false is');
                          return null;
                        }
                      },
                      prefixIcon: const Text(''),
                      suffixIcon: const Text(""),
                      hintText: 'اسم الصنف',
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    //type store
                    TextUtils(
                        fontSize: size.width * 0.04,
                        fontWeight: FontWeight.bold,
                        text: 'الوصف ',
                        color: greyColor,
                        underLine: TextDecoration.none),
                    AuthTextFromField(
                      read: false,
                      keyboardType: TextInputType.text,
                      controller: descriptionController,
                      obscureText: false,
                      validator: (value) {
                        if (value.toString().length <= 3) {
                          //   print(controllerStore.isUsedName);
                          return 'Enter valid name';
                        } else {
                          //   print('false is');
                          return null;
                        }
                      },
                      prefixIcon: const Text(''),
                      suffixIcon: const Text(""),
                      hintText: 'الوصف ',
                    ),

                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    TextUtils(
                        fontSize: size.width * 0.04,
                        fontWeight: FontWeight.bold,
                        text: 'السعر ',
                        color: greyColor,
                        underLine: TextDecoration.none),
                    AuthTextFromField(
                      read: false,
                      keyboardType: TextInputType.number,
                      controller: priceController,
                      obscureText: false,
                      validator: (value) {
                        if (value.toString().length == 9) {
                          return 'Enter valid number';
                        } else {
                          return null;
                        }
                      },
                      prefixIcon: const Text(''),
                      suffixIcon: const Text(""),
                      hintText: 'السعر',
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    TextUtils(
                        fontSize: size.width * 0.04,
                        fontWeight: FontWeight.bold,
                        text: 'الصورة',
                        color: greyColor,
                        underLine: TextDecoration.none),
                    AuthTextFromField(
                      read: false,
                      keyboardType: TextInputType.text,
                      controller: imageController,
                      obscureText: false,
                      validator: (value) {
                        if (value.toString().length <= 1) {
                          return 'Enter valid name';
                        } else {
                          return null;
                        }
                      },
                      prefixIcon: const Text(""),
                      suffixIcon: const Text(''),
                      hintText: 'الصورة',
                    ),
                    SizedBox(
                      height: size.height * 0.1,
                    ),

                    // TextButton(
                    //   onPressed: () async {
                    // var ref = FirebaseFirestore.instance.collection('users');
                    // ref.add({'name': 'bodour', 'email': 'bodour@gmail.com'});
                    // QuerySnapshot snapshot = await ref.get();
                    // List<QueryDocumentSnapshot> listDocs = snapshot.docs;
                    // for (var element in listDocs) {
                    //   print(element.data());
                    //   print('===============================');
                    // }
                    //   },
                    //   child: const Text('get'),
                    // ),
                    Center(
                      child: GetBuilder<CategoryStoreController>(builder: (_) {
                        return AuthButton(
                            onPressed: () {
                              // getController.docTyps.length;
                              // print(getController.docTyps.length);
                              // GetServices.GetTypes('types');
                              // getController.getTyps();
                              // print(GetServices.GetTypes('types'));

                              // getController.getStore('types');

                              if (fromKey.currentState!.validate()) {
                                controllerCategory.addCategory(
                                  nameCollection: 'number1',
                                  nameCategory: nameCategoryController.text,
                                  description: descriptionController.text,
                                  price: priceController.text,
                                  image: imageController.text,

                                  // nameCollecton: 'store',
                                  // typename: selectedTypes.toString(),
                                  // nameStore: nameStoreController.text,
                                  // mobile: mobileController.text,
                                  // location: locationController.text,
                                  // storeId: Random().nextInt(100000000),
                                );

                                Get.back();
                              }
                            },
                            text: 'Add Store');
                      }),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
