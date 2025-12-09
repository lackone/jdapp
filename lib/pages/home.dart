import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper_plus/flutter_swiper_plus.dart';
import '../config/config.dart';

import 'appbar.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    print("首页初始化");
  }

  // 标题
  Widget _title(String title) {
    return Container(
      margin: EdgeInsets.only(left: 10.w),
      padding: EdgeInsets.only(left: 10.w),
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(color: Colors.red, width: 5.w),
        ),
      ),
      child: Text(title, style: TextStyle(color: Colors.black54)),
    );
  }

  // 热门商品列表
  Widget _hostList() {
    return Container(
      padding: EdgeInsets.all(10.w),
      height: 170.h,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal, // 水平滚动
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(right: 10.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    // 跳转到商品详情页
                    Navigator.pushNamed(
                      context,
                      "/goods_detail",
                      arguments: {"id": index + 1},
                    );
                  },
                  child: Image.asset(
                    "${Config.imgLocal}/hot${index + 1}.jpg",
                    fit: BoxFit.cover,
                    width: 120.w,
                    height: 120.h,
                  ),
                ),
                SizedBox(height: 5.h),
                Text("商品${index + 1}", style: TextStyle(fontSize: 14.sp)),
              ],
            ),
          );
        },
        itemCount: 10,
      ),
    );
  }

  Widget _getGoodList() {
    var width = ((ScreenUtil().screenWidth - 40.w) / 2);
    return Container(
      padding: EdgeInsets.all(10.w),
      child: Wrap(
        direction: Axis.horizontal, // 水平方向
        spacing: 20.w, // 水平间距
        runSpacing: 20.h, // 垂直间距
        children: List.generate(20, (index) {
          return Container(
            width: width,
            padding: EdgeInsets.all(10.w),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black12, width: 1.w),
              borderRadius: BorderRadius.circular(10.w),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    // 跳转到商品详情页
                    Navigator.pushNamed(
                      context,
                      "/goods_detail",
                      arguments: {"id": index + 1},
                    );
                  },
                  child: Image.asset(
                    "${Config.imgLocal}/list1.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  "商品${index + 1}",
                  style: TextStyle(
                    fontSize: 20.sp,
                    color: Colors.black54,
                    overflow: TextOverflow.ellipsis, // 超出部分省略号
                  ),
                  maxLines: 2, // 最多显示1行
                ),
                SizedBox(
                  width: double.infinity,
                  height: 35.h,
                  child: Stack(
                    children: [
                      Positioned(
                        top: 0,
                        left: 0,
                        child: Text(
                          "100元",
                          style: TextStyle(
                            fontSize: 26.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        top: 0,
                        child: Text(
                          "100元",
                          style: TextStyle(
                            fontSize: 24.sp,
                            color: Colors.black54,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  // 轮播图
  Widget _getSwiper() {
    var imgList = [
      {"url": "${Config.imgLocal}/slide01.jpg"},
      {"url": "${Config.imgLocal}/slide02.jpg"},
      {"url": "${Config.imgLocal}/slide03.jpg"},
    ];

    return Container(
      child: AspectRatio(
        // 宽高比
        aspectRatio: 2 / 1,
        child: Swiper(
          itemBuilder: (context, index) {
            return Image.asset(imgList[index]["url"] ?? "", fit: BoxFit.cover);
          },
          itemCount: imgList.length,
          pagination: SwiperPagination(
            builder: DotSwiperPaginationBuilder(
              color: Colors.white, // 分页器颜色
              activeColor: Colors.red, // 分页器选中颜色
            ),
          ), // 分页器
          control: SwiperControl(), // 控制按钮
          autoplay: true, // 自动播放
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar.getAppbar(context),
      body: ListView(
        children: [
          _getSwiper(),
          SizedBox(height: 10.h),
          _title("热门商品"),
          SizedBox(height: 10.h),
          _hostList(),
          SizedBox(height: 10.h),
          _title("猜你喜欢"),
          SizedBox(height: 10.h),
          _getGoodList(),
        ],
      ),
    );
  }
}
