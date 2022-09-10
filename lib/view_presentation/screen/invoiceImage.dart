import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:raselne/data_layer/model/messages_model.dart';
import 'package:raselne/data_layer/model/orderModel.dart';
import 'package:raselne/utilis/theme.dart';
import 'package:raselne/view_presentation/widget/text_utilis.dart';

import '../../logic/controller/order_vm.dart';

class InvoiceImage extends StatefulWidget {
  InvoiceImage({required this.orderModel,Key? key}) : super(key: key);

  OrderModel orderModel;

  @override
  State<InvoiceImage> createState() => _InvoiceImageState();
}

class _InvoiceImageState extends State<InvoiceImage> {
  late File file;
  TextEditingController enterCostProduct = TextEditingController();
  @override void initState() {
    // TODO: implement initState
    enterCostProduct.text='0';
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('صورة الفاتورة'),
        centerTitle: true,
        backgroundColor: mainColor,
        elevation: 0,
      ),
      body: ModalProgressHUD(
        inAsyncCall: Provider.of<order_vm>(context,listen: true).isloading,
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: size.height * 0.02),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
                  child: Text(
                    'الخدمات الأكثر طلباً',
                    style: TextStyle(
                        fontSize: size.width * 0.04, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                TextFormField(
                  onChanged: (val){

                  },
                  controller: enterCostProduct,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    fillColor: mainColor.withOpacity(0.1),
                    hintText: 'أدخل تكلفة البضاعة',
                    hintStyle: TextStyle(
                      color: Colors.black45,
                      fontSize: size.width * 0.04,
                      fontWeight: FontWeight.w500,
                    ),
                    filled: true,
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
                  child: Text(
                    'قيمة المشتريات',
                    style: TextStyle(
                        color: Colors.black45, fontSize: size.width * 0.04),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:  [
                      Text(
                        'تكلفة التوصيل + الضريبة',
                        style: TextStyle(color: Colors.black45),
                      ),
                      Text(
                        ' ${widget.orderModel.price_deilvery} ر.س ',
                        style: TextStyle(color: Colors.black45),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:  [
                      Text(
                        'المجموع (يشمل الضريبة)',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        (double.parse(widget.orderModel.price_deilvery.toString())
                            +double.parse(enterCostProduct.text.toString())
                        ).toString(),
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
                  child: const Text(
                    'ملحق',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
                    child: Stack(
                      children: [
                        Container(
                          height: size.height * 0.15,
                          width: size.width * 0.35,
                          decoration: const BoxDecoration(
                              color: Colors.amber,
                              image: DecorationImage(
                                  image: AssetImage(''))),
                        ),
                        Positioned(
                            child: IconButton(
                              icon: const Icon(
                                Icons.add,
                                color: Colors.black45,
                              ),
                              onPressed: () async{
                            final _imagePicker = ImagePicker();
                            PickedFile? image;
    //Check Permissions
    // await Permission.photos.request();

    // var permissionStatus = await Permission.photos.status;

    // if (permissionStatus.isGranted){
    //Select Image
               image = await _imagePicker.getImage(source: ImageSource.gallery);
               file = File(image!.path);

                              },
                            ))
                      ],
                    ))
              ],
            ),
          ),
        ),
      ),
      bottomSheet: BottomAppBar(
        child: InkWell(
          onTap: () async{
            MessageText message=MessageText(
                senderId: 'senderId', type_message: 'invoice');
            message.textMessage=enterCostProduct.text.toString();
            message.valueCost=widget.orderModel.total.toString();
            await   Provider.of<order_vm>(context,listen: false)
            .addInvoice(file, message, widget.orderModel.id_order);
            Navigator.pop(context);
          },
          child: Container(
            width: size.width * 1,
            height: size.height * 0.1,
            decoration: const BoxDecoration(color: mainColor),
            child: Center(
                child: TextUtils(
                    fontSize: size.width * 0.05,
                    fontWeight: FontWeight.bold,
                    text: 'تم',
                    color: Colors.white,
                    underLine: TextDecoration.none)),
          ),
        ),
        color: mainColor,
      ),
    );
  }
}