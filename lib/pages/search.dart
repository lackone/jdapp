import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../common/alert_dialog.dart';
import '../services/search.dart';

class Search extends StatefulWidget {
  Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  String _keyword = "";
  List _historyData = [];

  @override
  void initState() {
    super.initState();
    _getHistoryData();
  }

  _getHistoryData() async {
    var data = await SearchService.getSearchData();
    setState(() {
      _historyData = data;
    });
  }

  _historyList() {
    if (_historyData.isNotEmpty) {
      return Column(
        children: _historyData.reversed.map((value) {
          return Column(
            children: [
              ListTile(
                contentPadding: EdgeInsets.all(0),
                title: Text(value),
                onLongPress: () {
                  MyAlertDialog.show(
                    context: context,
                    title: "提示",
                    content: "确定删除该搜索记录吗？",
                    onConfirm: () async {
                      await SearchService.removeSearchData(value);
                      _getHistoryData();
                    },
                    onCancel: () {
                      // 取消删除
                    },
                  );
                },
              ),
              Divider(height: 1.h, color: Colors.grey[300]!),
            ],
          );
        }).toList(),
      );
    } else {
      return Column(children: [Text("")]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60.h,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, size: 36.sp, color: Colors.grey[500]!),
        ),
        title: Container(
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
              Expanded(
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      _keyword = value;
                    });
                  },
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                    isCollapsed: true, //居中的关键
                    hintText: "搜索商品",
                    border: InputBorder.none,
                    hintStyle: TextStyle(
                      fontSize: 16.sp,
                      color: Colors.grey[500]!,
                    ),
                  ),
                  style: TextStyle(fontSize: 16.sp, color: Colors.black),
                ),
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              if (_keyword.isNotEmpty) {
                SearchService.setSearchData(_keyword);
                _getHistoryData();

                Navigator.pushReplacementNamed(
                  context,
                  "/goods_list",
                  arguments: {"keyword": _keyword},
                );
              }
            },
            icon: Text(
              "搜索",
              style: TextStyle(fontSize: 24.sp, color: Colors.grey[500]!),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(10.r),
        child: ListView(
          children: [
            Container(
              child: Text(
                "热搜",
                style: TextStyle(fontSize: 30.sp, color: Colors.black),
              ),
            ),
            SizedBox(height: 10.h),
            Divider(height: 1.h, color: Colors.grey[300]!),
            SizedBox(height: 10.h),
            Wrap(
              spacing: 10.w,
              runSpacing: 10.h,
              children: [
                Container(
                  padding: EdgeInsets.all(10.r),
                  decoration: BoxDecoration(
                    color: Colors.grey[100]!,
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                  child: Text(
                    "商品",
                    style: TextStyle(fontSize: 16.sp, color: Colors.black),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10.r),
                  decoration: BoxDecoration(
                    color: Colors.grey[100]!,
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                  child: Text(
                    "商品商品商品商品商品商品商品商品",
                    style: TextStyle(fontSize: 16.sp, color: Colors.black),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10.r),
                  decoration: BoxDecoration(
                    color: Colors.grey[100]!,
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                  child: Text(
                    "商品商品商品商品",
                    style: TextStyle(fontSize: 16.sp, color: Colors.black),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.h),
            Container(
              child: Text(
                "历史搜索",
                style: TextStyle(fontSize: 30.sp, color: Colors.black),
              ),
            ),
            _historyList(),
            SizedBox(height: 100.h),
            InkWell(
              onTap: () {
                SearchService.clearSearchData();
                _getHistoryData();
              },
              child: Container(
                alignment: Alignment.center,
                width: 100.w,
                height: 50.h,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey[300]!),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.delete, size: 36.sp, color: Colors.black),
                    Text(
                      "清空历史搜索",
                      style: TextStyle(fontSize: 16.sp, color: Colors.black),
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
