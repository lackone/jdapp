import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Pay extends StatefulWidget {
  Pay({Key? key}) : super(key: key);

  @override
  _PayState createState() => _PayState();
}

class _PayState extends State<Pay> {
  int _payType = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("支付")),
      body: Container(
        padding: EdgeInsets.all(10.w),
        child: ListView(
          children: [
            InkWell(
              onTap: () {
                setState(() {
                  _payType = 0;
                });
              },
              child: ListTile(
                leading: Icon(
                  Icons.payment,
                  color: _payType == 0 ? Colors.red : Colors.grey,
                ),
                title: Text("支付宝"),
                trailing: _payType == 0 ? Icon(Icons.check) : null,
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  _payType = 1;
                });
              },
              child: ListTile(
                leading: Icon(
                  Icons.wechat,
                  color: _payType == 1 ? Colors.green : Colors.grey,
                ),
                title: Text("微信"),
                trailing: _payType == 1 ? Icon(Icons.check) : null,
              ),
            ),
            SizedBox(height: 30.h),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.red,
                side: BorderSide(color: Colors.red),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.r),
                ),
              ),
              onPressed: () {},
              child: Text("支付"),
            ),
          ],
        ),
      ),
    );
  }
}
