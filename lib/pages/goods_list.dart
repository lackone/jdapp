import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../services/search.dart';
import '../common/loading_widget.dart';
import '../config/config.dart';

class GoodsList extends StatefulWidget {
  final Map? arguments;

  GoodsList({Key? key, this.arguments}) : super(key: key);

  @override
  _GoodsListState createState() => _GoodsListState();
}

class _GoodsListState extends State<GoodsList> {
  int _currentIndex = 0;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List _goodsData = [];
  int page = 1;
  int pageSize = 10;
  ScrollController _scrollController = ScrollController();
  bool _isLoading = false;
  bool _hasMore = true;
  Map sorts = {1: true, 2: true};
  String _keyword = "";
  String _cateId = "";
  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    print("goods_list");
    super.initState();
    _goodsListData();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _goodsListData();
      }
    });

    _keyword = widget.arguments?["keyword"] ?? "";
    _cateId = widget.arguments?["cate_id"].toString() ?? "";

    _searchController.text = _keyword;
  }

  _goodsListData() {
    if (_isLoading) {
      return;
    }

    if (page > 10) {
      setState(() {
        _hasMore = false;
      });
      return;
    }

    print("获取数据");

    setState(() {
      _isLoading = true;
      _goodsData.addAll(
        .generate(pageSize, (index) {
          return {
            "id": index,
            "name":
                "商品名称${index + 1 + (page - 1) * pageSize} 分类 $_cateId 搜索关键词 $_keyword",
            "price": 100.00 + index,
            "img": "${Config.imgLocal}/list2.jpg",
          };
        }).toList(),
      );
      page++;
      _hasMore = true;
      _isLoading = false;
    });
  }

  Widget _showLoading(index) {
    if (_hasMore) {
      return (index == _goodsData.length - 1)
          ? LoadingWidget()
          : SizedBox(height: 0);
    } else {
      return (index == _goodsData.length - 1)
          ? Text(
              "--我是有底线的--",
              style: TextStyle(fontSize: 16.sp, color: Colors.grey[300]),
            )
          : SizedBox(height: 0);
    }
  }

  Widget _goodsList() {
    if (_goodsData.isNotEmpty) {
      return RefreshIndicator(
        child: Container(
          padding: EdgeInsets.all(10.h),
          margin: EdgeInsets.only(top: 80.h),
          child: ListView.builder(
            controller: _scrollController,
            itemBuilder: (context, index) {
              var item = _goodsData[index];
              return Column(
                children: [
                  Row(
                    children: [
                      Container(
                        height: 120.h,
                        width: 120.h,
                        child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              "/goods_detail",
                              arguments: {"id": item["id"]},
                            );
                          },
                          child: Image.asset(item["img"], fit: BoxFit.cover),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 120.h,
                          padding: EdgeInsets.all(10.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.pushNamed(
                                    context,
                                    "/goods_detail",
                                    arguments: {"id": item["id"]},
                                  );
                                },
                                child: Text(
                                  item["name"],
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    color: Colors.black54,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  textAlign: TextAlign.left,
                                  maxLines: 2,
                                ),
                              ),
                              Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(right: 5.w),
                                    padding: EdgeInsets.all(5.w),
                                    decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      borderRadius: BorderRadius.circular(5.r),
                                    ),
                                    child: Text(
                                      "4g",
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(right: 5.w),
                                    padding: EdgeInsets.all(5.w),
                                    decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      borderRadius: BorderRadius.circular(5.r),
                                    ),
                                    child: Text(
                                      "5g",
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                "${item["price"]}元",
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  Divider(height: 1.h),
                  SizedBox(height: 10.h),
                  _showLoading(index),
                ],
              );
            },
            itemCount: _goodsData.length,
          ),
        ),
        onRefresh: () async {
          _resetData();
        },
      );
    } else {
      return LoadingWidget();
    }
  }

  _goodsListFilterSel(id) {
    setState(() {
      _currentIndex = id;

      if (id == 3) {
        _scaffoldKey.currentState?.openEndDrawer();
      }

      _resetData();
    });
  }

  _resetData() {
    //重置分页
    page = 1;
    _goodsData = [];
    _hasMore = true;

    //重置滚动位置
    _scrollController.jumpTo(0);

    //获取数据
    _goodsListData();
  }

  _showIcon(id) {
    if (id == 1 || id == 2) {
      if (!sorts[id]) {
        return Icon(Icons.arrow_drop_down, size: 20.sp, color: Colors.black);
      } else {
        return Icon(Icons.arrow_drop_up, size: 20.sp, color: Colors.black);
      }
    } else {
      return Text("");
    }
  }

  Widget _goodsListFilter() {
    return Positioned(
      top: 0,
      height: 80.h,
      width: ScreenUtil().screenWidth,
      child: Container(
        alignment: Alignment.center,
        height: 80.h,
        width: ScreenUtil().screenWidth,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Color.fromRGBO(233, 233, 233, 0.9),
              width: 1.w,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: InkWell(
                onTap: () {
                  _goodsListFilterSel(0);
                },
                child: Container(
                  height: double.infinity,
                  alignment: Alignment.center,
                  decoration: _currentIndex == 0
                      ? BoxDecoration(
                          border: Border(
                            bottom: BorderSide(color: Colors.red, width: 2.w),
                          ),
                        )
                      : null,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "综合",
                        style: TextStyle(
                          fontSize: 20.sp,
                          color: _currentIndex == 0 ? Colors.red : Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      _showIcon(0),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: () {
                  _goodsListFilterSel(1);
                },
                child: Container(
                  height: double.infinity,
                  alignment: Alignment.center,
                  decoration: _currentIndex == 1
                      ? BoxDecoration(
                          border: Border(
                            bottom: BorderSide(color: Colors.red, width: 2.w),
                          ),
                        )
                      : null,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "销量",
                        style: TextStyle(
                          fontSize: 20.sp,
                          color: _currentIndex == 1 ? Colors.red : Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            sorts[1] = !sorts[1];
                            _resetData();
                          });
                        },
                        child: _showIcon(1),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: () {
                  _goodsListFilterSel(2);
                },
                child: Container(
                  height: double.infinity,
                  alignment: Alignment.center,
                  decoration: _currentIndex == 2
                      ? BoxDecoration(
                          border: Border(
                            bottom: BorderSide(color: Colors.red, width: 2.w),
                          ),
                        )
                      : null,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "价格",
                        style: TextStyle(
                          fontSize: 20.sp,
                          color: _currentIndex == 2 ? Colors.red : Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            sorts[2] = !sorts[2];
                            _resetData();
                          });
                        },
                        child: _showIcon(2),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: () {
                  _goodsListFilterSel(3);
                },
                child: Container(
                  height: double.infinity,
                  alignment: Alignment.center,
                  decoration: _currentIndex == 3
                      ? BoxDecoration(
                          border: Border(
                            bottom: BorderSide(color: Colors.red, width: 2.w),
                          ),
                        )
                      : null,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "筛选",
                        style: TextStyle(
                          fontSize: 20.sp,
                          color: _currentIndex == 3 ? Colors.red : Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      _showIcon(3),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
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
                  controller: _searchController,
                  onChanged: (value) {
                    setState(() {
                      _keyword = value;
                      _searchController.text = value;
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
              setState(() {
                _resetData();

                SearchService.setSearchData(_keyword);
              });
            },
            icon: Text(
              "搜索",
              style: TextStyle(fontSize: 24.sp, color: Colors.grey[500]!),
            ),
          ),
        ],
      ),
      body: Stack(children: [_goodsList(), _goodsListFilter()]),
      endDrawer: Drawer(child: Container(child: Text("筛选"))),
    );
  }
}
