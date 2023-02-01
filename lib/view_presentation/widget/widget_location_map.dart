import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../data_layer/model/messages_model.dart';
import '../../utilis/theme.dart';
import '../screen/custom_map_location.dart';

class mapLocationMessage extends StatefulWidget {
   mapLocationMessage({required this.type, required this.message, required  this.size,Key? key}) : super(key: key);
   Size size;
   MessageText message;
   String type;

  @override
  State<mapLocationMessage> createState() => _mapLocationMessageState();
}

class _mapLocationMessageState extends State<mapLocationMessage> {
  final Completer<GoogleMapController> _mapController =
  Completer<GoogleMapController>();

  Uint8List? imageBytes;
  @override
  void initState()   {
    // if(widget.type=='map s')
      //استلام


    // TODO: implement initState
    //
    // WidgetsBinding.instance.addPostFrameCallback((_)async{
    //   await takeSnapShot();
    // });
      super.initState();
    }
  Future<void> takeSnapShot() async {
    GoogleMap(
        initialCameraPosition: CameraPosition(
        target: LatLng(widget.message.location!.latitude,
            widget.message.location!.longitude),
        zoom: 14,
      ),
      onMapCreated: (controller) async {
          print('inside on map ');
        final uin8list = await controller.takeSnapshot(); // its our screenshot
        imageBytes=uin8list;
        // For examle, we can convert this uin8list to base64 and send
        // to photohosting imgbb.com and get url on this image
        final base64image = base64Encode(uin8list!);

        //...api post request
      },
    );
    // GoogleMapController controller = await _mapController.future;
    // Future<void>.delayed(const Duration(milliseconds: 1000), () async {
    //   imageBytes = await controller.takeSnapshot();
    //   setState(() {});
    // });
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context)  {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: widget.size.height * 0.1, horizontal: widget.size.width * 0.2),
      child: Card(
        child: Container(
          height: widget.size.height * 0.4,
          decoration: BoxDecoration(
            border: Border.all(color: mainColor),
            borderRadius: BorderRadius.circular(
              widget.size.width * 0.02,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: widget.size.width * 0.02),
                child: Text(
                  widget.type=='map t'?
                  'التوصيل إلى':'الاستلام من ',
                  style: TextStyle(
                      fontSize: widget.size.width * 0.04, color: Colors.black45),
                ),
              ),
              SizedBox(
                height: widget.size.height * 0.01,
              ),
              Container(
                 height:  widget.size.height * 0.15,
                 color: mainColor.withOpacity(0.2),
                 child:Image.asset('assets/images/location.png'
                 ,fit: BoxFit.contain,
                 ),
                 // child: Image.memory(
                 //   imageBytes!,
                 //   fit: BoxFit.fill,
                 //   width: 10,
                 //   height: widget.size.height * 0.15 ,)
              ),
              SizedBox(
                height: widget.size.height * 0.01,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: widget.size.width * 0.02),
                child: Text(
                  ' اسم الشارع من الخريطة',
                  style: TextStyle(
                      fontSize: widget.size.width * 0.034, color: Colors.black45),
                ),
              ),
              SizedBox(
                height: widget.size.height * 0.01,
              ),
              Container(
                height: widget.size.height * 0.08,
                color: mainColor.withOpacity(0.2),
                child: Padding(
                  padding: EdgeInsets.only(
                      left: widget.size.width * 0.02,
                      right: widget.size.width * 0.02,
                      top: widget.size.height * 0.01),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.info,
                            color: mainColor,
                          ),
                          Text(
                            ' تفاصيل إضافية',
                            style: TextStyle(
                                fontSize: widget.size.width * 0.034, color: mainColor),
                          ),
                        ],
                      ),
                      Text(
                          widget.message.textMessage.toString(),
                        style: TextStyle(
                            fontSize: widget.size.width * 0.034, color: mainColor),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: widget.size.height * 0.01),
              Center(
                child: TextButton(
                    onPressed: () {
                     Navigator.push(context, MaterialPageRoute(
                         builder: (context)=>
                             custom_map_location(
                              type: widget.type,
                         from: LatLng(widget.message.location!.latitude,
                             widget.message.location!.longitude),
                         to: LatLng(widget.message.location!.latitude,
                             widget.message.location!.longitude) )));

                    }, //for to go togoogle map
                    child: Text(
                      'الانتقال إلى الخريطة',
                      style: TextStyle(
                          fontSize: widget.size.width * 0.04, color: mainColor),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}