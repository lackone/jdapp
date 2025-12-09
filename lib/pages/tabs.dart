import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../common/keeplive_wrapper.dart';
import '../events/event_bus.dart';
import '../provider/cart.dart';
import 'category.dart';
import 'home.dart';
import 'my.dart';
import 'cart.dart';

class Tabs extends StatefulWidget {
  Tabs({Key? key}) : super(key: key);

  @override
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  int _currentIndex = 0;
  var _eb;
  final List<Widget> _pageList = [Home(), Category(), ShoopingCart(), My()];
  final PageController _pageController = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();

    //监听事件
    _eb = eventBus.on<AddCartEvent>().listen((event) {
      final cart = Provider.of<Cart>(context, listen: false);
      cart.addCart(event.goods!);
      print(event.goods?.toJson());
    });
  }

  @override
  void dispose() {
    super.dispose();
    _eb.cancel(); // 取消订阅
  }

  //保持页面状态的2种方法
  //1、IndexedStack
  //2、AutomaticKeepAliveClientMixin

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: _getAppbar(),
      // body: IndexedStack( //有问题，默认会加载所有的页面，导致内存占用过高
      //   index: _currentIndex,
      //   children: _pageList,
      // ),
      body: PageView(
        controller: _pageController,
        children: _pageList.map((e) => KeepliveWrapper(child: e)).toList(),
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        fixedColor: Colors.red,
        type: BottomNavigationBarType.fixed, //多个菜单必须设置
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            _pageController.jumpToPage(index);
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "首页"),
          BottomNavigationBarItem(icon: Icon(Icons.category), label: "分类"),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: "购物车",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "我的"),
        ],
      ),
    );
  }
}
