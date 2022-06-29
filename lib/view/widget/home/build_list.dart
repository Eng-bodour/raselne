import 'package:flutter/material.dart';
import 'package:raselne/utilis/theme.dart';
import 'package:raselne/view/widget/text_utilis.dart';

class BuildList extends StatelessWidget {
  const BuildList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding:
          EdgeInsets.only(left: size.width * 0.02, right: size.width * 0.02),
      child: ListView.builder(
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
              padding: const EdgeInsets.all(8),
              child: InkWell(
                //  onTap: ontap,
                child: Container(
                  width: size.width * 0.4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(size.height * 0.01),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const CircleAvatar(
                              backgroundColor: greyColor,
                              backgroundImage:
                                  AssetImage('assets/images/user.png'),
                            ),
                            SizedBox(
                              width: size.width * 0.05,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                TextUtils(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  text: 'باسكن روبيز',
                                  color: greyColor,
                                  underLine: TextDecoration.none,
                                ),
                                TextUtils(
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                  text: 'حلويات ',
                                  color: greyColor,
                                  underLine: TextDecoration.none,
                                ),
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: const [
                                Icon(
                                  Icons.star,
                                  color: mainColor,
                                  size: f18,
                                ),
                                TextUtils(
                                  fontSize: f12,
                                  fontWeight: FontWeight.normal,
                                  text: '4.6',
                                  color: greyColor,
                                  underLine: TextDecoration.none,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                TextUtils(
                                    fontSize: f12,
                                    fontWeight: FontWeight.normal,
                                    text: '0.68',
                                    color: Colors.blue.shade300,
                                    underLine: TextDecoration.none),
                                TextUtils(
                                    fontSize: f12,
                                    fontWeight: FontWeight.normal,
                                    text: 'كم',
                                    color: greyColor.withOpacity(0.8),
                                    underLine: TextDecoration.none),
                              ],
                            ),
                          ],
                        ),

                        // Positioned(
                        //   right: 20,
                        //   bottom: 2,
                        //   child: Container(
                        //     height: 30,
                        //     width: 120,
                        //     decoration: BoxDecoration(
                        //       color: Colors.grey.withOpacity(0.3),
                        //       borderRadius: BorderRadius.circular(5),
                        //     ),
                        //     child: const Center(
                        //       child: Text(
                        //         'item',
                        //         style: TextStyle(
                        //             fontSize: 15,
                        //             color: Colors.white,
                        //             fontWeight: FontWeight.bold),
                        //       ),
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ),
              ));
        },
      ),
    );
  }
}
