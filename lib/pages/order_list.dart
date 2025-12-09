import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderList extends StatefulWidget {
  OrderList({Key? key}) : super(key: key);

  @override
  _OrderListState createState() => _OrderListState();
}

class _OrderListState extends State<OrderList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("订单列表")),
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(top: 100.h),
            child: ListView(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, "/order_info");
                  },
                  child: Card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ListTile(title: Text("订单编号：202308010001")),
                        ListTile(
                          leading: Container(
                            width: 80.w,
                            height: 80.w,
                            child: Image.asset(
                              "lib/images/list1.jpg",
                              fit: BoxFit.cover,
                            ),
                          ),
                          title: Text("商品名称：商品1"),
                          trailing: Text("x1"),
                        ),
                        ListTile(
                          leading: Container(
                            width: 80.w,
                            height: 80.w,
                            child: Image.asset(
                              "lib/images/list1.jpg",
                              fit: BoxFit.cover,
                            ),
                          ),
                          title: Text("商品名称：商品1"),
                          trailing: Text("x1"),
                        ),
                        ListTile(
                          leading: Container(
                            width: 80.w,
                            height: 80.w,
                            child: Image.asset(
                              "lib/images/list1.jpg",
                              fit: BoxFit.cover,
                            ),
                          ),
                          title: Text("商品名称：商品1"),
                          trailing: Text("x1"),
                        ),
                        ListTile(
                          leading: Text("订单金额：¥100.00"),
                          trailing: TextButton(
                            style: TextButton.styleFrom(
                              side: BorderSide(color: Colors.grey, width: 1.w),
                              backgroundColor: Colors.grey,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.r),
                              ),
                            ),
                            onPressed: () {},
                            child: Text(
                              "申请售后",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, "/order_info");
                  },
                  child: Card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ListTile(title: Text("订单编号：202308010001")),
                        ListTile(
                          leading: Container(
                            width: 80.w,
                            height: 80.w,
                            child: Image.asset(
                              "lib/images/list1.jpg",
                              fit: BoxFit.cover,
                            ),
                          ),
                          title: Text("商品名称：商品1"),
                          trailing: Text("x1"),
                        ),
                        ListTile(
                          leading: Container(
                            width: 80.w,
                            height: 80.w,
                            child: Image.asset(
                              "lib/images/list1.jpg",
                              fit: BoxFit.cover,
                            ),
                          ),
                          title: Text("商品名称：商品1"),
                          trailing: Text("x1"),
                        ),
                        ListTile(
                          leading: Container(
                            width: 80.w,
                            height: 80.w,
                            child: Image.asset(
                              "lib/images/list1.jpg",
                              fit: BoxFit.cover,
                            ),
                          ),
                          title: Text("商品名称：商品1"),
                          trailing: Text("x1"),
                        ),
                        ListTile(
                          leading: Text("订单金额：¥100.00"),
                          trailing: TextButton(
                            style: TextButton.styleFrom(
                              side: BorderSide(color: Colors.grey, width: 1.w),
                              backgroundColor: Colors.grey,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.r),
                              ),
                            ),
                            onPressed: () {},
                            child: Text(
                              "申请售后",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, "/order_info");
                  },
                  child: Card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ListTile(title: Text("订单编号：202308010001")),
                        ListTile(
                          leading: Container(
                            width: 80.w,
                            height: 80.w,
                            child: Image.asset(
                              "lib/images/list1.jpg",
                              fit: BoxFit.cover,
                            ),
                          ),
                          title: Text("商品名称：商品1"),
                          trailing: Text("x1"),
                        ),
                        ListTile(
                          leading: Container(
                            width: 80.w,
                            height: 80.w,
                            child: Image.asset(
                              "lib/images/list1.jpg",
                              fit: BoxFit.cover,
                            ),
                          ),
                          title: Text("商品名称：商品1"),
                          trailing: Text("x1"),
                        ),
                        ListTile(
                          leading: Container(
                            width: 80.w,
                            height: 80.w,
                            child: Image.asset(
                              "lib/images/list1.jpg",
                              fit: BoxFit.cover,
                            ),
                          ),
                          title: Text("商品名称：商品1"),
                          trailing: Text("x1"),
                        ),
                        ListTile(
                          leading: Text("订单金额：¥100.00"),
                          trailing: TextButton(
                            style: TextButton.styleFrom(
                              side: BorderSide(color: Colors.grey, width: 1.w),
                              backgroundColor: Colors.grey,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.r),
                              ),
                            ),
                            onPressed: () {},
                            child: Text(
                              "申请售后",
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
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              width: double.infinity,
              height: 100.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      child: Text("全部"),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      child: Text("待发货"),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      child: Text("待发货"),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      child: Text("待发货"),
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
