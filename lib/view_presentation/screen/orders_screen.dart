import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:raselne/data_layer/model/orderModel.dart';
import 'package:raselne/logic/controller/order_vm.dart';
import 'package:raselne/utilis/theme.dart';
import 'package:raselne/view_presentation/widget/text_utilis.dart';

import '../../data_layer/model/user_model.dart';
import '../../logic/controller/auth_controller.dart';
import '../widget/orders/build_orders.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  // late UserModel user;

  @override void initState() {
    // TODO: implement initState

    // WidgetsBinding.instance.addPostFrameCallback((_){
    //   // user= Provider.of<AuthProvider_vm>(context,listen: false)
    //   //     .currentuser;
    //   Provider.of<order_vm>(context,listen: false)
    //       .get_myorder(
    //       // user!.uid.toString()
    //       );
    // });

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('الطلبات'),
          backgroundColor: mainColor,
          centerTitle: true,
          elevation: 0,
        ),
        backgroundColor: Colors.grey.shade200,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
                child: Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: size.width * 0.03),
                        child: TextUtils(
                            fontSize: size.width * 0.05,
                            fontWeight: FontWeight.bold,
                            text: 'جميع الطلبات',
                            color: Colors.black54,
                            underLine: TextDecoration.none),
                      ),
                     // Consumer<order_vm>(
                     //     builder: (context, value, child) {
                     // return value.isloading==true?
                     // Center(
                     //   child: CircularProgressIndicator()
                     // ): value.mylist_order.length==0?
                     // Center(
                     //   child: Text('no order'),
                     // ) :
                      FutureBuilder(
                          future: Provider.of<order_vm>(context,listen: false).get_myorder(),
                          builder: (BuildContext context, AsyncSnapshot<List<OrderModel> > snapshot) {
                            if (snapshot.hasError) {
                              return Text('something went wrong' +
                                  snapshot.error.toString());
                            }
                            if (!snapshot.hasData) {
                              return Text("Loading");
                            }
                            return Column(
                       children: [
                         ListView.separated(
                           shrinkWrap: true,
                           controller: ScrollController(),
                           scrollDirection: Axis.vertical,
                           itemCount: snapshot.data!.length,
                           itemBuilder: (context, index) {
                             return buildCardOrders(
                                 orderModel: snapshot.data![index],
                                 size: size);
                           },
                           separatorBuilder: (context, index) =>
                               SizedBox(height: size.height * 0.02),
                         )
                       ],
                     );
   // }),
  }),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// build1CardOrders({required Size size}) {
//   return Padding(
//     padding: EdgeInsets.symmetric(
//       horizontal: size.width * 0.03,
//       vertical: size.width * 0.01,
//     ),
//     child: Card(
//       child: SizedBox(
//         height: size.height * 0.29,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Padding(
//               padding: EdgeInsets.symmetric(
//                   horizontal: size.width * 0.04, vertical: size.height * 0.01),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Row(
//                     children: [
//                       Container(
//                         decoration: const BoxDecoration(
//                             shape: BoxShape.circle, color: Colors.red),
//                         child: Icon(
//                           Icons.close,
//                           color: Colors.white,
//                           size: size.width * 0.04,
//                         ),
//                       ),
//                       SizedBox(
//                         width: size.width * 0.01,
//                       ),
//                       TextUtils(
//                           fontSize: size.width * 0.04,
//                           fontWeight: FontWeight.normal,
//                           text: 'ملغى',
//                           color: Colors.red,
//                           underLine: TextDecoration.none)
//                     ],
//                   ),
//                   TextUtils(
//                       fontSize: size.width * 0.04,
//                       fontWeight: FontWeight.normal,
//                       text: 'سنة',
//                       color: Colors.black54,
//                       underLine: TextDecoration.none)
//                 ],
//               ),
//             ),
//             const Divider(
//               thickness: 1,
//             ),
//             Row(
//               children: [
//                 CircleAvatar(
//                   backgroundColor: Colors.white,
//                   radius: size.width * 0.08,
//                   child: Icon(
//                     Icons.person,
//                     color: Colors.lightBlue.withOpacity(0.9),
//                     size: size.width * 0.06,
//                   ),
//                 ),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     TextUtils(
//                         fontSize: size.width * 0.04,
//                         fontWeight: FontWeight.bold,
//                         text: 'اسم المطعم', //'${Firebase.name}',
//                         color: Colors.black54,
//                         underLine: TextDecoration.none),
//                     Row(
//                       children: [
//                         RatingBarIndicator(
//                           // rating: rate,
//                           //to do
//                           rating: 5,
//                           itemBuilder: (context, index) => Icon(
//                             Icons.star,
//                             color: Colors.orange.withOpacity(0.4),
//                           ),
//                           itemCount: 5,
//                           itemPadding: const EdgeInsets.only(left: 4),
//                           itemSize: size.width * 0.03,
//                           direction: Axis.horizontal,
//                         ),
//                         TextUtils(
//                             fontSize: size.width * 0.02,
//                             fontWeight: FontWeight.normal,
//                             text: '4.6',
//                             color: Colors.black54,
//                             underLine: TextDecoration.none)
//                       ],
//                     ),
//                   ],
//                 )
//               ],
//             ),
//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
//               child: TextUtils(
//                   fontSize: size.width * 0.04,
//                   fontWeight: FontWeight.normal,
//                   text: 'وصف الطلب',
//                   color: Colors.black54,
//                   underLine: TextDecoration.none),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Padding(
//                   padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
//                   child: Row(
//                     children: [
//                       TextUtils(
//                           fontSize: size.width * 0.04,
//                           fontWeight: FontWeight.normal,
//                           text: 'المجموع',
//                           color: Colors.black54,
//                           underLine: TextDecoration.none),
//                       SizedBox(width: size.width * 0.02),
//                       TextUtils(
//                           fontSize: size.width * 0.04,
//                           fontWeight: FontWeight.normal,
//                           text: '200 رس',
//                           color: mainColor,
//                           underLine: TextDecoration.none),
//                     ],
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
//                   child: TextUtils(
//                       fontSize: size.width * 0.04,
//                       fontWeight: FontWeight.normal,
//                       text: 'كم 2.7',
//                       color: Colors.black54,
//                       underLine: TextDecoration.none),
//                 ),
//               ],
//             ),
//             ElevatedButton(
//                 onPressed: () {},
//                 style: ButtonStyle(
//                     elevation: MaterialStateProperty.all(0),
//                     backgroundColor: MaterialStateProperty.all(mainColor)),
//                 child: Padding(
//                   padding: EdgeInsets.symmetric(horizontal: size.width * 0.25),
//                   child: Row(
//                     children: [
//                       Text('إعادة الطلب',
//                           style: TextStyle(
//                             fontSize: size.width * 0.045,
//                           )),
//                       SizedBox(
//                         width: size.width * 0.02,
//                       ),
//                       const Icon(
//                         Icons.refresh_outlined,
//                       ),
//                     ],
//                   ),
//                 ))
//           ],
//         ),
//       ),
//     ),
//   );
// }
