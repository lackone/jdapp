import 'package:flutter/material.dart';

import '../pages/address/addr_add.dart';
import '../pages/address/addr_edit.dart';
import '../pages/address/addr_list.dart';
import '../pages/checkout.dart';
import '../pages/goods_list.dart';
import '../pages/goods_detail.dart';
import '../pages/login.dart';
import '../pages/my.dart';
import '../pages/order_info.dart';
import '../pages/order_list.dart';
import '../pages/pay.dart';
import '../pages/register01.dart';
import '../pages/register02.dart';
import '../pages/register03.dart';
import '../pages/tabs.dart';
import '../pages/search.dart';
import '../pages/cart.dart';

// 路由表
final routes = {
  "/": (context, {arguments}) => Tabs(),
  "/goods_list": (context, {arguments}) => GoodsList(arguments: arguments),
  "/goods_detail": (context, {arguments}) => GoodsDetail(arguments: arguments),
  "/search": (context, {arguments}) => Search(),
  "/cart": (context, {arguments}) => ShoopingCart(arguments: arguments),
  "/login": (context, {arguments}) => Login(),
  "/register01": (context, {arguments}) => Register01(),
  "/register02": (context, {arguments}) => Register02(),
  "/register03": (context, {arguments}) => Register03(),
  "/my": (context, {arguments}) => My(),
  "/checkout": (context, {arguments}) => Checkout(arguments: arguments),
  "/addr_add": (context, {arguments}) => AddrAdd(),
  "/addr_edit": (context, {arguments}) => AddrEdit(),
  "/addr_list": (context, {arguments}) => AddrList(),
  "/pay": (context, {arguments}) => Pay(),
  "/order_list": (context, {arguments}) => OrderList(),
  "/order_info": (context, {arguments}) => OrderInfo(),
};

// 路由生成器
var onGenerateRoute = (RouteSettings settings) {
  var name = settings.name;
  var routeBuild = routes[name];
  if (routeBuild != null) {
    if (settings.arguments != null) {
      return MaterialPageRoute(
        builder: (context) {
          return routeBuild(context, arguments: settings.arguments);
        },
      );
    } else {
      return MaterialPageRoute(
        builder: (context) {
          return routeBuild(context);
        },
      );
    }
  }
  return null;
};
