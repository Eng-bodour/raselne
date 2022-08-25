// import 'package:flutter/material.dart';
// import 'package:raselne/utilis/theme.dart';
//
// import 'package:group_button/group_button.dart';
// import 'package:grouped_list/grouped_list.dart';
//
// import '../../../data_layer/model/store_model.dart';
// import 'build_category_widget.dart';
//
// class TypesChoiseWidget extends StatefulWidget {
//    TypesChoiseWidget( {required this.itemstore, Key? key}) : super(key: key);
// List<Itemstore> itemstore;
//   @override
//   State<TypesChoiseWidget> createState() => _TypesChoiseWidgetState();
// }
//
// class _TypesChoiseWidgetState extends State<TypesChoiseWidget> {
//
//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;
//     var isSelected;
//
//     return Column(
//       children: [
//         Padding(
//           padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
//           child: ListView.builder(
//             itemCount: 1,
//             scrollDirection: Axis.horizontal,
//             itemBuilder: (BuildContext context, int index) {
//               return InkWell(
//                   //  onTap: ontap,
//                   child: Row(
//                 children: [
//                   IconButton(
//                     onPressed: () {},
//                     icon: const Icon(
//                       Icons.search,
//                       color: greyColor,
//                     ),
//                   ),
//                   GroupButton(
//                     buttons: const [
//                       'عروض',
//                       'الأطباق الرئيسية عادي',
//                       'الأطباق الرئيسية صغير',
//                       'وجبات الرشاقة',
//                       'الأطباق الجانبية',
//                       'المشروبات'
//                     ],
//                     onSelected:
//                         (String string, int indexSelected, bool isSelected) {
//                       //setState(() {
//                       isSelected = isSelected;
//                       int index = indexSelected;
//                       // print('$index : $isSelected');
//                     },
//                     options: GroupButtonOptions(
//                         borderRadius: BorderRadius.circular(20),
//                         selectedColor: mainColor,
//                         unselectedColor: greyColor,
//                         buttonHeight: size.height * 0.03,
//                         textPadding:
//                             EdgeInsets.symmetric(horizontal: size.width * 0.03)),
//                     controller: GroupButtonController(
//                       selectedIndex: 0,
//                     ),
//                   ),
//                 ],
//               ));
//             },
//           ),
//         ),
//
//         GroupedListView<Itemstore, String>(
//           elements:  widget.itemstore,
//           groupBy: (element)=>element.type_categore,
//           groupComparator: (value1, value2) =>
//               value2.compareTo(value1),
//           itemComparator: (item1, item2) =>
//               item1.type_categore.compareTo(item2.type_categore),
//           order: GroupedListOrder.ASC,
//           useStickyGroupSeparators: true,
//           groupSeparatorBuilder: (String value) => Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Text(
//               value,
//               textAlign: TextAlign.center,
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//             ),
//           ),
//           itemBuilder: (c, element) {
//             return Container(
//               //children: _privilgelist.map(( key) {
//                 child:
//                 buildCategory(
//                   size: size,
//                   ontap: () {
//                     //  Get.to(const ImageProfile());
//                     // Get.to(() => StoreDetailsScreen(
//                     //       titleStore: titleStore[index],
//                     //       subTitleStore: subTitleStore[index],
//                     //     ));
//                   },
//                   context: context,
//                   item: element,
//                   // title:element.nameCategory, // 'كانتون بوكس',
//                   // image: 'assets/services/market.png',
//                   // price: element.price,
//                   // desc: element.description,
//                 ));
//
//           },
//         ),
//
//
//       ],
//     );
//   }
// }
