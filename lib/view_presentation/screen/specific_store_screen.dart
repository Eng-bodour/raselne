import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:provider/provider.dart';

import 'package:raselne/constatnt.dart';
import 'package:raselne/data_layer/model/store_model.dart';
import 'package:raselne/logic/controller/order_vm.dart';
import 'package:raselne/logic/controller/store/store_controller.dart';
import 'package:raselne/utilis/theme.dart';
import 'package:raselne/view_presentation/screen/store%20drawer/add_category_store.dart';
import 'package:raselne/view_presentation/widget/specific%20store/Inside_namesOf_theItems_widget.dart';
import 'package:raselne/view_presentation/widget/specific%20store/first_container_widget.dart';
import 'package:raselne/view_presentation/widget/specific%20store/typs_choise_widget.dart';
import 'package:raselne/view_presentation/widget/text_utilis.dart';

import '../../data_layer/model/DetailOrder.dart';
import '../../data_layer/model/user_model.dart';
import '../../logic/controller/auth_controller.dart';
import '../widget/specific store/bottom_sheet_tomeal.dart';
import '../widget/specific store/build_category_widget.dart';
import 'new_order_screen.dart';
import 'package:get/get.dart';

class SpecificStoreScreen extends StatelessWidget {
  final int index;
  SpecificStoreScreen({required this.idstore, required this.titestore, required this.index, Key? key})
      : super(key: key);
  late List<Itemstore> itemstore;
  String titestore;
  String idstore;
  late UserModel user;

