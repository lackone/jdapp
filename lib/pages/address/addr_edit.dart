import 'package:city_pickers/city_pickers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddrEdit extends StatefulWidget {
  AddrEdit({Key? key}) : super(key: key);

  @override
  _AddrEditState createState() => _AddrEditState();
}

class _AddrEditState extends State<AddrEdit> {
  String _area = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("编辑地址")),
      body: Container(
        padding: EdgeInsets.all(20.w),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.grey, width: 1.w),
                ),
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "收件人姓名",
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
                  hintText: "收件人电话号码",
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
                  prefixIcon: InkWell(
                    onTap: () async {
                      Result? result = await CityPickers.showCityPicker(
                        context: context,
                        cancelWidget: Text(
                          "取消",
                          style: TextStyle(
                            fontSize: 24.sp,
                            color: Colors.black,
                          ),
                        ),
                        confirmWidget: Text(
                          "确认",
                          style: TextStyle(
                            fontSize: 24.sp,
                            color: Colors.black,
                          ),
                        ),
                      );
                      setState(() {
                        _area =
                            "${result?.provinceName}/${result?.cityName}/${result?.areaName}";
                      });
                    },
                    child: Icon(Icons.location_on),
                  ),
                  hintText: _area.isNotEmpty ? _area : "省/市/区",
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
                maxLines: 3,
                decoration: InputDecoration(
                  hintText: "详细地址",
                  border: OutlineInputBorder(borderSide: BorderSide.none),
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.w),
                  ),
                ),
                child: Text(
                  "编辑地址",
                  style: TextStyle(fontSize: 24.sp, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
