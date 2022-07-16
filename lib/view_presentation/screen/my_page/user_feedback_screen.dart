import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:raselne/utilis/theme.dart';
import 'package:raselne/view_presentation/widget/text_utilis.dart';

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
          itemCount: name.length,
          itemBuilder: (context, index) {
            return buildNotes(size: size, name: name[index]);
          },
        ),
      ),
    );
  }

  buildNotes({required Size size, required String name}) {
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
                      text: name,
                      color: Colors.black45,
                      underLine: TextDecoration.none)
                ],
              ),
              RatingBarIndicator(
                // rating: rate,
                //to do
                rating: 5,
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
  }
}
