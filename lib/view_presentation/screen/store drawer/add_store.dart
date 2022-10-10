import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:raselne/data_layer/model/store_model.dart';
import 'package:raselne/logic/controller/auth_controller.dart';

import 'package:raselne/logic/controller/store/store_controller.dart';
import 'package:raselne/logic/controller/types_Controller.dart';

import 'package:raselne/utilis/theme.dart';
import 'package:raselne/view_presentation/widget/auth/auth_button.dart';
import 'package:raselne/view_presentation/widget/auth/auth_text_from_field.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:raselne/view_presentation/widget/text_utilis.dart';

import 'location_store.dart';
import 'dart:io';

class AddStore extends StatefulWidget {
  String typeStore;
  String type;
  StoreModel? storemodel;
  AddStore({
    // this.uid, //for id user that add store
    required this.typeStore,
    this.storemodel,
    required this.type,
    Key? key,
  }) : super(key: key);

  @override
  State<AddStore> createState() => _AddStoreState();
}

class _AddStoreState extends State<AddStore> {
  String? selectedTypes;
  final fromKey = GlobalKey<FormState>();

  final TextEditingController nameStoreController = TextEditingController();
  final TextEditingController descStoreController = TextEditingController();
  final TextEditingController stateStoreController = TextEditingController();
  final TextEditingController offerController = TextEditingController();

  // final TextEditingController typeStoreController = TextEditingController();

  final TextEditingController mobileController = TextEditingController();

  final TextEditingController locationController = TextEditingController();
  late File? file=null;
  ImagePicker imagePicker = ImagePicker();

