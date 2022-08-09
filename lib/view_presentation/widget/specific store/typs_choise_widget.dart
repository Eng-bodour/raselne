import 'package:flutter/material.dart';
import 'package:raselne/utilis/theme.dart';

import 'package:group_button/group_button.dart';

class TypesChoiseWidget extends StatefulWidget {
  const TypesChoiseWidget({Key? key}) : super(key: key);

  @override
  State<TypesChoiseWidget> createState() => _TypesChoiseWidgetState();
}

class _TypesChoiseWidgetState extends State<TypesChoiseWidget> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var isSelected;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
      child: ListView.builder(
        itemCount: 1,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
              //  onTap: ontap,
              child: Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search,
                  color: greyColor,
                ),
              ),
              GroupButton(
                buttons: const [
                  'عروض',
                  'الأطباق الرئيسية عادي',
                  'الأطباق الرئيسية صغير',
                  'وجبات الرشاقة',
                  'الأطباق الجانبية',
                  'المشروبات'
                ],
                onSelected:
                    (String string, int indexSelected, bool isSelected) {
                  //setState(() {
                  isSelected = isSelected;
                  int index = indexSelected;
                  // print('$index : $isSelected');
                },
                options: GroupButtonOptions(
                    borderRadius: BorderRadius.circular(20),
                    selectedColor: mainColor,
                    unselectedColor: greyColor,
                    buttonHeight: size.height * 0.03,
                    textPadding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.03)),
                controller: GroupButtonController(
                  selectedIndex: 0,
                ),
              ),
            ],
          ));
        },
      ),
    );
  }
}
