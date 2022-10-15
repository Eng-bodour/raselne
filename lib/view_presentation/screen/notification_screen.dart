import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../logic/controller/notify_vm.dart';
import '../widget/cardnotify.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_)async{
      await Provider.of<notifyvm>(context, listen: false)
          .getNotification();
    });
    //Provider.of<notifyvm>(context,listen: false).getNotification();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      title: const Text('Notification'),
      centerTitle: true,
    ),
    body:  Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        padding: const EdgeInsets.only(top:16.0),
        child: Center(
          child:
          Consumer<notifyvm> (
              builder: (context,value,child) {
                return value.listnotify.length==0?
                Text('')// CircularProgressIndicator()
                    :ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: value.listnotify.length,
                    itemBuilder: (context, index) {
                      return SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.all(0.7),
                            child:
                            // value.listnotify[index].typeNotify=="Approve"
                            // ?cardapprove1(
                            //   itemapprove: ApproveModel(
                            //       nameUser: "aya",
                            //       idApproveClient: '1',
                            //       dateApprove: '19-2-2021',
                            //       name_enterprise: 'جمعية خيرية', fkUser: '2',
                            //       nameRegoin: 'مكة المكرمة', fkClient: '',
                            //       isApprove: '', nameCountry: ''),)
                            //:
                            cardnotify(
                              itemNotify:
                              value.listnotify[index],
                            ),
                          ));
                    });
              } ),
        ),
      ),
    ),
    );
  }
}
