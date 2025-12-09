import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../model/user_model.dart';
import '../provider/counter.dart';
import '../services/user.dart';

class My extends StatefulWidget {
  My({Key? key}) : super(key: key);

  @override
  _MyState createState() => _MyState();
}

class _MyState extends State<My> {
  UserModel? _userInfo;

  @override
  void initState() {
    super.initState();
    print("我的初始化");
  }

  _getUserInfo() async {
    UserModel? userInfo = await UserService.getInfo();
    setState(() {
      _userInfo = userInfo;
    });
  }

  @override
  Widget build(BuildContext context) {
    _getUserInfo();

    return Scaffold(
      body: ListView(
        children: [
          Container(
            height: 220.h,
            width: double.infinity,
            color: Colors.black87,
            child: Row(
              children: [
                Container(
                  height: 120.h,
                  width: 120.h,
                  margin: EdgeInsets.only(left: 20.w),
                  child: ClipOval(
                    child: Image.asset(
                      "lib/images/list1.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _userInfo != null
                          ? Container()
                          : InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, "/login");
                              },
                              child: Text(
                                "登录/注册",
                                style: TextStyle(
                                  fontSize: 24.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                      _userInfo != null
                          ? Text(
                              "用户昵称 ${_userInfo?.name}",
                              style: TextStyle(
                                fontSize: 24.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            )
                          : Container(),
                      _userInfo != null
                          ? Text(
                              "手机号 ${_userInfo?.phone}",
                              style: TextStyle(
                                fontSize: 20.sp,
                                color: Colors.white,
                              ),
                            )
                          : Container(),
                    ],
                  ),
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, "/order_list");
            },
            child: ListTile(
              leading: Icon(Icons.note, color: Colors.red),
              title: Text("全部订单"),
            ),
          ),
          Divider(height: 1),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, "/order_list");
            },
            child: ListTile(
              leading: Icon(Icons.money, color: Colors.blue),
              title: Text("待付款"),
            ),
          ),
          Divider(height: 1),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, "/order_list");
            },
            child: ListTile(
              leading: Icon(Icons.car_crash, color: Colors.orange),
              title: Text("待收货"),
            ),
          ),
          Container(
            width: double.infinity,
            height: 10.h,
            color: Color.fromRGBO(242, 242, 242, 0.9),
          ),
          ListTile(
            leading: Icon(Icons.favorite, color: Colors.pink),
            title: Text("我的收藏"),
          ),
          Divider(height: 1),
          ListTile(
            leading: Icon(Icons.person, color: Colors.green),
            title: Text("在线客服"),
          ),
          Divider(height: 1),
          SizedBox(height: 30.h),
          ElevatedButton(
            onPressed: () async {
              await UserService.removeInfo();
              setState(() {
                _userInfo = null;
              });
              Navigator.pushNamed(context, "/login");
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.red,
            ),
            child: Text("退出登录"),
          ),
        ],
      ),
    );
  }
}
