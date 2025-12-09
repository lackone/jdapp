import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../model/goods_model.dart';
import '../provider/cart.dart';
import 'cart_item.dart';
import 'checkout_item.dart';

class Checkout extends StatefulWidget {
  final Map? arguments;

  Checkout({Key? key, this.arguments}) : super(key: key);

  @override
  _CheckoutState createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  late List<GoodsModel> _checkData;
  double _allPrice = 0; //总价
  int _allNum = 0; //数量

  @override
  void initState() {
    super.initState();
    _checkData = widget.arguments!["checkData"];
    computeAllPrice();
  }

  // 计算总价和数量
  void computeAllPrice() {
    double allPrice = 0;
    int allNum = 0;
    _checkData.forEach((element) {
      if (element.isChecked == true) {
        allPrice += double.parse(element.price ?? "0") * (element.num ?? 0);
        allNum += element.num ?? 0;
      }
    });
    setState(() {
      _allPrice = allPrice;
      _allNum = allNum;
    });
  }

  @override
  Widget build(BuildContext context) {
    _checkData = widget.arguments!["checkData"];
    computeAllPrice();

    return Scaffold(
      appBar: AppBar(title: Text("结算")),
      body: Container(
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Column(
                children: [
                  Container(
                    child: Column(
                      children: [
                        // ListTile(
                        //   contentPadding: EdgeInsets.all(0),
                        //   leading: Icon(Icons.location_on, color: Colors.red),
                        //   title: Center(child: Text("请添加您的收货地址")),
                        //   trailing: Icon(
                        //     Icons.arrow_forward_ios,
                        //     color: Colors.grey[500]!,
                        //   ),
                        // ),
                        ListTile(
                          contentPadding: EdgeInsets.all(0),
                          leading: Icon(Icons.location_on, color: Colors.red),
                          title: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [Text("张三 13800000000"), Text("北京市海淀区")],
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.grey[500]!,
                          ),
                          onTap: () {
                            Navigator.pushNamed(context, "/addr_list");
                          },
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          return CheckoutItem(model: _checkData[index]);
                        },
                        itemCount: _checkData.length,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("商品总价：${_allPrice.toStringAsFixed(2)}"),
                        SizedBox(height: 10.h),
                        Divider(height: 1.h),
                        SizedBox(height: 10.h),
                        Text("立减：10"),
                        SizedBox(height: 10.h),
                        Divider(height: 1.h),
                        SizedBox(height: 10.h),
                        Text("运费：10"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              height: 100.h,
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                color: Colors.white,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Text(
                          "总价 ${_allPrice.toStringAsFixed(2)}",
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, "/pay");
                        },
                        child: Text("立即下单"),
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.red,
                          side: BorderSide(color: Colors.red),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.r),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
