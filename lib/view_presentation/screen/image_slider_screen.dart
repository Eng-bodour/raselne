import 'package:flutter/material.dart';

class ImageSliderScreen extends StatelessWidget {
  final int index;
  const ImageSliderScreen({required this.index, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$index'),
        centerTitle: true,
      ),
      body: Text('$index'),
    );
  }
}
