import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../config/config.dart';
import '../../pages/cart_num.dart';

import '../../events/event_bus.dart';
import '../../model/goods_model.dart';

class GoodsDetail01 extends StatefulWidget {
  GoodsModel? model;
  GoodsDetail01({Key? key, this.model}) : super(key: key);

  @override
  _GoodsDetail01State createState() => _GoodsDetail01State();
}

class _GoodsDetail01State extends State<GoodsDetail01> {
  var _eb;
  var _model;

  @override
  void initState() {
    print("商品");
    super.initState();

    _model = GoodsModel(id: "1", num: 1, attr: "XL,红色", price: "123.4");

    _eb = eventBus.on<ShowBottomSheetEvent>().listen((event) {
      _bottomSheet(context);
    });
  }

  @override
  void dispose() {
    super.dispose();
    _eb.cancel(); // 取消订阅
  }

  _bottomSheet(BuildContext context) {
    showBottomSheet(
      context: context,
      builder: (context) {
        return GestureDetector(
          onTap: () {
            return;
          },
          child: Container(
            width: double.infinity,
            height: 400.h,
            padding: EdgeInsets.all(20.w),
            child: Stack(
              children: [
                Container(
                  height: 320.h,
                  child: ListView(
                    children: [
                      Column(
                        children: [
                          Wrap(
                            alignment: WrapAlignment.start,
                            crossAxisAlignment: WrapCrossAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 10.h),
                                alignment: Alignment.centerLeft,
                                padding: EdgeInsets.all(10.w),
                                width: 150.w,
                                child: Text(
                                  "商品详情",
                                  style: TextStyle(
                                    fontSize: 24.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Container(
                                width: 500.w,
                                child: Wrap(
                                  spacing: 0.w,
                                  runSpacing: 0.h,
                                  children: [
                                    Chip(
                                      label: Text(
                                        "111",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12.sp,
                                        ),
                                      ),
                                      backgroundColor: Colors.grey,
                                      side: BorderSide.none,
                                    ),
                                    Chip(
                                      label: Text(
                                        "111",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12.sp,
                                        ),
                                      ),
                                      backgroundColor: Colors.grey,
                                      side: BorderSide.none,
                                    ),
                                    Chip(
                                      label: Text(
                                        "111",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12.sp,
                                        ),
                                      ),
                                      backgroundColor: Colors.grey,
                                      side: BorderSide.none,
                                    ),
                                    Chip(
                                      label: Text(
                                        "111",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12.sp,
                                        ),
                                      ),
                                      backgroundColor: Colors.grey,
                                      side: BorderSide.none,
                                    ),
                                    Chip(
                                      label: Text(
                                        "111",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12.sp,
                                        ),
                                      ),
                                      backgroundColor: Colors.red,
                                      side: BorderSide.none,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Wrap(
                            alignment: WrapAlignment.start,
                            crossAxisAlignment: WrapCrossAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 10.h),
                                alignment: Alignment.centerLeft,
                                padding: EdgeInsets.all(10.w),
                                width: 150.w,
                                child: Text(
                                  "商品详情",
                                  style: TextStyle(
                                    fontSize: 24.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Container(
                                width: 500.w,
                                child: Wrap(
                                  spacing: 0.w,
                                  runSpacing: 0.h,
                                  children: [
                                    Chip(
                                      label: Text(
                                        "111",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12.sp,
                                        ),
                                      ),
                                      backgroundColor: Colors.grey,
                                      side: BorderSide.none,
                                    ),
                                    Chip(
                                      label: Text(
                                        "111",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12.sp,
                                        ),
                                      ),
                                      backgroundColor: Colors.grey,
                                      side: BorderSide.none,
                                    ),
                                    Chip(
                                      label: Text(
                                        "111",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12.sp,
                                        ),
                                      ),
                                      backgroundColor: Colors.grey,
                                      side: BorderSide.none,
                                    ),
                                    Chip(
                                      label: Text(
                                        "111",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12.sp,
                                        ),
                                      ),
                                      backgroundColor: Colors.grey,
                                      side: BorderSide.none,
                                    ),
                                    Chip(
                                      label: Text(
                                        "111",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12.sp,
                                        ),
                                      ),
                                      backgroundColor: Colors.red,
                                      side: BorderSide.none,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Wrap(
                            alignment: WrapAlignment.start,
                            crossAxisAlignment: WrapCrossAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 10.h),
                                alignment: Alignment.centerLeft,
                                padding: EdgeInsets.all(10.w),
                                width: 150.w,
                                child: Text(
                                  "商品详情",
                                  style: TextStyle(
                                    fontSize: 24.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Container(
                                width: 500.w,
                                child: Wrap(
                                  spacing: 0.w,
                                  runSpacing: 0.h,
                                  children: [
                                    Chip(
                                      label: Text(
                                        "111",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12.sp,
                                        ),
                                      ),
                                      backgroundColor: Colors.grey,
                                      side: BorderSide.none,
                                    ),
                                    Chip(
                                      label: Text(
                                        "111",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12.sp,
                                        ),
                                      ),
                                      backgroundColor: Colors.grey,
                                      side: BorderSide.none,
                                    ),
                                    Chip(
                                      label: Text(
                                        "111",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12.sp,
                                        ),
                                      ),
                                      backgroundColor: Colors.grey,
                                      side: BorderSide.none,
                                    ),
                                    Chip(
                                      label: Text(
                                        "111",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12.sp,
                                        ),
                                      ),
                                      backgroundColor: Colors.grey,
                                      side: BorderSide.none,
                                    ),
                                    Chip(
                                      label: Text(
                                        "111",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12.sp,
                                        ),
                                      ),
                                      backgroundColor: Colors.red,
                                      side: BorderSide.none,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Divider(height: 1.h),
                          Wrap(
                            alignment: WrapAlignment.start,
                            crossAxisAlignment: WrapCrossAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 10.h),
                                alignment: Alignment.centerLeft,
                                padding: EdgeInsets.all(10.w),
                                width: 150.w,
                                child: Text(
                                  "数量",
                                  style: TextStyle(
                                    fontSize: 24.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(top: 15.h),
                                width: 500.w,
                                alignment: Alignment.centerLeft,
                                child: CartNum(model: _model),
                              ),
                            ],
                          ),
                          SizedBox(height: 100.h),
                        ],
                      ),
                    ],
                  ),
                ),
                Positioned(
                  right: 0,
                  left: 0,
                  bottom: 0,
                  child: Container(
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          onTap: () {
                            print(_model.num);

                            eventBus.fire(
                              AddCartEvent(
                                goods: GoodsModel(
                                  id: "1",
                                  title: "商品名称商品名称商品名称商品名称商品名称商品名称商品名称商品名称商品名称",
                                  image: "${Config.imgLocal}/list1.jpg",
                                  price: "123.4",
                                  num: _model.num,
                                  attr: "XL,红色",
                                  isChecked: true,
                                ),
                              ),
                            );

                            Navigator.of(context).pop();
                          },
                          child: Container(
                            height: 40.h,
                            width: 150.w,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(20.w),
                            ),
                            child: Center(
                              child: Text(
                                "确定",
                                style: TextStyle(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Container(
                            height: 40.h,
                            width: 150.w,
                            decoration: BoxDecoration(
                              color: Colors.black54,
                              borderRadius: BorderRadius.circular(20.w),
                            ),
                            child: Center(
                              child: Text(
                                "取消",
                                style: TextStyle(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.w),
      child: ListView(
        children: [
          AspectRatio(
            aspectRatio: 16 / 9,
            child: Image.asset("${Config.imgLocal}/p1.jpg", fit: BoxFit.cover),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10.w),
            child: Text(
              "联想thinkpad 笔记本电脑 笔记本电脑笔记本电脑笔记本电脑",
              style: TextStyle(
                fontSize: 20.sp,
                color: Colors.black87,
                overflow: TextOverflow.ellipsis, // 超出部分省略号
              ),
              maxLines: 2, // 最多显示1行
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10.w),
            child: Text(
              "联想thinkpad 笔记本电脑 笔记本电脑笔记本电脑笔记本电脑笔记本电脑笔记本电脑笔记本电脑",
              style: TextStyle(
                fontSize: 18.sp,
                color: Colors.black38,
                overflow: TextOverflow.ellipsis, // 超出部分省略号
              ),
              maxLines: 2, // 最多显示1行
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10.w),
            child: Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Text(
                        "特价:",
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54,
                        ),
                      ),
                      Text(
                        "100元",
                        style: TextStyle(
                          fontSize: 28.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "原价:",
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black38,
                        ),
                      ),
                      Text(
                        "100元",
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black26,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 10.h),
            padding: EdgeInsets.symmetric(vertical: 10.w),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.black12, width: 1.w),
              ),
            ),
            child: Row(
              children: [
                Text(
                  "运费: ",
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  ),
                ),
                Text(
                  "免运费",
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black45,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 10.h),
            padding: EdgeInsets.symmetric(vertical: 10.w),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.black12, width: 1.w),
              ),
            ),
            child: InkWell(
              onTap: () {
                _bottomSheet(context);
              },
              child: Row(
                children: [
                  Text(
                    "已选: ",
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                    ),
                  ),
                  Text(
                    "115, 黑色, XL, 1件",
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black45,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
