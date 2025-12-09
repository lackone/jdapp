import 'package:flutter/material.dart';

class Counter with ChangeNotifier {
  int _count = 0; //状态

  Counter() {
    _count = 10;
  }

  int get count => _count; //获取状态

  void inc() {
    _count++;
    notifyListeners(); //通知监听者状态改变
  }

  void dec() {
    _count--;
    notifyListeners();
  }
}
