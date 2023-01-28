import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:raselne/data_layer/webServices/firebase.dart';
import 'package:raselne/logic/controller/auth_controller.dart';
import 'package:raselne/utilis/theme.dart';
import 'package:raselne/view_presentation/widget/mypage/logout_widget.dart';
import 'package:raselne/view_presentation/widget/mypage/notification_widget.dart';
import 'package:raselne/view_presentation/widget/text_utilis.dart';
import 'dart:io';
class InfoUser extends StatelessWidget {
   InfoUser({ required this.size, Key? key}) : super(key: key);
Size size;
   late File? file=null;
   ImagePicker imagePicker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(

          children: [
            InkWell(
              onTap: (){
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
              child:
              file==null?
              Provider.of<AuthProvider_vm>(context,listen: true).currentuser.imageuser !=''?
              CircleAvatar(
                radius: 30,
                child: ClipRRect(
                   borderRadius: BorderRadius.circular(50),
                  child: CachedNetworkImage(
                    width: 200,
                     height: 200,
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
              )
              : Image.file(file!, fit: BoxFit.fill),
            ),

            SizedBox(
              width: size.width * 0.04,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextUtils(
                    fontSize: size.width * 0.05,
                    fontWeight: FontWeight.bold,
                    text:
                        Provider.of<AuthProvider_vm>(context).currentuser.name,
                    //'Name Driver', //'${Firebase.name}',
                    color: Colors.black,
                    underLine: TextDecoration.none),
                RatingBarIndicator(
                  // rating: rate,
                  //to do
                  rating: //2.5,
                  Provider.of<AuthProvider_vm>(context,listen: true)
                 .currentuser.rataing,
                  itemBuilder: (context, index) => Icon(
                    Icons.star,
                    color: Colors.orange.withOpacity(0.4),
                  ),
                  itemCount: 5,
                  itemPadding: const EdgeInsets.only(left: 4),
                  itemSize: 20.0,
                  direction: Axis.horizontal,
                ),
              ],
            )
          ],
        ),
        Row(
          children: [
            InkWell(
              child: const Icon(Icons.notifications, color: mainColor),
              onTap: () {
                Get.to(const NotificationWidget());
              },
            ),
            SizedBox(
              width: size.width * 0.02,
            ),
            LogOutWidget(),
          ],
        ),
      ],
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
     await imagePicker.pickImage(source: source, imageQuality: 40);
     file = File(pickedImage!.path);
     // Provider.of<user_vm_provider>(context, listen: false).currentUser!.path =
     //     pickedFile!.path;
     Navigator.of(context).pop();
    if(file !=null) Provider.of<AuthProvider_vm>(context, listen: false).setImageProfileUser(file);
   }

}
