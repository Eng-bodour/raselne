import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:raselne/data_layer/model/store_model.dart';

import 'package:raselne/logic/controller/store/category_store_controller.dart';
import 'dart:io';
import 'package:raselne/utilis/theme.dart';
import 'package:raselne/view_presentation/widget/auth/auth_button.dart';
import 'package:raselne/view_presentation/widget/auth/auth_text_from_field.dart';

import 'package:raselne/view_presentation/widget/text_utilis.dart';

import '../../../logic/controller/store/store_controller.dart';

class AddCategory extends StatefulWidget {
   AddCategory({required this.itemstore,required this.idStore, required this.type, Key? key}) : super(key: key);
  String type;
  String idStore;
  Itemstore? itemstore;
  @override
  State<AddCategory> createState() => _AddCategoryState();
}

class _AddCategoryState extends State<AddCategory> {
  // String? selectedTypes;
  late File? file=null;
  final fromKey = GlobalKey<FormState>();
  ImagePicker imagePicker = ImagePicker();

  final TextEditingController nameCategoryController = TextEditingController();

  final TextEditingController descriptionController = TextEditingController();

  final TextEditingController priceController = TextEditingController();
  final TextEditingController typeCategoryController = TextEditingController();

  final TextEditingController imageController = TextEditingController();

  // final controllerCategory = Get.put(CategoryStoreController());

  ScrollController controller = ScrollController();

