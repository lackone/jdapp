import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Register02 extends StatefulWidget {
  Register02({Key? key}) : super(key: key);

  @override
  _Register02State createState() => _Register02State();
}

class _Register02State extends State<Register02> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("用户注册-第二步")),
      body: Container(
        padding: EdgeInsets.all(20.w),
        child: ListView(
          children: [
            Container(
              child: Text(
                "请输入XXX手机收到的验证码",
                style: TextStyle(fontSize: 24.sp, color: Colors.grey),
              ),
            ),
            SizedBox(height: 30.w),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.grey, width: 1.w),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "请输入验证码",
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.w),
                      ),
                    ),
                    child: Text(
                      "重新发送",
                      style: TextStyle(fontSize: 24.sp, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30.w),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/register03");
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
