import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:raselne/logic/controller/order_vm.dart';
import 'package:raselne/utilis/theme.dart';
import 'package:raselne/view_presentation/widget/text_utilis.dart';

import '../../../data_layer/model/DetailOrder.dart';

class BuildListNewOrder extends StatefulWidget {
  BuildListNewOrder({Key? key}) : super(key: key);

  @override
  State<BuildListNewOrder> createState() => _BuildListNewOrderState();
}

class _BuildListNewOrderState extends State<BuildListNewOrder> {
  var controller = ScrollController();

  List<DetailOrder> listitem=[];

  @override void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      // Provider.of<order_vm>(context, listen: false).get_item_is_ordered();
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    listitem=   Provider.of<order_vm>(context,listen: true).list_itemorder;
    var size = MediaQuery.of(context).size;
    // List<String> name = [
    //   '1n',
    //   '2',
    //   '3',
    //   '4',
    //   '5',
    //   '6',
    //   '7',
    //   '8',
    //   '9',
    //   '10',
    //   '11',
    //   '12',
    //   '13',
    //   '14',
    //   '15',
    //   '16',
    //   '17',
    //   '18',
    //   '19',
    //   '20'
    // ];

    return ListView.separated(
      shrinkWrap: true,
      controller: controller,
      scrollDirection: Axis.vertical,
      // physics: const NeverScrollableScrollPhysics(),

      itemCount: listitem.length,

      itemBuilder: (BuildContext context, int index) {
        return Padding(
            padding: const EdgeInsets.all(8),
            child: InkWell(
              //  onTap: ontap,
              child: Padding(
                padding: EdgeInsets.all(size.height * 0.01),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextUtils(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          text: listitem[index].item.nameCategory, //'اسم الوجبة ',
                          color: greyColor,
                          underLine: TextDecoration.none,
                        ),
                        TextUtils(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          text: listitem[index].item.description, //'اسم الوجبة ',
                          color: greyColor,
                          underLine: TextDecoration.none,
                        ),
                        Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  String id= listitem[index].item.IdItemStore;

                                  Provider.of<order_vm>(context,listen:false ).add_quaintity(id);
                                },
                                icon: Container(
                                  child: const Icon(
                                    Icons.add,
                                    color: Colors.black45,
                                  ),
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black),
                                      borderRadius: BorderRadius.circular(20)),
                                )),
                            Column(
                              children: [
                                TextUtils(
                                    fontSize: size.width * 0.06,
                                    fontWeight: FontWeight.bold,
                                    text: listitem[index].quaintity.toString(),
                                    color: Colors.orange,
                                    underLine: TextDecoration.none),
                                SizedBox(
                                  height: size.height * 0.02,
                                ),
                                TextUtils(
                                    fontSize: size.width * 0.03,
                                    fontWeight: FontWeight.bold,
                                    text:  listitem[index].total_item.toString(),
                                    color: Colors.black45,
                                    underLine: TextDecoration.none),
                              ],
                            ),
                            IconButton(
                                onPressed: () {
                                  String id= listitem[index].item.IdItemStore;

                                  Provider.of<order_vm>(context,listen:false ).remove_quaintity(id);
                                },
                                icon: Container(
                                  // margin: const EdgeInsets.only(bottom: 2),
                                  child: const Icon(Icons.remove,
                                      color: Colors.red),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black),
                                    shape: BoxShape.circle,
                                  ),
                                )),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ));
      },
      separatorBuilder: (context, index) => const Divider(
        thickness: 1,
      ),
    );
  }
}