  Widget buildSliverAppBar({required Size size}) {
    return SliverAppBar(
      expandedHeight: size.height * 0.1,
      pinned: true,
      stretch: true,
      backgroundColor: greyColor,
      flexibleSpace: FlexibleSpaceBar(
        title: Padding(
          padding: EdgeInsets.only(
              top: size.height * 0.059, right: size.width * 0.02),
          child: Text(titestore
              // 'برجر كنج'
              ),
          // Stack(
          //   children: [
          //     Positioned(
          //       left: size.width * 0.03,
          //       bottom: size.height * 0.01,
          //       child: InkWell(
          //         onTap: () {},
          //         child: const CircleAvatar(
          //             backgroundColor: Colors.white,
          //             radius: 10,
          //             child: Icon(
          //               Icons.ios_share,
          //               color: Colors.black,
          //               size: 14,
          //             )),
          //       ),
          //     ),
          //     Row(
          //       children: [
          //         Container(
          //           child: const CircleAvatar(
          //             backgroundColor: Colors.white,
          //             radius: 10,
          //             child: Icon(
          //               Icons.food_bank,
          //               size: f14,
          //             ),
          //           ),
          //         ),
          //         SizedBox(
          //           width: size.width * 0.01,
          //         ),
          //         Container(
          //           child: Column(
          //             crossAxisAlignment: CrossAxisAlignment.start,
          //             mainAxisAlignment: MainAxisAlignment.center,
          //             children: const [
          //               TextUtils(
          //                   fontSize: 10,
          //                   fontWeight: FontWeight.bold,
          //                   text: 'برجر كنج',
          //                   color: Colors.white,
          //                   underLine: TextDecoration.none),
          //               // TextUtils(
          //               //     fontSize: 5,
          //               //     fontWeight: FontWeight.bold,
          //               //     text:
          //               //         'اطلب الحين واستمتع بالطعم الملكي المميز مع برجر كنج',
          //               //     color: Colors.white,
          //               //     underLine: TextDecoration.none)
          //             ],
          //           ),
          //         ),
          //       ],
          //     ),
          //   ],
          // ),
        ),
        background: Stack(
          children: [
            Image.asset(
              'assets/services/organic.png',
              fit: BoxFit.cover,
              width: double.infinity,
            ),
            Container(
              color: Colors.black.withOpacity(0.5),
              width: double.infinity,
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    user = Provider.of<AuthProvider_vm>(context, listen: true).currentuser;

    print(index);
    itemstore = Provider.of<StoreProvider_vm>(context, listen: true)
        .liststore[index]
        .itemstore;
    // print(itemstore[0].nameCategory);
    var size = MediaQuery.of(context).size;
    var width = size.width;
    var height = size.height;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        floatingActionButton:
        Provider.of<AuthProvider_vm>(context,listen: true)
            .currentuser.type=='store' ?
        FloatingActionButton(
          backgroundColor: mainColor,
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(
                builder: (context) => AddCategory(
                  idStore: idstore,
                  type: 'add',
                  itemstore: null,
                )));
          },
          tooltip: 'إضافة صنف',
          child: Icon(Icons.add),
        ):Container(),
        backgroundColor: Colors.white,
        body: CustomScrollView(
          slivers: [
            buildSliverAppBar(size: size),
            SliverList(
              //delegate: for item under image
              delegate: SliverChildListDelegate(
                [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: height * 0.02),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: width * 0.05),
                          child: FirstContainerWedgit(size: size),
                        ),
                        Divider(
                          thickness: 2,
                          color: greyColor.withOpacity(0.3),
                        ),
                        // SizedBox(
                        //     height: size.height * 0.05,
                        //     child: const TypesChoiseWidget()),

                        //group by
                        //TypesChoiseWidget(itemstore),
                        SizedBox(
                          height: 1500,
                          child: GroupedListView<Itemstore, String>(
                            elements: itemstore,
                            groupBy: (element) => element.type_categore,
                            groupComparator: (value1, value2) =>
                                value2.compareTo(value1),
                            itemComparator: (item1, item2) => item1
                                .type_categore
                                .compareTo(item2.type_categore),
                            order: GroupedListOrder.ASC,
                            useStickyGroupSeparators: true,
                            groupSeparatorBuilder: (String value) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                value,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ),
                            itemBuilder: (c, element) {
                              return
                                  //Container(

                                  //children: _privilgelist.map(( key) {
                                  // child:
                                  Stack(
                                      children: [
                                Container(
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: size.width * 0.03),
                                    child: InkWell(
                                      onTap: () {
                                        if(Provider.of<AuthProvider_vm>
                                          (context,listen: false).currentuser.type=='user')
                                        showModalBottomSheet<dynamic>(
                                            backgroundColor: Colors.white,
                                            //  backgroundColor: Colors.transparent,
                                            elevation: 0,
                                            shape: const RoundedRectangleBorder(
                                                borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(20),
                                              topRight: Radius.circular(20),
                                            )),
                                            context: context,
                                            isScrollControlled: true,
                                            builder: ((context) =>
                                                //
                                                bottomsheet(
                                                  orderitem: DetailOrder(
                                                      element,
                                                      element.price,
                                                      1),
                                                )));
                                       else {
                                         Navigator.push(context,
                                         MaterialPageRoute(builder:
                                             (context)=>AddCategory(
                                               idStore: idstore,
                                               itemstore: element,
                                               type: 'edit',
                                             )));
                                        }
                                        // builder: ((context) => bottomSheetWithChoiseMealAdditions(context)),
                                      },
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Divider(
                                            thickness: 1,
                                            color: greyColor,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            //crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              // Positioned(
                                              //     top:50,
                                              //     // right: 20,
                                              //     child: Container(
                                              //       width: 200,
                                              //       height: 30,
                                              //       color: Colors.red,
                                              //     )):

                                              //Container(),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        element.nameCategory,
                                                      ),
                                                      Text(element.description),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: size.height * 0.03,
                                                  ),
                                                  Text(element.price.toString())
                                                  //const Divider(thickness: 2)
                                                ],
                                              ),
                                              Container(
                                                width: size.width * 0.3,
                                                height: size.height * 0.13,
                                                decoration: BoxDecoration(
                                                  image: const DecorationImage(
                                                    image: AssetImage(
                                                        'assets/services/market.png'),
                                                    fit: BoxFit.fill,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color: Colors.white,
                                                ),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                element.isorder == true
                                    ? Positioned(
                                        child: Stack(children: [
                                        Container(
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                top: size.height * 0.038),
                                            child: Container(
                                              height: 100,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          size.width * 0.01),
                                                  color: mainColor
                                                      .withOpacity(0.1)),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                top: size.height * 0.08,
                                                right: size.width * 0.7),
                                            child: Row(
                                              children: [
                                                InkWell(
                                                  onTap: () {
                                                    print('bbbbbbbb');
                                                    showModalBottomSheet<
                                                            dynamic>(
                                                        backgroundColor:
                                                            Colors.white,
                                                        //  backgroundColor: Colors.transparent,
                                                        elevation: 0,
                                                        shape:
                                                            const RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  20),
                                                          topRight:
                                                              Radius.circular(
                                                                  20),
                                                        )),
                                                        context: context,
                                                        isScrollControlled:
                                                            true,
                                                        builder: ((context) =>
                                                            bottomsheet(
                                                              orderitem:
                                                                  DetailOrder(
                                                                      element,
                                                                      element
                                                                          .price,
                                                                      1),
                                                            )));
                                                  },
                                                  child: Container(
                                                    width: size.width * 0.1,
                                                    height: size.height * 0.05,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
                                                        color: mainColor),
                                                    child: const Icon(
                                                      Icons.add,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: size.width * 0.04,
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    Get.defaultDialog(
                                                      title: "",
                                                      titleStyle: TextStyle(
                                                        fontSize:
                                                            size.width * 0.04,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                      middleText:
                                                          'هل أنت متأكد من الحذف',
                                                      middleTextStyle:
                                                          TextStyle(
                                                        fontSize:
                                                            size.width * 0.05,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                      backgroundColor:
                                                          Colors.white,
                                                      radius: size.width * 0.04,
                                                      textCancel: 'حذف',
                                                      cancelTextColor:
                                                          Colors.black,
                                                      textConfirm: 'إغلاق',
                                                      confirmTextColor:
                                                          Colors.white,
                                                      onCancel: () {
                                                        // to delete
                                                      },
                                                      onConfirm: () {
                                                        Get.back();
                                                        // authProvider.signOutFromApp();
                                                      },
                                                      buttonColor:
                                                          mainColor, // Get.isDarkMode ? pinkClr : mainColor,
                                                    );
                                                  },
                                                  child: Container(
                                                    width: size.width * 0.1,
                                                    height: size.height * 0.05,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
                                                        color: mainColor),
                                                    child: const Icon(
                                                      Icons.delete_outlined,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ]))
                                    : Container()
                              ]);
                              // buildCategory(
                              //   size: size,
                              //   ontap: () {
                              //     // Navigator.of(context).push(
                              //     //     MaterialPageRoute(
                              //     //     builder: (context)=> bottomSheetToMeal(context,element)));
                              //     // //  Get.to(const ImageProfile());
                              //     // Get.to(() => StoreDetailsScreen(
                              //     //       titleStore: titleStore[index],
                              //     //       subTitleStore: subTitleStore[index],
                              //     //     ));
                              //   },
                              //   item:element,
                              //   context: context,
                              //
                              // )
                              // );
                            },
                          ),
                        ),
                        // Divider(
                        //   thickness: 1,
                        //   color: greyColor.withOpacity(0.3),
                        // ),

                        // ListView.builder(
                        //   shrinkWrap: true,
                        //
                        //   scrollDirection: Axis.vertical,
                        //   itemCount: typesTitle.length,
                        //   itemBuilder: (context, index) {
                        //     return InsideNamesOfTheItems(
                        //       typesTitle: typesTitle[index],
                        //     );
                        //   },
                        //   // separatorBuilder: (context, index) => Divider(
                        //   //   thickness: 5,
                        //   //   color: greyColor.withOpacity(0.2),
                        //   // ),
                        // ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        bottomSheet:
        Provider.of<AuthProvider_vm>(context,listen: true).currentuser.type=='user'?
        BottomAppBar(
          child: InkWell(
            onTap: () {
              Provider.of<order_vm>(context, listen: false).prepareOrder(
                  Provider.of<StoreProvider_vm>(context, listen: false)
                      .liststore[index]);
              // Provider.of<StoreProvider_vm>(context,listen : false).liststore[index]
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const NewOrderScreen()));
              // showDialog(
              //     context: context,
              //     builder: (context) {
              //       return Center(
              //         child: AlertDialog(
              //             title: Column(
              //               children: [
              //                 CircleAvatar(
              //                   radius: size.width * 0.09,
              //                   backgroundColor: greyColor.withOpacity(0.05),
              //                   child: Icon(
              //                     Icons.menu_book,
              //                     size: size.width * 0.1,
              //                     color: mainColor,
              //                   ),
              //                 ),
              //                 SizedBox(
              //                   height: size.height * 0.03,
              //                 ),
              //                 TextUtils(
              //                     fontSize: size.width * 0.042,
              //                     fontWeight: FontWeight.bold,
              //                     text:
              //                         'وفرنا لك منيو خاص يسهل عليك الطلب,ليش ماتجربه؟',
              //                     color: greyColor,
              //                     underLine: TextDecoration.none),
              //                 SizedBox(
              //                   height: size.height * 0.03,
              //                 ),
              //                 containerInkwell(
              //                   // ontap: () {},
              //                   isBorder: false,
              //                   size: size,
              //                   text: 'أكيد , راح اختار من المنيو',
              //                 ),
              //
              //                 // ),
              //                 SizedBox(
              //                   height: size.height * 0.01,
              //                 ),
              //                 containerInkwell(
              //                   // ontap: () {},
              //                   isBorder: true,
              //                   size: size,
              //                   text: 'لأ , بكتب طلبي بنفسي   ',
              //                 ),
              //               ],
              //             ),
              //             content: const Text('')),
              //       );
              //     });
            },
            child: Container(
              width: size.width * 1,
              height: size.height * 0.1,
              decoration: const BoxDecoration(color: mainColor),
              child: Center(
                  child: TextUtils(
                      fontSize: size.width * 0.05,
                      fontWeight: FontWeight.bold,
                      text: 'أرسل الطلب',
                      color: Colors.white,
                      underLine: TextDecoration.none)),
            ),
          ),
          color: mainColor,
        ):null,
      ),
    );
  }
}

// for bottom sheet
Widget containerInkwell({
  required Size size,
  required String text,
  required bool isBorder,
}) {
  return InkWell(
    child: Container(
      width: size.width * 0.9,
      height: size.height * 0.049,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(80),
          border: isBorder
              ? Border.all(color: mainColor)
              : Border.all(color: mainColor),
          color: isBorder ? Colors.white : mainColor),
      child: TextButton(
          onPressed: () {},
          child: TextUtils(
            color: isBorder ? mainColor : Colors.white,
            fontSize: size.width * 0.035,
            fontWeight: FontWeight.bold,
            text: text,
            underLine: TextDecoration.none,
          )),
    ),
  );
}
