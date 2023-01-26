import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:raselne/data_layer/model/orderModel.dart';
import 'package:raselne/data_layer/model/store_model.dart';
import 'package:raselne/utilis/theme.dart';
import 'package:raselne/view_presentation/widget/text_utilis.dart';

import '../../../logic/controller/auth_controller.dart';
import '../../../logic/controller/store/StoreRating.dart';
import '../../../logic/controller/store/store_controller.dart';
import '../../../services/polyline_service.dart';
import '../../screen_driver/driver_rating.dart';

class FirstContainerWedgit extends StatelessWidget {
  final Size size;
 StoreModel storeModel;
 int index;
   FirstContainerWedgit({
     required this.index,
     required this.storeModel,
     required this.size, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = size.width;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            InkWell(
              onTap: () {
                showModalBottomSheet<dynamic>(
                  backgroundColor: Colors.grey.shade200,
                  //  backgroundColor: Colors.transparent,
                  elevation: 0,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft:  Radius.circular(20),
                        topRight: Radius.circular(20),
                      )),
                  context: context,
                  isScrollControlled: true,
                  builder: ((context) =>
                      StoreRating(
                       storeModel: storeModel,
                      )),
                  // builder: ((context) => bottomSheetWithChoiseMealAdditions(context)),
                );
              },
              child: Row(
                children: [
                  Icon(
                    Icons.star,
                    color: mainColor,
                    size: width * 0.05,
                  ),
                  TextUtils(
                      fontSize: width * 0.05,
                      fontWeight: FontWeight.normal,
                      text: Provider.of<StoreProvider_vm>(context, listen: true)
                          .liststore[index].rataing.toString(),
                      color: greyColor,
                      underLine: TextDecoration.none)
                ],
              ),
            ),
            // Row(
            //   children: [
            //     TextUtils(
            //         fontSize: width * 0.03,
            //         fontWeight: FontWeight.normal,
            //         text: 'مشاركات',
            //         color: greyColor,
            //         underLine: TextDecoration.none),
            //     TextUtils(
            //         fontSize: width * 0.034,
            //         fontWeight: FontWeight.normal,
            //         text: '19.8K',
            //         color: greyColor,
            //         underLine: TextDecoration.none),
            //   ],
            // )
                TextUtils(
                    fontSize: width * 0.034,
                    fontWeight: FontWeight.normal,
                    text: 'تقييم',
                    color: greyColor,
                    underLine: TextDecoration.none),
          ],
        ),
        // SizedBox(
        //   width: width * 0.16,
        // ),
        Container(
          child: Row(
            children: [
              Icon(
                Icons.access_time_sharp,
                color: greyColor,
                size: width * 0.05,
              ),
              TextUtils(
                  fontSize: width * 0.05,
                  fontWeight: FontWeight.normal,
                  text:storeModel.stateStore.toString(), //'مفتوح',
                  color: greyColor,
                  underLine: TextDecoration.none)
            ],
          ),
        ),
        // SizedBox(
        //   width: width * 0.16,
        // ),
        Container(
          child: Column(
            children: [
              Row(
                children: [
                  Icon(
                    Icons.location_on,
                    color: greyColor,
                    size: width * 0.05,
                  ),
                  TextUtils(
                      fontSize: width * 0.04,
                      fontWeight: FontWeight.normal,
                      text: 'المتجر',
                      color: greyColor,
                      underLine: TextDecoration.none)
                ],
              ),
              Row(
                children: [
                  TextUtils(
                      fontSize: width * 0.03,
                      fontWeight: FontWeight.normal,
                      text: ' يبعد  ',
                      color: greyColor,
                      underLine: TextDecoration.none),
                  TextUtils(
                      fontSize: width * 0.03,
                      fontWeight: FontWeight.normal,
                      text: '${PolylineService().calcDistance([
                        LatLng(Provider.of<AuthProvider_vm>(context).currentuser.
                        location!.latitude,
                            Provider.of<AuthProvider_vm>(context).currentuser.
                        location!.longitude),
                        LatLng(storeModel.location!.latitude,
                           storeModel.location!.longitude)
                      ])}  كم ',
                      color: greyColor,
                      underLine: TextDecoration.none),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
