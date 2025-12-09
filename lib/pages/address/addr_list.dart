import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../common/alert_dialog.dart';

class AddrList extends StatefulWidget {
  AddrList({Key? key}) : super(key: key);

  @override
  _AddrListState createState() => _AddrListState();
}

class _AddrListState extends State<AddrList> {
  String defaultAddrId = "1";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("地址列表")),
      body: Container(
        padding: EdgeInsets.all(10.h),
        child: Stack(
          children: [
            ListView(
              children: [
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: defaultAddrId == "1"
                      ? Icon(Icons.check, color: Colors.red)
                      : null,
                  title: InkWell(
                    onLongPress: () {
                      MyAlertDialog.show(
                        context: context,
                        title: "提示",
                        content: "确定删除该地址吗？",
                      );
                    },
                    onTap: () {
                      setState(() {
                        defaultAddrId = "1";

                        Timer.periodic(Duration(milliseconds: 500), (timer) {
                          timer.cancel();
                          Navigator.pop(context);
                        });
                      });
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("张三 团结名居 15392862300"),
                        SizedBox(height: 10.h),
                        Text("湖北省/武汉市/洪山区"),
                      ],
                    ),
                  ),
                  trailing: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, "/addr_edit");
                    },
                    child: Icon(Icons.edit, color: Colors.blue),
                  ),
                ),
                Divider(height: 1.h),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: defaultAddrId == "2"
                      ? Icon(Icons.check, color: Colors.red)
                      : null,
                  title: InkWell(
                    onLongPress: () {
                      MyAlertDialog.show(
                        context: context,
                        title: "提示",
                        content: "确定删除该地址吗？",
                      );
                    },
                    onTap: () {
                      setState(() {
                        defaultAddrId = "2";

                        Timer.periodic(Duration(milliseconds: 500), (timer) {
                          timer.cancel();
                          Navigator.pop(context);
                        });
                      });
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("张三 团结名居 15392862300"),
                        SizedBox(height: 10.h),
                        Text("湖北省/武汉市/洪山区"),
                      ],
                    ),
                  ),
                  trailing: Icon(Icons.edit, color: Colors.blue),
                ),
                Divider(height: 1.h),
              ],
            ),
            Positioned(
              height: 80.h,
              left: 0,
              right: 0,
              bottom: 0,
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, "/addr_add");
                },
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(10.h),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(5.r),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.add, color: Colors.white),
                      SizedBox(width: 10.w),
                      Text("添加收货地址", style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
