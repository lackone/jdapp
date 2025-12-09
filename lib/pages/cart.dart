import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../common/alert_dialog.dart';
import '../provider/cart.dart';
import 'cart_item.dart';
import 'cart_list.dart';
import 'cart_num.dart';

class ShoopingCart extends StatefulWidget {
  final Map? arguments;

  ShoopingCart({Key? key, this.arguments}) : super(key: key);

  @override
  _ShoopingCartState createState() => _ShoopingCartState();
}

class _ShoopingCartState extends State<ShoopingCart> {
  bool isEdit = false;

  @override
  void initState() {
    super.initState();
    print("购物车初始化");
  }

  @override
  void dispose() {
    super.dispose();
  }

  void doCheckout() {
    final cart = Provider.of<Cart>(context, listen: false);
    var checkData = cart.getCheckData();

    if (checkData.isEmpty) {
      MyAlertDialog.show(context: context, title: "提示", content: "请选择商品");
      return;
    }

    Navigator.pushNamed(
      context,
      "/checkout",
      arguments: {"checkData": checkData},
    );
  }

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("购物车"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                isEdit = !isEdit;
              });
            },
            icon: Icon(Icons.launch, size: 36.sp, color: Colors.grey[500]!),
          ),
        ],
      ),
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 100.h),
            child: ListView.builder(
              itemBuilder: (context, index) {
                return CartItem(model: cart.cartList[index]);
              },
              itemCount: cart.cartNum,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 100.h,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                  top: BorderSide(color: Colors.grey[300]!, width: 0.5),
                ),
              ),
              //padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          child: Checkbox(
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            value: cart.isAllChecked(),
                            onChanged: (value) {
                              setState(() {
                                cart.allCartChecked(value!);
                              });
                            },
                            activeColor: Colors.red,
                          ),
                        ),
                        Text("全选"),
                        SizedBox(width: 10.w),
                        isEdit == false ? Text("共${cart.allNum}件") : Text(""),
                        SizedBox(width: 10.w),
                        isEdit == false
                            ? Text("共${cart.allPrice.toStringAsFixed(2)}元")
                            : Text(""),
                      ],
                    ),
                  ),
                  isEdit == false
                      ? Align(
                          alignment: Alignment.centerRight,
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              backgroundColor: Colors.red,
                              side: BorderSide(color: Colors.red, width: 1),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                            ),
                            onPressed: () {
                              doCheckout();
                            },
                            child: Text(
                              "结算",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        )
                      : Align(
                          alignment: Alignment.centerRight,
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              backgroundColor: Colors.red,
                              side: BorderSide(color: Colors.red, width: 1),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                            ),
                            onPressed: () {
                              setState(() {
                                cart.delCart();
                              });
                            },
                            child: Text(
                              "删除",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
