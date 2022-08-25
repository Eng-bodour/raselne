import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data_layer/model/orderModel.dart';
import '../../logic/controller/order_vm.dart';
import '../screen/chat/chat_screen.dart';

class waiting_aprrove_order extends StatelessWidget {
  const waiting_aprrove_order({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: StreamBuilder(
        stream: Provider.of<order_vm>(context).check_approve_order(),
        builder: (BuildContext context,
            AsyncSnapshot<OrderModel>
            snapshot) {
          if(snapshot.hasError){
            return Text('something went wrong');
          }
          if(snapshot.connectionState==ConnectionState.waiting){
            return Text("Loading");
          }
          return snapshot.data!.isopen==false?ChatScreen():Text('تم رفض العرض');

        },

      ),
    );
  }
}
