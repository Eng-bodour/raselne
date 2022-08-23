import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:raselne/utilis/theme.dart';

import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:raselne/view_presentation/widget/text_utilis.dart';

File? pickedFile;
ImagePicker imagePicker = ImagePicker();
Widget locationReceiveBottomSheet(BuildContext context) {
  TextEditingController addDetails = TextEditingController();
  Size size = MediaQuery.of(context).size;
  return Directionality(
    textDirection: TextDirection.rtl,
    child: Container(
        height: size.height * 0.9,
        width: double.infinity,
        margin: EdgeInsets.symmetric(
          vertical: size.height * 0.01,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('موقع تسليم الشحنة',
                      style: TextStyle(
                          fontSize: size.width * 0.045,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54)),
                  IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(Icons.close, color: Colors.black54))
                ],
              ),
            ),
            //this for map
            Container(
              height: size.height * 0.4,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(size.width * 0.01),
                  color: mainColor),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
              child: Container(
                height: size.height * 0.25,
                width: size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(size.width * 0.04),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.04,
                          vertical: size.height * 0.01),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.location_on,
                            color: Colors.black54,
                          ),
                          SizedBox(
                            width: size.width * 0.02,
                          ),
                          const Text(
                            'مكان الوكاشن المحدد من الخريطة',
                            style: TextStyle(color: Colors.black54),
                          )
                        ],
                      ),
                    ),
                    const Divider(
                      thickness: 1,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: size.width * 0.04,
                      ),
                      child: const Text(
                        'تفاصيل إضافية',
                        style: TextStyle(color: Colors.black54),
                      ),
                    ),
                    TextFormField(
                      controller: addDetails,
                      decoration: InputDecoration(
                        fillColor: mainColor.withOpacity(0.1),
                        hintText: 'رقم العمارة, رقم الشقة, علامة مميزة',
                        hintStyle: const TextStyle(
                          color: Colors.black45,
                          fontSize: f16,
                          fontWeight: FontWeight.w500,
                        ),
                        filled: true,
                      ),
                    ),
                    const Divider(
                      thickness: 1,
                    ),
                    InkWell(
                      onTap: () {
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
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.04,
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.camera_alt_outlined,
                              color: mainColor,
                            ),
                            SizedBox(
                              width: size.width * 0.02,
                            ),
                            const Text(
                              'قم بإضافة صورة لمدخل المنزل',
                              style: TextStyle(color: mainColor),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.04,
              ),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      /// authProvider.checkBox();
                    },
                    child: Container(
                        height: size.height * 0.04,
                        width: size.width * 0.08,
                        decoration: BoxDecoration(
                          color: Colors.black54,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child:
                            // authProvider.isCheckBox
                            //     ?

                            Image.asset(
                          'assets/images/check.png',
                          color: Colors.amber,
                        )
                        // : Container(),
                        ),
                  ),
                  SizedBox(
                    width: size.width * 0.02,
                  ),
                  Text('حفظ المكان لاستخدامه لاحقاً',
                      style: TextStyle(
                          fontSize: size.width * 0.045,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54)),
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.04,
              ),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  primary: mainColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(size.width * 0.05),
                  ), //Get.isDarkMode ? pinkClr : mainColor,
                  minimumSize: Size(size.height, size.width * 0.12),
                ),
                child: TextUtils(
                  color: Colors.white,
                  text: 'تأكيد مكان الاستلام',
                  fontSize: size.width * 0.05,
                  fontWeight: FontWeight.bold,
                  underLine: TextDecoration.none,
                ),
              ),
            )
          ],
        )),
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
            Text('تغيير الصورة الشخصية',
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
      await imagePicker.pickImage(source: source, imageQuality: 100);
  pickedFile = File(pickedImage!.path);
  // Provider.of<user_vm_provider>(context, listen: false).currentUser!.path =
  //     pickedFile!.path;

  // Navigator.of(context).pop();
}
