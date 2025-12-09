import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../common/alert_dialog.dart';
import '../model/user_model.dart';
import '../services/user.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.close, size: 26.sp),
          onPressed: () {
            Navigator.pushNamed(context, "/");
          },
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              "客服",
              style: TextStyle(fontSize: 24.sp, color: Colors.black),
            ),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(20.w),
        child: ListView(
          children: [
            Center(
              child: Container(
                margin: EdgeInsets.only(top: 30.w),
                height: 100.w,
                width: 100.w,
                child: ClipOval(
                  child: Image.asset("lib/images/list1.jpg", fit: BoxFit.cover),
                ),
              ),
            ),
            SizedBox(height: 30.w),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.grey, width: 1.w),
                ),
              ),
              child: TextField(
                controller: _phoneController,
                decoration: InputDecoration(
                  hintText: "请输入手机号",
                  prefixIcon: Icon(Icons.phone),
                  border: OutlineInputBorder(borderSide: BorderSide.none),
                ),
              ),
            ),
            SizedBox(height: 30.w),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.grey, width: 1.w),
                ),
              ),
              child: TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                  hintText: "请输入密码",
                  prefixIcon: Icon(Icons.lock),
                  border: OutlineInputBorder(borderSide: BorderSide.none),
                ),
              ),
            ),
            Container(
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "/register01");
                      },
                      child: Text(
                        "注册账号",
                        style: TextStyle(fontSize: 24.sp, color: Colors.black),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        "忘记密码",
                        style: TextStyle(fontSize: 24.sp, color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                var phone = _phoneController.text;
                var password = _passwordController.text;
                if (phone.isEmpty || password.isEmpty) {
                  MyAlertDialog.show(
                    context: context,
                    title: "提示",
                    content: "请输入手机号和密码",
                  );
                  return;
                }
                if (password != "123456") {
                  MyAlertDialog.show(
                    context: context,
                    title: "提示",
                    content: "密码错误",
                  );
                  return;
                }

                UserService.setInfo(UserModel(phone: phone, name: phone));

                Navigator.pushNamed(context, "/my");
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.w),
                ),
              ),
              child: Text(
                "登录",
                style: TextStyle(fontSize: 24.sp, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
