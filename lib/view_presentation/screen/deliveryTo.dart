import 'package:flutter/material.dart';
import 'package:raselne/view_presentation/widget/specific%20store/map_location.dart';

class DeliveryToScreen extends StatelessWidget {
  const DeliveryToScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: map_location(
        type: 'التوصيل',
      ),
    )

        //     Container(
        //   child: const Center(
        //     child: Text(
        //       'hello',
        //       style: TextStyle(color: Colors.black),
        //     ),
        //   ),
        // )
        // map_location(
        //   type: 'التوصيل',
        // ),
        );
  }
}
