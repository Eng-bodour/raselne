import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:raselne/logic/controller/auth_controller.dart';
import 'package:raselne/logic/controller/store/store_controller.dart';
import 'package:raselne/utilis/theme.dart';
import 'package:raselne/view_presentation/screen/specific_store_screen.dart';

import '../../screen/store drawer/add_store.dart';
import '../text_utilis.dart';

class StoreListBuild extends StatefulWidget {
  StoreListBuild({required this.type, Key? key}) : super(key: key);
  String type;
  @override
  State<StoreListBuild> createState() => _StoreListBuildState();
}

class _StoreListBuildState extends State<StoreListBuild> {
  var controller = ScrollController();

  @override
  void initState() {

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      Provider.of<AuthProvider_vm>(context,listen: false).currentuser.type=='user'?
      await Provider.of<StoreProvider_vm>(context, listen: false)
          .getstores(widget.type):
      await Provider.of<StoreProvider_vm>(context, listen: false)
          .getstoresbyOwner(//store by owner
          Provider.of<AuthProvider_vm>(context,listen: false).currentuser.uid.toString(),
          widget.type);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return
      Consumer<StoreProvider_vm>(
        builder: (context, value, child) {
          return value.isloading == true
              ? Padding(
                  padding: EdgeInsets.symmetric(vertical: size.height * 0.3),
                  child: const CircularProgressIndicator(
                    color: mainColor,
                  ),
                )
              : value.liststore.isEmpty
                  ? const Center(child: Text(''))
                  : Column(
                      children: [
                        ListView.builder(
                          shrinkWrap: true,
                          controller: controller,
                          scrollDirection: Axis.vertical,
                          itemCount: value.liststore.length,
                          itemBuilder: (BuildContext context, int index) {
                            return value.liststore[index].isVisible == true
                                ? Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: InkWell(
                                      onTap: () {
                                        Get.to(() =>
                                          SpecificStoreScreen(
                                            idstore: value.liststore[index].IdStore.toString(),
                                            titestore:
                                                value.liststore[index].nameStore,
                                            // itemstore: value.liststore[index].itemstore,
                                            index: index));
                                      },
                                      child: Container(
                                        width: size.width * 0.4,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color: Colors.white,
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                            left: size.height * 0.02,
                                            right: size.height * 0.02,
                                            top: size.height * 0.01,
                                            bottom: size.height * 0.01,
                                          ),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  buildCardPhotoFromNetwork(
                                                      image:
                                                      value.liststore[index]
                                                          .imageStore.toString(),
                                                      // 'assets/services/card-digit.png',
                                                      size: size),
                                                  SizedBox(
                                                    width: size.width * 0.04,
                                                  ),
                                                  buildText(
                                                      title: value
                                                          .liststore[index]
                                                          .nameStore, //'برجر كنج',
                                                      content: value
                                                          .liststore[index]
                                                          .descStore, //'مطاعم, عروض توصيل',
                                                      deliveryPrice: value
                                                          .liststore[index]
                                                          .offer_value,
                                                      size: size),
                                                ],
                                              ),
                                              Padding(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: size.height * 0.02),
                                                child: Row(
                                                  children: [
                                                    buildSpace(
                                                        size: size,
                                                        rate: value
                                                            .liststore[index]
                                                            .rating
                                                            .toString(),
                                                        distance: ""),
                                                    //value.liststore[index].location.toString()),
                                                   IconButton(
                                                       onPressed: (){
                                                         Navigator.push(
                                                             context, MaterialPageRoute(
                                                             builder: (context) => AddStore(
                                                                 storemodel: value.liststore[index],
                                                                 type: 'edit',
                                                                 typeStore:widget.type)));
                                                       },
                                                       icon: Icon( Icons.edit))
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ))
                                : Container();
                          },
                        ),
                      ],
                    );
        },
      );
  }
}

Widget buildCardPhoto({required String image, required Size size}) {
  return Container(
    width: size.height * 0.06,
    height: size.height * 0.06,
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage(
          image,
        ),
        fit: BoxFit.fill,
      ),
      borderRadius: BorderRadius.circular(10),
      color: Colors.white,
    ),
    child: const Text(''),
  );
}
Widget buildCardPhotoFromNetwork({required String image, required Size size}) {
  return Container(
    width: size.height * 0.06,
    height: size.height * 0.06,

    child: ClipRRect(
      borderRadius: BorderRadius.circular(45),
      child:
      CachedNetworkImage(
        imageUrl: image,
        imageBuilder: (context, imageProvider) => Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover,
            ),
          ),
        ),
        placeholder: (context, url) =>
        const CircularProgressIndicator(),
        fit: BoxFit.fill,
      ),
    ),
  );
}

Widget buildText(
    {required String title,
    required String content,
    required String deliveryPrice,
    required Size size}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      TextUtils(
        fontSize: size.width * 0.04,
        fontWeight: FontWeight.bold,
        text: title,
        color: Colors.black,
        underLine: TextDecoration.none,
      ),
      TextUtils(
        fontSize: size.width * 0.03,
        fontWeight: FontWeight.bold,
        text: content,
        color: greyColor,
        underLine: TextDecoration.none,
      ),
      Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: mainColor.withOpacity(0.2)),
        width: size.width * 0.3,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
          child: Row(
            children: [
              Icon(
                Icons.car_rental_outlined,
                color: mainColor,
                size: size.width * 0.03,
              ),
              TextUtils(
                fontSize: size.width * 0.03,
                fontWeight: FontWeight.bold,
                text: 'توصيل',
                color: mainColor,
                underLine: TextDecoration.none,
              ),
              TextUtils(
                fontSize: size.width * 0.03,
                fontWeight: FontWeight.bold,
                text: '$deliveryPrice ر.س',
                color: mainColor,
                underLine: TextDecoration.none,
              ),
            ],
          ),
        ),
      )
    ],
  );
}

Widget buildSpace(
    {required Size size, required String distance, required String rate}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: greyColor.withOpacity(0.1)),
        width: size.width * 0.2,
        height: size.height * 0.03,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
          child: Row(
            children: [
              const Icon(
                Icons.location_on,
                color: greyColor,
                size: f12,
              ),
              SizedBox(
                width: size.width * 0.02,
              ),
              TextUtils(
                  fontSize: f12,
                  fontWeight: FontWeight.normal,
                  text: distance.toString(), //'0.58 كم',
                  color: greyColor,
                  underLine: TextDecoration.none)
            ],
          ),
        ),
      ),
      SizedBox(
        height: size.height * 0.006,
      ),
      Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: greyColor.withOpacity(0.1)),
        width: size.width * 0.14,
        height: size.height * 0.03,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
          child: Row(
            children: [
              const Icon(
                Icons.star,
                color: mainColor,
                size: f12,
              ),
              SizedBox(
                width: size.width * 0.02,
              ),
              TextUtils(
                  fontSize: f12,
                  fontWeight: FontWeight.normal,
                  text: rate.toString(), //'4.4 ',
                  color: greyColor,
                  underLine: TextDecoration.none)
            ],
          ),
        ),
      )
    ],
  );
}
