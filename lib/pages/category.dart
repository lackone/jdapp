import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../config/config.dart';

import 'appbar.dart';

class Category extends StatefulWidget {
  Category({Key? key}) : super(key: key);

  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  int _currentIndex = 0;
  List _cateList = [];
  final Map<int, List> _cateDetailList = {};

  @override
  void initState() {
    super.initState();
    print("分类初始化");
  }

  void _getCateList() {
    print("获取分类列表");
    _cateList = List.generate(20, (index) {
      return Container(
        alignment: Alignment.center,
        child: InkWell(
          onTap: () {
            setState(() {
              _currentIndex = index;
              _getCateDetail(_currentIndex);
            });
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 20.h),
                alignment: Alignment.center,
                width: double.infinity,
                color: _currentIndex == index
                    ? Color.fromRGBO(240, 246, 246, 0.9)
                    : Colors.white,
                child: Text(
                  "分类${index + 1}",
                  style: TextStyle(
                    fontSize: 20.sp,
                    color: _currentIndex == index
                        ? Colors.black
                        : Colors.black54,
                    fontWeight: _currentIndex == index
                        ? FontWeight.bold
                        : FontWeight.normal,
                  ),
                ),
              ),
              Divider(height: 1.h, color: Colors.grey[300]),
            ],
          ),
        ),
      );
    });
  }

  void _getCateDetail(int curIndex) {
    print("获取分类${curIndex + 1}的商品列表");
    _cateDetailList[curIndex] = List.generate(20, (index) {
      return InkWell(
        onTap: () {
          Navigator.pushNamed(
            context,
            "/goods_list",
            arguments: {"cate_id": curIndex},
          );
        },
        child: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: 1 / 1,
                child: Image.asset(
                  "${Config.imgLocal}/list6.jpg",
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                alignment: Alignment.center,
                height: 30.h,
                child: Text(
                  "分类${curIndex + 1} 下的商品${index + 1}",
                  style: TextStyle(fontSize: 16.sp, color: Colors.black54),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    // 左侧宽度 为屏幕宽度的1/4
    var leftWidth = ScreenUtil().screenWidth / 4;
    // 右侧宽度 屏幕宽度 - 左侧宽度 - 左右的padding - GridView中间的间距
    var rightWidth = (ScreenUtil().screenWidth - leftWidth - 20.w - 20.w) / 3;
    var rightHeight = rightWidth + 30.h;

    _getCateList();
    _getCateDetail(_currentIndex);

    return Scaffold(
      appBar: Appbar.getAppbar(context),
      body: Row(
        children: [
          Container(
            height: double.infinity,
            width: leftWidth,
            color: Colors.white,
            child: ListView.builder(
              itemCount: _cateList.length,
              itemBuilder: (context, index) {
                return _cateList[index];
              },
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(10.w),
              height: double.infinity,
              color: Color.fromRGBO(240, 246, 246, 0.9),
              child: GridView.builder(
                itemCount: _cateDetailList[_currentIndex]?.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, // 每行3个
                  mainAxisSpacing: 10.h, // 垂直间距
                  crossAxisSpacing: 10.w, // 水平间距
                  childAspectRatio: rightWidth / rightHeight, //宽高比
                ),
                itemBuilder: (context, index) {
                  return _cateDetailList[_currentIndex]?[index];
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
