import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:raselne/logic/controller/auth_controller.dart';
import 'package:raselne/utilis/theme.dart';
import 'package:raselne/view_presentation/widget/text_utilis.dart';

import '../../../data_layer/model/user_model.dart';
import '../../../logic/controller/order_vm.dart';

class UserFeedBackScreen extends StatelessWidget {
  final String title;
  UserFeedBackScreen({required this.title, Key? key}) : super(key: key);
  List name = ['أحمد', 'بدور', 'اية', 'أيمن'];
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.black54,
          title: Text(
            title,
            style: const TextStyle(color: Colors.black54),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 1,
        ),
        body: ListView.builder(

          itemCount: Provider.of<AuthProvider_vm>(context).currentuser.rating.length,
          itemBuilder: (context, index) {
            return FutureBuilder(
                future: Provider.of<order_vm>(context,listen: false)
                    .getusercaptain(
                    Provider.of<AuthProvider_vm>(context)
                         .currentuser.rating[index].id_user.toString()),
                builder: (BuildContext context,
                    AsyncSnapshot<UserModel> snapshot_user) {
                  if (snapshot_user.hasError) {
                    return Text('something went wrong' +
                        snapshot_user.error.toString());
                  }
                  if (!snapshot_user.hasData) {
                    return Text("Loading");
                  }

                  return Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: size.width * 0.03,
                        vertical: size.width * 0.01,
                      ),
                      child: Card(
                          child: Container(
                            height: size.height * 0.1,
                            padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    snapshot_user.data!.imageuser!=''?
                                    CircleAvatar(
                                      radius: 30,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(50),
                                        child: CachedNetworkImage(
                                          width: 200,
                                          height: 200,
                                          fit: BoxFit.fill,
                                          imageUrl:
                                          snapshot_user.data!.imageuser
                                              .toString(),
                                          placeholder: (context, url) =>
                                          const CircularProgressIndicator(),
                                          errorWidget: (context, url, error) =>
                                          const Icon(Icons.error),
                                        ),
                                      ),
                                    ):
                                    const Icon(
                                      Icons.person_add_alt_1,
                                      color: mainColor,
                                    ),
                                    SizedBox(
                                      width: size.width * 0.05,
                                    ),
                                    TextUtils(
                                        fontSize: size.width * 0.05,
                                        fontWeight: FontWeight.bold,
                                        text: snapshot_user.data!.name.toString(),
                                        color: Colors.black45,
                                        underLine: TextDecoration.none)
                                  ],
                                ),
                                RatingBarIndicator(
                                  // rating: rate,
                                  //to do
                                  rating: Provider.of<AuthProvider_vm>(context)
                                         .currentuser.rating[index].value_rate,
                                  itemBuilder: (context, index) => Icon(
                                    Icons.star,
                                    color: Colors.orange.withOpacity(0.4),
                                  ),
                                  itemCount: 5,
                                  itemPadding: const EdgeInsets.only(left: 4),
                                  itemSize: size.width * 0.04,
                                  direction: Axis.horizontal,
                                ),
                              ],
                            ),
                          )));
                } );
              // buildNotes(size: size,context,
              //   rateInfo: Provider.of<AuthProvider_vm>(context)
              //       .currentuser.rating[index]);
          },
        ),
      ),
    );
  }

  // buildNotes({required Size size, required Rate rateInfo}) {
  //   return  FutureBuilder(
  //       future: Provider.of<order_vm>(context,listen: false)
  //       .getusercaptain(
  //       rateInfo.id_user.toString()),
  //   builder: (BuildContext context,
  //   AsyncSnapshot<UserModel> snapshot_user) {
  //   if (snapshot_user.hasError) {
  //   return Text('something went wrong' +
  //   snapshot_user.error.toString());
  //   }
  //   if (!snapshot_user.hasData) {
  //   return Text("Loading");
  //   }
  //
  //   return Padding(
  //         padding: EdgeInsets.symmetric(
  //           horizontal: size.width * 0.03,
  //           vertical: size.width * 0.01,
  //         ),
  //         child: Card(
  //             child: Container(
  //           height: size.height * 0.1,
  //           padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
  //           child: Row(
  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //             children: [
  //               Row(
  //                 children: [
  //                   snapshot_user.data!.imageuser!=''?
  //                   CircleAvatar(
  //                     radius: 30,
  //                     child: ClipRRect(
  //                       borderRadius: BorderRadius.circular(50),
  //                       child: CachedNetworkImage(
  //                         width: 200,
  //                         height: 200,
  //                         fit: BoxFit.fill,
  //                         imageUrl:
  //                         snapshot_user.data!.imageuser
  //                             .toString(),
  //                         placeholder: (context, url) =>
  //                         const CircularProgressIndicator(),
  //                         errorWidget: (context, url, error) =>
  //                         const Icon(Icons.error),
  //                       ),
  //                     ),
  //                   ):
  //                   const Icon(
  //                     Icons.person_add_alt_1,
  //                     color: mainColor,
  //                   ),
  //                   SizedBox(
  //                     width: size.width * 0.05,
  //                   ),
  //                   TextUtils(
  //                       fontSize: size.width * 0.05,
  //                       fontWeight: FontWeight.bold,
  //                       text: snapshot_user.data!.name.toString(),
  //                       color: Colors.black45,
  //                       underLine: TextDecoration.none)
  //                 ],
  //               ),
  //               RatingBarIndicator(
  //                 // rating: rate,
  //                 //to do
  //                 rating: rateInfo.value_rate,
  //                 itemBuilder: (context, index) => Icon(
  //                   Icons.star,
  //                   color: Colors.orange.withOpacity(0.4),
  //                 ),
  //                 itemCount: 5,
  //                 itemPadding: const EdgeInsets.only(left: 4),
  //                 itemSize: size.width * 0.04,
  //                 direction: Axis.horizontal,
  //               ),
  //             ],
  //           ),
  //         )));
  //   } );
  // }
}

