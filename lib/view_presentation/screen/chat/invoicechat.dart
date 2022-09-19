import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:raselne/data_layer/model/messages_model.dart';

import '../../../utilis/theme.dart';

class invoice_chat extends StatelessWidget {
   invoice_chat({required this.messageText, required this.size, Key? key}) : super(key: key);
   MessageText messageText;
   Size size;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
      child: Card(
        child: Container(
            height: size.height * 0.18,
            decoration: BoxDecoration(
              border: Border.all(color: mainColor),
              borderRadius: BorderRadius.circular(
                size.width * 0.02,
              ),
            ),
            padding: EdgeInsets.symmetric(vertical: size.height * 0.01),
            child:
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
                child: Text(
                  'تم اصدار الفاتورة بواسطة  ${messageText.nameSenderInvoice.toString()}',
                  style: TextStyle(
                      fontSize: size.width * 0.03, color: Colors.black45),
                ),
              ),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'قيمة الطلب',
                        style: TextStyle(
                            fontSize: size.width * 0.03, color: Colors.black45),
                      ),
                      Text(
                          messageText.valueCost.toString(), //'95.0 SR',
                        style: TextStyle(
                            fontSize: size.width * 0.03, color: Colors.black45),
                      ),
                    ],
                  )),
              const Divider(
                thickness: 1,
                color: Colors.black12,
              ),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'قيمة التوصيل(شامل الضريبة)',
                        style: TextStyle(
                            fontSize: size.width * 0.03, color: Colors.black45),
                      ),
                      Text(
                       messageText.textMessage.toString(), //'24.0 SR',
                        style: TextStyle(
                            fontSize: size.width * 0.03, color: Colors.black45),
                      ),
                    ],
                  )),
              const Divider(
                thickness: 1,
                color: Colors.black12,
              ),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'المبلغ المستحق',
                        style: TextStyle(
                            fontSize: size.width * 0.03, color: Colors.black45),
                      ),
                      Text(
                          (double.parse( messageText.valueCost.toString())
                         +double.parse(messageText.textMessage.toString())).toString(), //'129.7.0 SR',
                        style: TextStyle(
                            fontSize: size.width * 0.03, color: Colors.black45),
                      ),
                    ],
                  )),
            ])),
      ),
    );
  }
}

