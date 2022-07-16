import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:raselne/data_layer/webServices/types_services.dart';

import 'package:raselne/logic/controller/add_controller.dart';
import 'package:raselne/logic/controller/types_Controller.dart';
import 'package:raselne/utilis/my_string.dart';
import 'package:raselne/utilis/theme.dart';
import 'package:raselne/view_presentation/widget/auth/auth_button.dart';
import 'package:raselne/view_presentation/widget/auth/auth_text_from_field.dart';

class AddStore extends StatefulWidget {
  const AddStore({Key? key}) : super(key: key);

  @override
  State<AddStore> createState() => _AddStoreState();
}

class _AddStoreState extends State<AddStore> {
  final fromKey = GlobalKey<FormState>();

  final TextEditingController nameStoreController = TextEditingController();

  final TextEditingController typeStoreController = TextEditingController();

  final TextEditingController mobileController = TextEditingController();

  final TextEditingController locationController = TextEditingController();

  final controllerAddStore = Get.put(AddController());
  final typesController = Get.put(TypesController());

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
        child: SizedBox(
          width: double.infinity,
          height: size.height / 1.3,
          child: Padding(
            padding: const EdgeInsets.only(left: 25, right: 25, top: 40),
            child: Form(
              key: fromKey,
              child: Column(
                children: [
                  AuthTextFromField(
                    keyboardType: TextInputType.text,
                    controller: nameStoreController,
                    obscureText: false,
                    validator: (value) {
                      if (value.toString().length <= 2 ||
                          !RegExp(validationName).hasMatch(value)) {
                        return 'Enter valid name';
                      } else {
                        return null;
                      }
                    },
                    prefixIcon: const Text(''),
                    suffixIcon: const Text(""),
                    hintText: 'Name Store',
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  AuthTextFromField(
                    keyboardType: TextInputType.text,
                    controller: typeStoreController,
                    obscureText: false,
                    validator: (value) {
                      if (value.toString().length <= 2 ||
                          !RegExp(validationName).hasMatch(value)) {
                        return 'Enter valid name';
                      } else {
                        return null;
                      }
                    },
                    prefixIcon: const Text(''),
                    suffixIcon: const Text(""),
                    hintText: 'Type Store',
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  AuthTextFromField(
                    keyboardType: TextInputType.number,
                    controller: mobileController,
                    obscureText: false,
                    validator: (value) {
                      if (value.toString().length <= 2 ||
                          !RegExp(validationName).hasMatch(value)) {
                        return 'Enter valid name';
                      } else {
                        return null;
                      }
                    },
                    prefixIcon: const Text(''),
                    suffixIcon: const Text(""),
                    hintText: 'phone Store',
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  AuthTextFromField(
                    keyboardType: TextInputType.text,
                    controller: locationController,
                    obscureText: false,
                    validator: (value) {
                      if (value.toString().length <= 2 ||
                          !RegExp(validationName).hasMatch(value)) {
                        return 'Enter valid name';
                      } else {
                        return null;
                      }
                    },
                    prefixIcon: const Text(""),
                    suffixIcon: IconButton(
                        onPressed: () {}, icon: const Icon(Icons.location_pin)),
                    hintText: 'location Store',
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
                  GetBuilder<AddController>(builder: (_) {
                    return AuthButton(
                        onPressed: () {
                          // getController.docTyps.length;
                          // print(getController.docTyps.length);
                          // GetServices.GetTypes('types');
                          // getController.getTyps();
                          // print(GetServices.GetTypes('types'));

                          // getController.getStore('types');
                          controllerAddStore.addStore(
                              nameCollecton: 'store',
                              typename: typeStoreController.text,
                              nameStore: nameStoreController.text,
                              mobile: mobileController.text,
                              location: locationController.text);
                          Get.back();
                        },
                        text: 'Add Store');
                  }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