  // final controllerStore = Get.put(AddStoreController());
  late LatLng location;
  ScrollController controller = ScrollController();
  Future<String> GetAddressFromLatLong(LatLng? position) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position!.latitude, position.longitude);
    print(placemarks);
    Placemark place = placemarks[0];
    String Address =
        '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
    return Address;
  }
  @override void dispose() {
    // TODO: implement dispose

    offerController.dispose();
    controller.dispose();
    nameStoreController.dispose();
    descStoreController.dispose();
    stateStoreController.dispose();
    mobileController.dispose();
    super.dispose();
  }
  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      if (widget.type == 'edit') {
        nameStoreController.text = widget.storemodel!.nameStore.toString();
        descStoreController.text = widget.storemodel!.descStore.toString();
        stateStoreController.text = widget.storemodel!.stateStore.toString();
        mobileController.text = widget.storemodel!.mobileStore.toString();
        String address =
            await GetAddressFromLatLong(widget.storemodel!.location);
        locationController.text = address;

        Provider.of<StoreProvider_vm>(context, listen: false)
            .setlocation(widget.storemodel!.location, address);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var addStoreProvider = Provider.of<StoreProvider_vm>(context);
    var typesProvider = Provider.of<TypesProvider>(context);

    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Store'),
        centerTitle: true,
        backgroundColor: mainColor,
        elevation: 0,
      ),
      body: ModalProgressHUD(
        inAsyncCall:
            Provider.of<StoreProvider_vm>(context, listen: true).isloading,
        child: SingleChildScrollView(
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
                          text: 'اسم المتجر',
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
                          if (value.toString().trim().isEmpty) {
                            //   print(controllerStore.isUsedName);
                            return 'Enter name';
                          } else {
                            //   print('false is');
                            return null;
                          }
                        },
                        prefixIcon: const Text(''),
                        suffixIcon: const Text(""),
                        hintText: 'اسم المتجر ',
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),

                      TextUtils(
                          fontSize: size.width * 0.04,
                          fontWeight: FontWeight.bold,
                          text: 'وصف المتجر',
                          color: greyColor,
                          underLine: TextDecoration.none),

                      AuthTextFromField(
                        read: false,
                        keyboardType: TextInputType.text,
                        controller: descStoreController,
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
                        hintText: 'وصف مختصر للمتجر ',
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      //type store
                      // TextUtils(
                      //     fontSize: size.width * 0.04,
                      //     fontWeight: FontWeight.bold,
                      //     text: 'نوع المحل',
                      //     color: greyColor,
                      //     underLine: TextDecoration.none),
                      // AuthTextFromField(
                      //   read: true,
                      //   keyboardType: TextInputType.text,
                      //   controller: typeStoreController,
                      //   obscureText: false,
                      //   validator: (value) {
                      //     // if (value.toString().length <= 2 ||
                      //     // /    !RegExp(validationName).hasMatch(value)) {
                      //     //   return 'Enter valid name';
                      //     // } else {
                      //     //   return null;
                      //     // }
                      //   },
                      //   prefixIcon: Container(
                      //     padding: EdgeInsets.symmetric(
                      //         horizontal: size.height * 0.06),
                      //     margin: EdgeInsets.only(top: size.height * 0.01),
                      //     child: DropdownButtonHideUnderline(
                      //       child: DropdownButton2(
                      //         hint: Text(typesProvider.docTyps[0].name,
                      //             style: const TextStyle(
                      //               color: Colors.black45,
                      //               fontSize: f16,
                      //               fontWeight: FontWeight.w500,
                      //             )),
                      //         items: typesProvider.docTyps
                      //             .map((item) => DropdownMenuItem<String>(
                      //                   value: item.name,
                      //                   child: Column(
                      //                     children: [
                      //                       Text(item.name,
                      //                           style: const TextStyle(
                      //                             color: Colors.black45,
                      //                             fontSize: f16,
                      //                             fontWeight: FontWeight.bold,
                      //                           )),
                      //                       const Divider(
                      //                         thickness: 0.7,
                      //                         color: mainColor,
                      //                       ),
                      //                     ],
                      //                   ),
                      //                 ))
                      //             .toList(),
                      //         value: selectedTypes,
                      //         onChanged: (value) {
                      //           setState(() {
                      //             selectedTypes = value as String;
                      //             // typeStoreController.text =
                      //             //     selectedTypes.toString();
                      //             print('$selectedTypes');
                      //           });
                      //         },
                      //         buttonHeight: size.height * 0.06,
                      //         buttonWidth: size.width * 0.4,
                      //         itemHeight: size.height * 0.06,
                      //       ),
                      //     ),
                      //   ),
                      //   suffixIcon: const Text(""),
                      //   hintText: '',
                      // ),
                      // // Obx(
                      // //   () => AuthTextFromField(
                      // //     read: true,
                      // //     keyboardType: TextInputType.text,
                      // //     controller: typeStoreController,
                      // //     obscureText: false,
                      // //     validator: (value) {
                      // //       // if (value.toString().length <= 2 ||
                      // //       // /    !RegExp(validationName).hasMatch(value)) {
                      // //       //   return 'Enter valid name';
                      // //       // } else {
                      // //       //   return null;
                      // //       // }
                      // //     },
                      // //     prefixIcon: Container(
                      // //       padding: EdgeInsets.symmetric(
                      // //           horizontal: size.height * 0.06),
                      // //       margin: EdgeInsets.only(top: size.height * 0.01),
                      // //       child: DropdownButtonHideUnderline(
                      // //         child: DropdownButton2(
                      // //           hint: Text(typesController.docTyps[0].name,
                      // //               style: const TextStyle(
                      // //                 color: Colors.black45,
                      // //                 fontSize: f16,
                      // //                 fontWeight: FontWeight.w500,
                      // //               )),
                      // //           items: typesController.docTyps
                      // //               .map((item) => DropdownMenuItem<String>(
                      // //                     value: item.name,
                      // //                     child: Column(
                      // //                       children: [
                      // //                         Text(item.name,
                      // //                             style: const TextStyle(
                      // //                               color: Colors.black45,
                      // //                               fontSize: f16,
                      // //                               fontWeight: FontWeight.bold,
                      // //                             )),
                      // //                         const Divider(
                      // //                           thickness: 0.7,
                      // //                           color: mainColor,
                      // //                         ),
                      // //                       ],
                      // //                     ),
                      // //                   ))
                      // //               .toList(),
                      // //           value: selectedTypes,
                      // //           onChanged: (value) {
                      // //             setState(() {
                      // //               selectedTypes = value as String;
                      // //               // typeStoreController.text =
                      // //               //     selectedTypes.toString();
                      // //               print('$selectedTypes');
                      // //             });
                      // //           },
                      // //           buttonHeight: size.height * 0.06,
                      // //           buttonWidth: size.width * 0.4,
                      // //           itemHeight: size.height * 0.06,
                      // //         ),
                      // //       ),
                      // //     ),
                      // //     suffixIcon: const Text(""),
                      // //     hintText: '',
                      // //   ),
                      // // ),
                      // SizedBox(
                      //   height: size.height * 0.02,
                      // ),
                      TextUtils(
                          fontSize: size.width * 0.04,
                          fontWeight: FontWeight.bold,
                          text: 'رقم المتجر',
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
                        hintText: 'رقم المتجر ',
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      TextUtils(
                          fontSize: size.width * 0.04,
                          fontWeight: FontWeight.bold,
                          text: 'حالة المتجر',
                          color: greyColor,
                          underLine: TextDecoration.none),
                      AuthTextFromField(
                        read: false,
                        keyboardType: TextInputType.text,
                        controller: stateStoreController,
                        obscureText: false,
                        validator: (value) {
                          if (value.toString().length == 9) {
                            return 'Enter valid name';
                          } else {
                            return null;
                          }
                        },
                        prefixIcon: const Text(''),
                        suffixIcon: const Text(""),
                        hintText: 'حالة المتجر ',
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      AuthTextFromField(
                        read: false,
                        keyboardType: TextInputType.numberWithOptions(decimal: true),
                        controller: offerController,
                        obscureText: false,
                        validator: (value) {

                        },
                        prefixIcon: const Text(''),
                        suffixIcon: const Text(""),
                        hintText: 'عرض توصيل  ',
                      ),

                      SizedBox(
                        height: size.height * 0.02,
                      ),

                      TextUtils(
                          fontSize: size.width * 0.04,
                          fontWeight: FontWeight.bold,
                          text: 'موقع المتجر',
                          color: greyColor,
                          underLine: TextDecoration.none),
                      AuthTextFromField(
                        read: true,
                        keyboardType: TextInputType.text,
                        controller: locationController,
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
                            onPressed: () {
                              // showModalBottomSheet<dynamic>(
                              //     backgroundColor: Colors.grey.shade200,
                              //     //  backgroundColor: Colors.transparent,
                              //     elevation: 0,
                              //     shape: const RoundedRectangleBorder(
                              //         borderRadius: BorderRadius.only(
                              //       topLeft: Radius.circular(20),
                              //       topRight: Radius.circular(20),
                              //     )),
                              //     context: context,
                              //     isScrollControlled: true,
                              //     builder: ((context) => location_store()));
                              // setlocation
                              //  location=Provider.of<StoreProvider_vm>(context)
                              Get.to( location_store());

                            },
                            icon: const Icon(Icons.location_pin)),
                        hintText:
                            'موقع  المتجر ${Provider.of<StoreProvider_vm>(context, listen: true).address_store}',
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      TextUtils(
                          fontSize: size.width * 0.04,
                          fontWeight: FontWeight.bold,
                          text: 'صورة المتجر',
                          color: greyColor,
                          underLine: TextDecoration.none),
                      AuthTextFromField(
                        read: false,
                        keyboardType: TextInputType.text,
                        // controller: locationController,
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
                            onPressed: () async {
                              // final _imagePicker = ImagePicker();
                              // PickedFile? image;
                              //
                              // image = await _imagePicker.getImage(
                              //     source: ImageSource.gallery,
                              //     //maxHeight: ,
                              //     imageQuality:60 );
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
                              // file = File(image!.path);
                            },
                            icon: const Icon(Icons.image)),
                        hintText: 'صورة المتجر',
                      ),
                      const SizedBox(
                        height: 6, //size.height * 0.1,
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          // top: size.height * 0.01,
                          left: size.width * 0.03,
                          bottom: size.height * 0.01,
                        ),
                        padding: EdgeInsets.symmetric(
                            horizontal: size.width * 0.06,
                            vertical: size.height * 0.03),
                        width: size.width * 0.75,
                        decoration: BoxDecoration(
                          color:
                              // isMe
                              //     ? greyColor.withOpacity(0.1)
                              //     :
                              mainColor.withOpacity(0.3),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20)),
                          // BorderRadius.only(
                          //   topLeft:
                          //   Radius.circular(
                          //       size.width *
                          //           0.1),
                          //   topRight:
                          //   Radius.circular(
                          //       size.width *
                          //           0.02),
                          //   bottomLeft:
                          //   Radius.circular(
                          //       size.width *
                          //           0.02),
                          //   bottomRight:
                          //   Radius.circular(
                          //       size.width *
                          //           0.1),
                          // )
                        ),
                        child: file == null
                            ? widget.type == 'edit'
                                ? ClipRRect(
                                    borderRadius: BorderRadius.circular(45),
                                    child: CachedNetworkImage(
                                      imageUrl: widget.storemodel!.imageStore
                                          .toString(),
                                      placeholder: (context, url) =>
                                          const CircularProgressIndicator(),
                                      errorWidget: (context, url, error) =>
                                          const Icon(Icons.error),
                                    ),
                                  )
                                : Container()
                            : Image.file(file!, fit: BoxFit.contain),
                        // Image.network(
                        //     snapshot.data![index].textMessage.toString(),
                        //   width: 30,
                        //   height: 35,
                        // )
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
                        child: AuthButton(
                            onPressed: () async {
                              // getController.docTyps.length;
                              // print(getController.docTyps.length);
                              // GetServices.GetTypes('types');
                              // getController.getTyps();
                              // print(GetServices.GetTypes('types'));

                              // getController.getStore('types');

                              if (fromKey.currentState!.validate()) {
                                if (widget.type == 'add' && file == null) {
                                  Get.snackbar(
                                    '',
                                    'حدد صورة للمتجر من فضلك',
                                    snackPosition: SnackPosition.BOTTOM,
                                    backgroundColor: Colors.green,
                                    colorText: Colors.white,
                                  );
                                } else {

                                  if(widget.type=='add')
                                    {
                                      StoreModel store = StoreModel(
                                          nameStore:
                                          nameStoreController.text.toString(),
                                          typeStore: widget
                                              .typeStore, //selectedTypes.toString(),
                                          mobileStore:
                                          mobileController.text.toString(),
                                          location: Provider.of<StoreProvider_vm>(
                                              context,
                                              listen: false)
                                              .location,
                                          offer_value: offerController.text.toString(),
                                          rating: '1.0',
                                          imageStore:'',
                                          itemstore: [],
                                          IdStore:
                                          '',
                                          descStore:
                                          descStoreController.text.toString(),
                                          idowner: Provider.of<AuthProvider_vm>(
                                              context,
                                              listen: false)
                                              .currentuser
                                              .uid
                                              .toString(),
                                          isVisible: false,
                                          stateStore:
                                          stateStoreController.text.toString());

                                      await addStoreProvider.SaveStore(
                                          fileimage: file,
                                          // nameCollecton: 'store',
                                          storeModel: store.toSnapchot(),
                                          type: widget.type);
                                      Get.back();
                                    }else{
                                    StoreModel store = StoreModel(
                                        nameStore:
                                        nameStoreController.text.toString(),
                                        typeStore: widget
                                            .typeStore, //selectedTypes.toString(),
                                        mobileStore:
                                        mobileController.text.toString(),
                                        location: Provider.of<StoreProvider_vm>(
                                            context,
                                            listen: false)
                                            .location,
                                        offer_value: offerController.text.toString(),
                                        rating: '1.0',
                                        imageStore: widget.type == 'edit'
                                            ? widget.storemodel!.imageStore
                                            .toString()
                                            : '',
                                        itemstore: [],
                                        IdStore:
                                        widget.storemodel!.IdStore.toString(),
                                        descStore:
                                        descStoreController.text.toString(),
                                        idowner: Provider.of<AuthProvider_vm>(
                                            context,
                                            listen: false)
                                            .currentuser
                                            .uid
                                            .toString(),
                                        isVisible: false,
                                        stateStore:
                                        stateStoreController.text.toString());

                                    await addStoreProvider.SaveStore(
                                        fileimage: file,
                                        // nameCollecton: 'store',
                                        storeModel: store.toSnapchot(),
                                        type: widget.type);
                                    Get.back();
                                  }
                                }
                              }
                            },
                            text: 'Save data Store'),
                        // GetBuilder<AddStoreController>(builder: (_) {
                        //   return AuthButton(
                        //       onPressed: () {
                        //         // getController.docTyps.length;
                        //         // print(getController.docTyps.length);
                        //         // GetServices.GetTypes('types');
                        //         // getController.getTyps();
                        //         // print(GetServices.GetTypes('types'));

                        //         // getController.getStore('types');
                        //         if (fromKey.currentState!.validate()) {
                        //           StoreModel store = StoreModel(
                        //               nameStore: nameStoreController.text,
                        //               typeStore: selectedTypes.toString(),
                        //               mobileStore: mobileController.text,
                        //               location: locationController.text);
                        //           controllerStore.addStore(
                        //               nameCollecton: 'store',
                        //               storeModel: store.toSnapchot());

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

  Widget addImageBottomSheet(
      {required Size size, required BuildContext context}) {
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

    Navigator.of(context).pop();
    setState(() {

    });
  }
}
