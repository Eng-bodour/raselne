import 'package:flutter/material.dart';
import 'package:raselne/model/store_model.dart';
import 'package:raselne/utilis/theme.dart';
import 'package:raselne/view/widget/store/store_list_build.dart';
import 'package:raselne/view/widget/store/store_title.dart';
import 'package:raselne/view/widget/text_utilis.dart';

class StoreDetailsScreen extends StatelessWidget {
  final String titleStore;
  final String subTitleStore;
  const StoreDetailsScreen(
      {required this.titleStore, required this.subTitleStore, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        title: TextUtils(
          fontSize: 20,
          fontWeight: FontWeight.normal,
          text: titleStore,
          color: Colors.black45,
          underLine: TextDecoration.none,
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                color: Colors.black54,
              ))
        ],
        foregroundColor: Colors.black54,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
              left: size.width * 0.02,
              right: size.width * 0.02,
              top: size.height * 0.02),
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Column(
              children: [
                // for first line
                StoreTitle(
                  subTitleStore: subTitleStore,
                  titleStore: titleStore,
                ),
                //for  tow lines its ListView
                StoreListBuild()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
