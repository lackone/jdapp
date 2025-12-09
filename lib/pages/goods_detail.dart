import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../config/config.dart';
import '../model/goods_model.dart';
import '../common/keeplive_wrapper.dart';
import '../events/event_bus.dart';
import 'goods_details/goods_detail_01.dart';
import 'goods_details/goods_detail_02.dart';
import 'goods_details/goods_detail_03.dart';

class GoodsDetail extends StatefulWidget {
  final Map? arguments;

  GoodsDetail({Key? key, this.arguments}) : super(key: key);

  @override
  _GoodsDetailState createState() => _GoodsDetailState();
}

class _GoodsDetailState extends State<GoodsDetail> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 400.w,
                alignment: Alignment.center,
                child: TabBar(
                  indicatorColor: Colors.red,
                  labelColor: Colors.black87,
                  unselectedLabelColor: Colors.black54,
                  tabs: [
                    Tab(text: "商品"),
                    Tab(text: "详情"),
                    Tab(text: "评价"),
                  ],
                ),
              ),
            ],
          ),
          actions: [
            IconButton(
              onPressed: () {
                showMenu(
                  context: context,
                  position: RelativeRect.fromLTRB(
                    ScreenUtil().screenWidth,
                    140.w,
                    0,
                    0,
                  ),
                  items: [
                    PopupMenuItem(child: Text("加入购物车")),
                    PopupMenuItem(child: Text("收藏商品")),
                  ],
                );
              },
              icon: Icon(Icons.more_horiz, size: 36.sp, color: Colors.black87),
            ),
          ],
        ),
        body: Stack(
          children: [
            TabBarView(
              physics: NeverScrollableScrollPhysics(), // 禁用滑动切换Tab
              children: [
                KeepliveWrapper(child: GoodsDetail01()),
                KeepliveWrapper(child: GoodsDetail02()),
                KeepliveWrapper(child: GoodsDetail03()),
              ],
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    top: BorderSide(color: Colors.black12, width: 1.w),
                  ),
                ),
                height: 100.w,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, "/cart");
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.add_shopping_cart, size: 36.sp),
                          Text("购物车", style: TextStyle(fontSize: 20.sp)),
                        ],
                      ),
                    ),
                    Container(
                      height: 60.w,
                      width: 180.w,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(30.w),
                      ),
                      child: InkWell(
                        onTap: () {
                          eventBus.fire(ShowBottomSheetEvent());
                        },
                        child: Center(
                          child: Text(
                            "加入购物车",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24.sp,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 60.w,
                      width: 180.w,
                      decoration: BoxDecoration(
                        color: Colors.yellow[700]!,
                        borderRadius: BorderRadius.circular(30.w),
                      ),
                      child: InkWell(
                        onTap: () {
                          eventBus.fire(ShowBottomSheetEvent());
                        },
                        child: Center(
                          child: Text(
                            "立即购买",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24.sp,
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
  }
}
