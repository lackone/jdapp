import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Appbar {
  static getAppbar(BuildContext context) {
    return AppBar(
      toolbarHeight: 60.h,
      title: InkWell(
        onTap: () {
          Navigator.pushNamed(context, "/search");
        },
        child: Container(
          height: 50.h,
          width: double.infinity,
          padding: EdgeInsets.all(5.r),
          decoration: BoxDecoration(
            color: Colors.grey[100]!,
            borderRadius: BorderRadius.circular(15.r),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.search, size: 36.sp, color: Colors.grey[500]!),
              Text(
                "笔记本",
                style: TextStyle(fontSize: 16.sp, color: Colors.grey[500]!),
              ),
            ],
          ),
        ),
      ),
      centerTitle: true,
      leading: IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.center_focus_weak,
          size: 36.sp,
          color: Colors.grey[500]!,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.message, size: 36.sp, color: Colors.grey[500]!),
        ),
      ],
    );
  }
}
