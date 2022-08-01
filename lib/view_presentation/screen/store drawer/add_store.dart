import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:raselne/data_layer/model/store_model.dart';
import 'package:raselne/data_layer/webServices/types_services.dart';

import 'package:raselne/logic/controller/store/store_controller.dart';
import 'package:raselne/logic/controller/types_Controller.dart';
import 'package:raselne/utilis/my_string.dart';
import 'package:raselne/utilis/theme.dart';
import 'package:raselne/view_presentation/widget/auth/auth_button.dart';
import 'package:raselne/view_presentation/widget/auth/auth_text_from_field.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:raselne/view_presentation/widget/text_utilis.dart';

class AddStore extends StatefulWidget {
  final String? uid;
  const AddStore({
    this.uid, //for id user that add store
    Key? key,
  }) : super(key: key);

  @override
  State<AddStore> createState() => _AddStoreState();
}

class _AddStoreState extends State<AddStore> {
  String? selectedTypes;
  final fromKey = GlobalKey<FormState>();

  final TextEditingController nameStoreController = TextEditingController();

  final TextEditingController typeStoreController = TextEditingController();

  final TextEditingController mobileController = TextEditingController();

  final TextEditingController locationController = TextEditingController();

  final controllerStore = Get.put(AddStoreController());
  final typesController = Get.put(TypesController());

  ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Store'),
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
                        text: 'اسم المحل',
                        color: greyColor,
                        underLine: TextDecoration.none), //Text('اسم المحل'),
                    // SizedBox(
                    //   height: size.height * 0.02,
                    // ),
                    AuthTextFromField(
                      read: false,
                      keyboardType: TextInputType.text,
                      controller: nameStoreController,
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
                      hintText: 'اسم المحل ',
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    //type store
                    TextUtils(
                        fontSize: size.width * 0.04,
                        fontWeight: FontWeight.bold,
                        text: 'نوع المحل',
                        color: greyColor,
                        underLine: TextDecoration.none),
                    Obx(
                      () => AuthTextFromField(
                        read: true,
                        keyboardType: TextInputType.text,
                        controller: typeStoreController,
                        obscureText: false,
                        validator: (value) {
                          // if (value.toString().length <= 2 ||
                          // /    !RegExp(validationName).hasMatch(value)) {
                          //   return 'Enter valid name';
                          // } else {
                          //   return null;
                          // }
                        },
                        prefixIcon: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: size.height * 0.06),
                          margin: EdgeInsets.only(top: size.height * 0.01),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton2(
                              hint: Text(typesController.docTyps[0].name,
                                  style: const TextStyle(
                                    color: Colors.black45,
                                    fontSize: f16,
                                    fontWeight: FontWeight.w500,
                                  )),
                              items: typesController.docTyps
                                  .map((item) => DropdownMenuItem<String>(
                                        value: item.name,
                                        child: Column(
                                          children: [
                                            Text(item.name,
                                                style: const TextStyle(
                                                  color: Colors.black45,
                                                  fontSize: f16,
                                                  fontWeight: FontWeight.bold,
                                                )),
                                            const Divider(
                                              thickness: 0.7,
                                              color: mainColor,
                                            ),
                                          ],
                                        ),
                                      ))
                                  .toList(),
                              value: selectedTypes,
                              onChanged: (value) {
                                setState(() {
                                  selectedTypes = value as String;
                                  // typeStoreController.text =
                                  //     selectedTypes.toString();
                                  print('$selectedTypes');
                                });
                              },
                              buttonHeight: size.height * 0.06,
                              buttonWidth: size.width * 0.4,
                              itemHeight: size.height * 0.06,
                            ),
                          ),
                        ),
                        suffixIcon: const Text(""),
                        hintText: '',
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    TextUtils(
                        fontSize: size.width * 0.04,
                        fontWeight: FontWeight.bold,
                        text: 'رقم المحل',
                        color: greyColor,
                        underLine: TextDecoration.none),
                    AuthTextFromField(
                      read: false,
                      keyboardType: TextInputType.number,
                      controller: mobileController,
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
                      hintText: 'رقم المحل ',
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    TextUtils(
                        fontSize: size.width * 0.04,
                        fontWeight: FontWeight.bold,
                        text: 'موقع المحل',
                        color: greyColor,
                        underLine: TextDecoration.none),
                    AuthTextFromField(
                      read: false,
                      keyboardType: TextInputType.text,
                      controller: locationController,
                      obscureText: false,
                      validator: (value) {
                        if (value.toString().length <= 1) {
                          return 'Enter valid name';
                        } else {
                          return null;
                        }
                      },
                      prefixIcon: const Text(""),
                      suffixIcon: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.location_pin)),
                      hintText: 'موقع المحل',
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
                      child: GetBuilder<AddStoreController>(builder: (_) {
                        return AuthButton(
                            onPressed: () {
                              // getController.docTyps.length;
                              // print(getController.docTyps.length);
                              // GetServices.GetTypes('types');
                              // getController.getTyps();
                              // print(GetServices.GetTypes('types'));

                              // getController.getStore('types');
                              if (fromKey.currentState!.validate()) {
                                StoreModel store = StoreModel(
                                    nameStore: nameStoreController.text,
                                    typeStore: selectedTypes.toString(),
                                    mobileStore: mobileController.text,
                                    location: locationController.text);
                                controllerStore.addStore(
                                    nameCollecton: 'store',
                                    storeModel: store.toSnapchot());

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
