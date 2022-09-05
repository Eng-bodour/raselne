import 'package:flutter/material.dart';
import 'package:raselne/utilis/theme.dart';
import 'package:raselne/view_presentation/widget/text_utilis.dart';

class InvoiceImage extends StatelessWidget {
  InvoiceImage({Key? key}) : super(key: key);
  TextEditingController enterCostProduct = TextEditingController();
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
      body: Directionality(
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
                  children: const [
                    Text(
                      'تكلفة التوصيل + الضريبة',
                      style: TextStyle(color: Colors.black45),
                    ),
                    Text(
                      '29.50 ر.س',
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
                  children: const [
                    Text(
                      'المجموع (يشمل الضريبة)',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '29.50 ر.س',
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
                            image: DecorationImage(image: AssetImage(''))),
                      ),
                      Positioned(
                          child: IconButton(
                            icon: const Icon(
                              Icons.close,
                              color: Colors.black45,
                            ),
                            onPressed: () {},
                          ))
                    ],
                  ))
            ],
          ),
        ),
      ),
      bottomSheet: BottomAppBar(
        child: InkWell(
          onTap: () {},
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