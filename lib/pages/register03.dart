import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Register03 extends StatefulWidget {
  Register03({Key? key}) : super(key: key);

  @override
  _Register03State createState() => _Register03State();
}

class _Register03State extends State<Register03> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("用户注册-第三步")),
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
                  hintText: "请输入密码",
                  prefixIcon: Icon(Icons.lock),
                  border: OutlineInputBorder(borderSide: BorderSide.none),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.grey, width: 1.w),
                ),
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "请再次输入密码",
                  prefixIcon: Icon(Icons.lock),
                  border: OutlineInputBorder(borderSide: BorderSide.none),
                ),
              ),
            ),
            SizedBox(height: 30.w),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/login");
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.w),
                ),
              ),
              child: Text(
                "完成注册",
                style: TextStyle(fontSize: 24.sp, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
