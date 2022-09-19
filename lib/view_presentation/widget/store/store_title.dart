import 'package:flutter/material.dart';
import 'package:raselne/utilis/theme.dart';

import '../text_utilis.dart';

class StoreTitle extends StatelessWidget {
  final String titleStore;
  final String subTitleStore;
  const StoreTitle(
      {required this.titleStore, required this.subTitleStore, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(right: size.width * 0.02),
            child: TextUtils(
              fontSize: size.width * 0.05,
              fontWeight: FontWeight.bold,
              text: subTitleStore,
              color: greyColor,
              underLine: TextDecoration.none,
            ),
          ),
          Row(
            children: [
              CircleAvatar(
                radius: size.width * 0.05,
                backgroundColor: mainColor,
                child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.folder,
                      size: 20,
                      color: Colors.white,
                    )),
              ),
              TextButton(
                  onPressed: () {},
                  child: Container(
                    height: size.height * 0.04,
                    width: size.width * 0.2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                          right: size.width * 0.02, left: size.width * 0.02),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.card_giftcard,
                            color: greyColor,
                          ),
                          SizedBox(
                            width: size.width * 0.01,
                          ),
                          const Text(
                            'بطاقة',
                            style: TextStyle(color: greyColor),
                          )
                        ],
                      ),
                    ),
                  ))
            ],
          )
        ],
      ),
    );
  }
}
