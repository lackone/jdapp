import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Register01 extends StatefulWidget {
  Register01({Key? key}) : super(key: key);

  @override
  _Register01State createState() => _Register01State();
}

class _Register01State extends State<Register01> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("用户注册-第一步")),
      body: Container(
        padding: EdgeInsets.all(20.w),
        child: ListView(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.grey, width: 1.w),
                ),
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "请输入手机号",
                  prefixIcon: Icon(Icons.phone),
                  border: OutlineInputBorder(borderSide: BorderSide.none),
                ),
              ),
            ),
            SizedBox(height: 30.w),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/register02");
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.w),
                ),
              ),
              child: Text(
                "下一步",
                style: TextStyle(fontSize: 24.sp, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
