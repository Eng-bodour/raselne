import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data_layer/model/orderModel.dart';
import '../../data_layer/model/user_model.dart';
import '../../logic/controller/auth_controller.dart';
import '../../logic/controller/order_vm.dart';
import '../screen/chat/chat_screen.dart';

class waiting_aprrove_order extends StatelessWidget {
   waiting_aprrove_order({required this.orderModel, Key? key}) : super(key: key);
  OrderModel orderModel;
   // late UserModel user;

   @override
  Widget build(BuildContext context) {
     // user= Provider.of<AuthProvider_vm>(context,listen: true)
     //     .currentuser;

     var size = MediaQuery.of(context).size;

    return Scaffold(
      body: SizedBox(
        height: size.height,
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.03, vertical: size.height * 0.27),

          child: StreamBuilder(
            stream: Provider.of<order_vm>(context)
                .check_approve_order(orderModel.id_order),
            builder: (BuildContext context,
                AsyncSnapshot<OrderModel>
                snapshot) {
              if(snapshot.hasError){
                return Center(
                child:
                Text('something went wrong'+snapshot.error.toString()));
              }
              if(!snapshot.hasData){
                return Center(child: Text("waiting approve"));
              }
                return
                  Container(
                    height: size.width * 0.7,
                    child: ListView(
                    children: [
                      Center(child: Text('has data')),
                     snapshot.data!.isapprove==true?
                      Center(child:
                      RaisedButton(
                        child: Text('press'),
              onPressed: (){

                Navigator.push(context,
                    MaterialPageRoute(builder: (context)=>
                        ChatScreen(orderModel: orderModel,)));
              },
              ),
                      )
                     :Center(child: Text('تم رفض العرض')),
                    ],
                ),
                  );
            },
          ),
        ),
      ),
    );
  }
}
