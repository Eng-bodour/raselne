import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:raselne/constatnt.dart';
import 'package:raselne/logic/controller/types_Controller.dart';
import 'package:raselne/data_layer/model/store_model.dart';
import 'package:raselne/utilis/theme.dart';
import 'package:raselne/view_presentation/screen/store_details_screen.dart';

class BuildCard extends StatelessWidget {
  BuildCard({Key? key}) : super(key: key);
  final getController = Get.find<TypesController>();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Obx(() {
      if (getController.isLoading.value) {
        return const Center(
          child: CircularProgressIndicator(color: mainColor),
        );
      } else {
        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: titleStore.length,
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            childAspectRatio: 0.9, //MediaQuery.of(context).size.width * 0.9
            mainAxisExtent: 140,
            crossAxisSpacing: 3.0,
            mainAxisSpacing: 5.0,
            maxCrossAxisExtent: 280,
          ),
          itemBuilder: (context, index) {
            return buildCardCategory(
                image: imageList[index],
                //  item: getController.docTyps[index].name,
                item: titleStore[index],
                ontap: () {
                  Get.to(() => StoreDetailsScreen(
                        titleStore: titleStore[index],
                        subTitleStore: subTitleStore[index],
                      ));
                }
                // ontap: () => Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => listwidget[index])),
                );
          },
        );
      }
    });
  }

  Widget buildCardCategory({
    required String image,
    required String item,
    required Function() ontap,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: InkWell(
        onTap: ontap,
        child: Container(
          width: 150,
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
          child: Stack(
            children: [
              Positioned(
                  right: 20,
                  bottom: 2,
                  child: Container(
                    height: 30,
                    width: 120,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: Text(
                        item,
                        style: const TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
