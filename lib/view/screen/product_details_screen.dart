import 'package:flutter/material.dart';
import 'package:raselne/view/widget/text_utilis.dart';

class ProductDetailsScreen extends StatelessWidget {
  final String nameGategory;
  const ProductDetailsScreen({required this.nameGategory, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        title: TextUtils(
          fontSize: 20,
          fontWeight: FontWeight.normal,
          text: nameGategory.toString(),
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
        child: Column(
          children: const [
            // Text('nameGategory',
            //     style: TextStyle(
            //       color: Colors.black,
            //     )),
          ],
        ),
      ),
    );
  }
}
