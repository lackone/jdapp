import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderInfo extends StatefulWidget {
  OrderInfo({Key? key}) : super(key: key);

  @override
  _OrderInfoState createState() => _OrderInfoState();
}

class _OrderInfoState extends State<OrderInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("订单详情")),
      body: Container(
        padding: EdgeInsets.all(20.h),
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
                  ListTile(
                    contentPadding: EdgeInsets.all(0),
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
                    contentPadding: EdgeInsets.all(0),
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
                    contentPadding: EdgeInsets.all(0),
                    title: Text("订单编号： 202308010001"),
                  ),
                  Divider(height: 1),
                  ListTile(
                    contentPadding: EdgeInsets.all(0),
                    title: Text("下单时间： 2023-08-01 10:00:00"),
                  ),
                  Divider(height: 1),
                  ListTile(
                    contentPadding: EdgeInsets.all(0),
                    title: Text("支付方式： 支付宝"),
                  ),
                  Divider(height: 1),
                  ListTile(
                    contentPadding: EdgeInsets.all(0),
                    title: Text("配送方式： 快递"),
                  ),
                  Divider(height: 1),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