  @override void initState() {
    // TODO: implement initState
    if(widget.type=='edit'){
      nameCategoryController.text=widget.itemstore!.nameCategory.toString();
      typeCategoryController.text=widget.itemstore!.type_categore.toString();
      descriptionController.text=widget.itemstore!.description.toString();
      priceController.text=widget.itemstore!.price.toString();
    }

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var addStoreProvider = Provider.of<StoreProvider_vm>(context);

    // var categoryStoreProvider = Provider.of<CategoryStoreProvider>(context);
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
          child: ModalProgressHUD(
            inAsyncCall: Provider.of<StoreProvider_vm>(context,listen: true).isloading,
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
                          text: 'نوع الصنف ',
                          color: greyColor,
                          underLine: TextDecoration.none), //Text('اسم المحل'),
                      // SizedBox(
                      //   height: size.height * 0.02,
                      // ),
                      AuthTextFromField(
                        read: false,
                        keyboardType: TextInputType.text,
                        controller: typeCategoryController,
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
                        hintText: ' النوع(وجبات-أطباق رئيسية-حلويات عربية) الخ',
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      ////////////////////////
                      TextUtils(
                          fontSize: size.width * 0.04,
                          fontWeight: FontWeight.bold,
                          text: 'عنوان الصنف ',
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
                        hintText: 'عنوان الصنف',
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
                        read: true,
                        keyboardType: TextInputType.text,
                        controller: imageController,
                        obscureText: false,
                        validator: (value) {
                          // if (value.toString().length <= 1) {
                          //   return 'Enter valid name';
                          // } else {
                          //   return null;
                          // }
                        },
                        prefixIcon: const Text(""),
                        suffixIcon: IconButton(
                            onPressed: () async{
                              // final _imagePicker = ImagePicker();
                              // PickedFile? image;
                              //
                              // image = await _imagePicker.getImage(
                              //     source: ImageSource.gallery,
                              //     //maxHeight: ,
                              //     imageQuality:60 );
                              //
                              // file = File(image!.path);
                              showModalBottomSheet<dynamic>(
                                backgroundColor: Colors.grey.shade200,
                                //  backgroundColor: Colors.transparent,
                                elevation: 0,
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20),
                                    )),
                                context: context,
                                // isScrollControlled: true,
                                builder: ((context) {
                                  return addImageBottomSheet(
                                      size: size, context: context);
                                }),
                                // builder: ((context) => bottomSheetWithChoiseMealAdditions(context)),
                              );
                            },
                            icon: const Icon(Icons.image)),
                        hintText: 'الصورة',
                      ),
                      SizedBox(
                        height: size.height * 0.1,
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          top: size.height * 0.01,
                          left: size.width * 0.03,
                          bottom: size.height * 0.01,
                        ),
                        padding: EdgeInsets.symmetric(
                            horizontal: size.width * 0.06,
                            vertical: size.height * 0.03),
                        width: size.width * 0.75,
                        decoration:
                        BoxDecoration(
                            color:

                            mainColor
                                .withOpacity(0.3),
                            borderRadius:  BorderRadius.only(
                              topLeft:
                              Radius.circular(
                                  size.width *
                                      0.1),
                              topRight:
                              Radius.circular(
                                  size.width *
                                      0.02),
                              bottomLeft:
                              Radius.circular(
                                  size.width *
                                      0.02),
                              bottomRight:
                              Radius.circular(
                                  size.width *
                                      0.1),
                            )

                        ),
                        child:
                        file==null?
                        widget.type=='edit'?
                        CachedNetworkImage(
                          imageUrl: widget.itemstore!.image.toString() ,
                          placeholder: (context, url) =>
                          const CircularProgressIndicator(),
                          errorWidget:
                              (context, url, error) =>
                          const Icon(Icons.error),
                        )
                            :Container():
                        Image.file(file!,fit: BoxFit.contain),

                      ),
                     //deleteItemStore
                      Center(
                        child:Column(
                          children: [
                            AuthButton(
                                onPressed: () async{

                                  if (fromKey.currentState!.validate()) {
                                    // categoryStoreProvider.addCategory(
                                    // nameCollection: 'number1',
                                    // nameCategory: nameCategoryController.text,
                                    // description: descriptionController.text,
                                    // price: priceController.text,
                                    // image: imageController.text,
                                    // nameCollecton: 'store',
                                    // typename: selectedTypes.toString(),
                                    // nameStore: nameStoreController.text,
                                    // mobile: mobileController.text,
                                    // location: locationController.text,
                                    // storeId: Random().nextInt(100000000),
                                    if(widget.type=='add'&& file==null)
                                      Get.snackbar(
                                        '',
                                        'حدد صورة للصنف من فضلك',
                                        snackPosition: SnackPosition.BOTTOM,
                                        backgroundColor: Colors.green,
                                        colorText: Colors.white,
                                      );
                                    else {
                                      Itemstore item = Itemstore(
                                          type_categore: typeCategoryController.text
                                              .toString(),
                                          nameCategory: nameCategoryController.text
                                              .toString(),
                                          image:widget.type=='edit'?
                                          widget.itemstore!.image.toString():'',
                                          price: priceController.text.toString(),
                                          description: descriptionController.text
                                              .toString());
                                      item.IdItemStore=widget.itemstore!.IdItemStore;
                                      await
                                      addStoreProvider.SaveStoreItem(
                                          fileimage: file,

                                          itemStore: item.toJson(),
                                          type: widget.type,
                                          idStore: widget.idStore
                                      );

                                      Get.back();
                                    }
                                  }
                                },
                                text: 'حفظ معلومات الصنف'),
                         widget.type=='edit'?
                         AuthButton(
                                onPressed: () async {
                                  Get.defaultDialog(
                                    title:'تأكيد',
                                    titleStyle: TextStyle(
                                      fontSize: size.width * 0.05,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    middleText:'هل انت متأكد من عملية الحذف .. سيتم حذف المنتج بشكل نهائي ؟ ',
                                    middleTextStyle: TextStyle(
                                      fontSize: size.width * 0.04,
                                      color: Colors.black54,
                                      fontWeight: FontWeight.normal,
                                    ),
                                    backgroundColor: Colors.white,
                                    radius: size.width * 0.04,
                                    textCancel: 'رجوع',
                                    cancelTextColor: Colors.black,
                                    textConfirm: 'نعم',
                                    confirmTextColor: Colors.white,
                                    onCancel: () {
                                      Get.back();
                                      // to delete
                                    },
                                    onConfirm: () async {

                                      Itemstore item = Itemstore(
                                          type_categore: typeCategoryController.text
                                              .toString(),
                                          nameCategory: nameCategoryController
                                              .toString(),
                                          image: widget.type=='edit'?
                                          widget.itemstore!.image.toString():'',
                                          price: priceController.text.toString(),
                                          description: descriptionController.text
                                              .toString());
                                      item.IdItemStore=widget.itemstore!.IdItemStore;
                                      await addStoreProvider.deleteItemStore(item, widget.idStore);

                                      // authProvider.signOutFromApp();
                                    },
                                    buttonColor:
                                    mainColor, // Get.isDarkMode ? pinkClr : mainColor,
                                  );},
                                text: 'حذف الصنف'):Container(),
                          ],
                        )
                        // GetBuilder<CategoryStoreController>(builder: (_) {
                        //   return AuthButton(
                        //       onPressed: () {
                        //         // getController.docTyps.length;
                        //         // print(getController.docTyps.length);
                        //         // GetServices.GetTypes('types');
                        //         // getController.getTyps();
                        //         // print(GetServices.GetTypes('types'));

                        //         // getController.getStore('types');

                        //         if (fromKey.currentState!.validate()) {
                        //           controllerCategory.addCategory(
                        //             nameCollection: 'number1',
                        //             nameCategory: nameCategoryController.text,
                        //             description: descriptionController.text,
                        //             price: priceController.text,
                        //             image: imageController.text,

                        //             // nameCollecton: 'store',
                        //             // typename: selectedTypes.toString(),
                        //             // nameStore: nameStoreController.text,
                        //             // mobile: mobileController.text,
                        //             // location: locationController.text,
                        //             // storeId: Random().nextInt(100000000),
                        //           );

                        //           Get.back();
                        //         }
                        //       },
                        //       text: 'Add Store');
                        // }),
                      ),

                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget addImageBottomSheet({required Size size, required BuildContext context}) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
          height: size.height * 0.2,
          width: double.infinity,
          margin: EdgeInsets.symmetric(
            vertical: size.height * 0.01,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.06, vertical: size.height * 0.014),
            child:
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('اختر الصورة ',
                  style: TextStyle(
                      fontSize: size.width * 0.05,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54)),
              const Divider(
                thickness: 0.5,
                color: Colors.black12,
              ),
              InkWell(
                onTap: () {
                  // to  fetch photo from galeery
                  takePhoto(ImageSource.gallery, context);
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.photo_camera_back_outlined,
                      color: mainColor,
                      size: size.width * 0.08,
                    ),
                    SizedBox(
                      width: size.width * 0.03,
                    ),
                    Text('معرض الصور',
                        style: TextStyle(
                            fontSize: size.width * 0.045,
                            fontWeight: FontWeight.bold,
                            color: mainColor)),
                  ],
                ),
              ),
              const Divider(
                thickness: 0.5,
                color: Colors.black12,
              ),
              InkWell(
                onTap: () {
                  // to  fetch photo from camera
                  takePhoto(ImageSource.camera, context);
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.camera_alt_outlined,
                      color: mainColor,
                      size: size.width * 0.08,
                    ),
                    SizedBox(
                      width: size.width * 0.03,
                    ),
                    Text('التقط صورة',
                        style: TextStyle(
                            fontSize: size.width * 0.045,
                            fontWeight: FontWeight.bold,
                            color: mainColor)),
                  ],
                ),
              )
            ]),
          )),
    );
  }

  void takePhoto(ImageSource source, context) async {
    final pickedImage =
    await imagePicker.pickImage(source: source, imageQuality: 60);
    file = File(pickedImage!.path);
    // Provider.of<user_vm_provider>(context, listen: false).currentUser!.path =
    //     pickedFile!.path;

    // Navigator.of(context).pop();
  }
}
