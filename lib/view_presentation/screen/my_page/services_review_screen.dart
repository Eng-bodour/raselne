import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:raselne/view_presentation/widget/text_utilis.dart';

class ServicesReview extends StatelessWidget {
  final String title;
  const ServicesReview({required this.title, Key? key}) : super(key: key);

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
          itemCount: 2,
          itemBuilder: (context, index) {
            return buildServicesReview(size: size);
          },
        ),
      ),
    );
  }

  buildServicesReview({required Size size}) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: size.width * 0.03,
        vertical: size.width * 0.01,
      ),
      child: Card(
        child: SizedBox(
          height: size.height * 0.15,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(Icons.shop),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextUtils(
                              fontSize: size.width * 0.03,
                              fontWeight: FontWeight.bold,
                              text: 'تموينات سيف الرياض',
                              color: Colors.black87,
                              underLine: TextDecoration.none),
                          TextUtils(
                              fontSize: size.width * 0.03,
                              fontWeight: FontWeight.normal,
                              text: 'سنتان  ',
                              color: Colors.black87,
                              underLine: TextDecoration.none)
                        ],
                      )
                    ],
                  ),
                  Row(
                    children: [
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
                        itemSize: size.width * 0.02,
                        direction: Axis.horizontal,
                      ),
                      TextUtils(
                          fontSize: size.width * 0.02,
                          fontWeight: FontWeight.normal,
                          text: '5.0',
                          color: Colors.black87,
                          underLine: TextDecoration.none),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.more_vert,
                            color: Colors.black87,
                          ))
                    ],
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {}, icon: const Icon(Icons.add)),
                        TextUtils(
                            fontSize: size.width * 0.02,
                            fontWeight: FontWeight.normal,
                            text: '0',
                            color: Colors.black87,
                            underLine: TextDecoration.none)
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.minimize_outlined)),
                        TextUtils(
                            fontSize: size.width * 0.02,
                            fontWeight: FontWeight.normal,
                            text: '0',
                            color: Colors.black87,
                            underLine: TextDecoration.none)
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
