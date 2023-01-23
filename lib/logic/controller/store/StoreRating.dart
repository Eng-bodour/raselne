


import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:raselne/logic/controller/auth_controller.dart';
import 'package:raselne/logic/controller/store/store_controller.dart';
import 'package:raselne/utilis/theme.dart';
import 'package:raselne/view_presentation/widget/text_utilis.dart';

import '../../../data_layer/model/store_model.dart';

class StoreRating extends StatefulWidget {
  StoreRating({required this.storeModel, Key? key}) : super(key: key);
 StoreModel storeModel;
  @override
  State<StoreRating> createState() => _StoreRatingState();
}

class _StoreRatingState extends State<StoreRating> {
  final TextEditingController notedriver = TextEditingController();
  double rate=0;

  @override void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: size.height * 0.2),
              child: ModalProgressHUD(
                inAsyncCall: Provider.of<AuthProvider_vm>
                  (context,listen: true).isloading,
                child: ModalProgressHUD(
                  inAsyncCall: Provider.of<StoreProvider_vm>
                    (context,listen: true).isloading,

                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: CachedNetworkImage(
                              width: 1000,
                              height: 1000,
                              fit: BoxFit.fill,
                              imageUrl:  widget.storeModel!.imageStore.toString(),
                              placeholder: (context, url) =>
                              const CircularProgressIndicator(),
                              errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                            ),
                          ),
                        ),
                        // Container(
                        //   height: size.height * 0.15,
                        //   width: size.width * 0.3,
                        //   decoration: BoxDecoration(
                        //       image: const DecorationImage(
                        //           image: AssetImage(
                        //             'assets/images/home.png',
                        //           ),
                        //           fit: BoxFit.cover),
                        //       color: Colors.red,
                        //       borderRadius: BorderRadius.circular(size.height * 0.4)),
                        //
                        //   // const Text('')
                        // ),
                        TextUtils(
                            fontSize: size.width * 0.05,
                            fontWeight: FontWeight.bold,
                            text: 'كيف كانت تجربتك؟',
                            color: Colors.black45,
                            underLine: TextDecoration.none),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: size.width * 0.12,
                              vertical: size.height * 0.03),
                          child:
                          RatingBar.builder(
                            initialRating: 1,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: false,
                            itemCount: 5,
                            itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                            itemBuilder: (context, _) => Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            onRatingUpdate: (rating) {
                              print(rating);
                              setState(() {
                                rate=rating;
                                print(rate);
                              });
                            },
                          ),
                          // Row(
                          //     crossAxisAlignment: CrossAxisAlignment.start,
                          //     children: [
                          //       InkWell(
                          //         onTap: () {},
                          //         child: Column(
                          //           children: [
                          //             Image.asset(
                          //               'assets/rate/5.png',
                          //               fit: BoxFit.cover,
                          //             ),
                          //             SizedBox(
                          //               height: size.height * 0.01,
                          //             ),
                          //             const Text(
                          //               '5',
                          //               style: TextStyle(color: Colors.black),
                          //             )
                          //           ],
                          //         ),
                          //       ),
                          //       SizedBox(width: size.width * 0.04),
                          //       InkWell(
                          //         onTap: () {},
                          //         child: Column(
                          //           children: [
                          //             Image.asset(
                          //               'assets/rate/4.png',
                          //             ),
                          //             SizedBox(
                          //               height: size.height * 0.01,
                          //             ),
                          //             const Text(
                          //               '4',
                          //               style: TextStyle(color: Colors.black),
                          //             ),
                          //           ],
                          //         ),
                          //       ),
                          //       SizedBox(width: size.width * 0.04),
                          //       InkWell(
                          //         onTap: () {},
                          //         child: Column(
                          //           children: [
                          //             Image.asset(
                          //               'assets/rate/3.png',
                          //             ),
                          //             SizedBox(
                          //               height: size.height * 0.01,
                          //             ),
                          //             const Text(
                          //               '3',
                          //               style: TextStyle(color: Colors.black),
                          //             ),
                          //           ],
                          //         ),
                          //       ),
                          //       SizedBox(width: size.width * 0.04),
                          //       InkWell(
                          //         onTap: () {},
                          //         child: Column(
                          //           children: [
                          //             Image.asset(
                          //               'assets/rate/2.png',
                          //             ),
                          //             SizedBox(
                          //               height: size.height * 0.01,
                          //             ),
                          //             const Text(
                          //               '2',
                          //               style: TextStyle(color: Colors.black),
                          //             ),
                          //           ],
                          //         ),
                          //       ),
                          //       SizedBox(width: size.width * 0.04),
                          //       InkWell(
                          //         onTap: () {},
                          //         child: Column(
                          //           children: [
                          //             Image.asset(
                          //               'assets/rate/1.png',
                          //             ),
                          //             SizedBox(
                          //               height: size.height * 0.01,
                          //             ),
                          //             const Text(
                          //               '1',
                          //               style: TextStyle(color: Colors.black),
                          //             ),
                          //           ],
                          //         ),
                          //       )
                          //     ]),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: size.width * 0.08,
                          ),
                          child: showFeildText(),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: size.width * 0.06,
                              vertical: size.height * 0.02),
                          child: Row(
                            children: [
                              ElevatedButton(
                                  onPressed: () async {


                                    await  Provider.of<StoreProvider_vm>(context,listen: false)
                                        .rateStore(rate.toString(),
                                        widget.storeModel.IdStore.toString(),
                                        Provider.of<AuthProvider_vm>(context,listen: false).currentuser.uid.toString());
                                    Navigator.pop(context);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    primary: mainColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius.circular(size.width * 0.05),
                                    ), //Get.isDarkMode ? pinkClr : mainColor,
                                    minimumSize:
                                    Size(size.height * 0.2, size.width * 0.1),
                                  ),
                                  child: TextUtils(
                                    color: Colors.white,
                                    text: 'تم',
                                    fontSize: size.width * 0.04,
                                    fontWeight: FontWeight.bold,
                                    underLine: TextDecoration.none,
                                  )),
                              SizedBox(width: size.width * 0.02),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                style: ElevatedButton.styleFrom(
                                  elevation: 0,
                                  primary: greyColor.withOpacity(0.5),
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.circular(size.width * 0.05),
                                  ), //Get.isDarkMode ? pinkClr : mainColor,
                                  minimumSize:
                                  Size(size.height * 0.2, size.width * 0.1),
                                ),
                                child: TextUtils(
                                  color: Colors.white,
                                  text: 'ليس الآن',
                                  fontSize: size.width * 0.04,
                                  fontWeight: FontWeight.bold,
                                  underLine: TextDecoration.none,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ));
  }

  Widget showFeildText() {
    return TextFormField(
      controller: notedriver,
      maxLines: 2,
      keyboardType: TextInputType.text,
      validator: (value) {
        if (value.toString().length < 6) {
          return 'notes should be longer ';
        } else {
          return null;
        }
      },
      decoration: InputDecoration(
        fillColor: Colors.white,
        hintText: ' ملاحظات عن الستور',
        hintStyle: const TextStyle(
          color: Colors.black45,
          fontSize: f16,
          fontWeight: FontWeight.w500,
        ),
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: mainColor),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: mainColor),
          borderRadius: BorderRadius.circular(10),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: mainColor),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: mainColor),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}