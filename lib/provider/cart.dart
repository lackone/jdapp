import 'package:flutter/material.dart';
import '../model/goods_model.dart';

class Cart with ChangeNotifier {
  List<GoodsModel> _cartList = [];
  double _allPrice = 0; //总价
  int _allNum = 0; //数量

  List get cartList => _cartList;
  int get cartNum => _cartList.length;
  double get allPrice => _allPrice;
  int get allNum => _allNum;

  computeAllPrice() {
    _allPrice = 0;
    _allNum = 0;
    _cartList.forEach((element) {
      if (element.isChecked == true) {
        _allPrice += double.parse(element.price ?? "0") * (element.num ?? 0);
        _allNum += element.num ?? 0;
      }
    });
    notifyListeners();
  }

  addCart(GoodsModel item) {
    _cartList.add(item);
    computeAllPrice();
    notifyListeners();
  }

  printCartList(list) {
    list.forEach((element) {
      print(element.toJson());
    });
  }

  delCart() {
    printCartList(_cartList);
    List<GoodsModel> tmp = [];
    _cartList.forEach((element) {
      if (element.isChecked == false) {
        tmp.add(element);
      }
    });
    _cartList = tmp;
    printCartList(_cartList);
    computeAllPrice();
    notifyListeners();
  }

  allCartChecked(bool value) {
    _cartList.forEach((element) {
      element.isChecked = value;
    });
    computeAllPrice();
    notifyListeners();
  }

  changeCartChecked(GoodsModel item, bool value) {
    _cartList.forEach((element) {
      if (identical(element, item)) {
        element.isChecked = value;
      }
    });
    computeAllPrice();
    notifyListeners();
  }

  changeCartNum(GoodsModel item, int num) {
    bool isChg = false;
    _cartList.forEach((element) {
      if (identical(element, item)) {
        element.num = num;
        isChg = true;
      }
    });
    if (!isChg) {
      item.num = num;
    }
    computeAllPrice();
    notifyListeners();
  }

  isAllChecked() {
    if (_cartList.isEmpty) {
      return false;
    }
    bool isChecked = true;
    _cartList.forEach((element) {
      if (element.isChecked != true) {
        isChecked = false;
      }
    });
    return isChecked;
  }

  getCheckData() {
    List<GoodsModel> tmp = [];
    _cartList.forEach((element) {
      if (element.isChecked == true) {
        tmp.add(element);
      }
    });
    return tmp;
  }
}
