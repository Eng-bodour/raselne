import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:raselne/utilis/theme.dart';
import 'package:raselne/view_presentation/widget/text_utilis.dart';

class DriverRating extends StatefulWidget {
  DriverRating({Key? key}) : super(key: key);

  @override
  State<DriverRating> createState() => _DriverRatingState();
}

class _DriverRatingState extends State<DriverRating> {
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
              child: Column(
                children: [
                  Container(
                    height: size.height * 0.15,
                    width: size.width * 0.3,
                    decoration: BoxDecoration(
                        image: const DecorationImage(
                            image: AssetImage(
                              'assets/images/home.png',
                            ),
                            fit: BoxFit.cover),
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(size.height * 0.4)),

                    // const Text('')
                  ),
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
                            onPressed: () {


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
                          onPressed: () {},
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
        hintText: ' ملاحظات عن المندوب',
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