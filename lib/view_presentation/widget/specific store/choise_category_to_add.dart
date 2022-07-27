import 'package:flutter/material.dart';
import 'package:raselne/utilis/theme.dart';

Widget choiceCategoreToAdd() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: const [
              Text('مسحب'),
            ],
          ),
          const Text('0.00sr'),
        ],
      ),
      Divider(
        thickness: 1,
        color: greyArrow.withOpacity(0.04),
      )
    ],
  );
}
