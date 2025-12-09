import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../model/goods_model.dart';
import '../provider/cart.dart';

class CartNum extends StatefulWidget {
  GoodsModel model;
  CartNum({Key? key, required this.model}) : super(key: key);

  @override
  _CartNumState createState() => _CartNumState();
}

class _CartNumState extends State<CartNum> {
  late GoodsModel _model;

  @override
  void initState() {
    super.initState();
    _model = widget.model;
  }

  _leftBtn() {
    final cart = Provider.of<Cart>(context);
    return InkWell(
      onTap: () {
        if (_model.num! > 0) {
          setState(() {
            cart.changeCartNum(_model, _model.num! - 1);
          });
        }
      },
      child: Container(
        width: 40.w,
        height: 40.h,
        decoration: BoxDecoration(
          border: Border(
            right: BorderSide(color: Colors.grey[300]!, width: 1.w),
          ),
        ),
        child: Center(
          child: Text(
            "-",
            style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
        ),
      ),
    );
  }

  Widget _rightBtn() {
    final cart = Provider.of<Cart>(context);
    return InkWell(
      onTap: () {
        setState(() {
          cart.changeCartNum(_model, _model.num! + 1);
        });
      },
      child: Container(
        width: 40.w,
        height: 40.h,
        decoration: BoxDecoration(
          border: Border(
            left: BorderSide(color: Colors.grey[300]!, width: 1.w),
          ),
        ),
        child: Center(
          child: Text(
            "+",
            style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    _model = widget.model;
    final cart = Provider.of<Cart>(context);
    return Container(
      width: 160.w,
      height: 40.h,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!, width: 1.w),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _leftBtn(),
          Container(
            width: 78.w,
            height: 40.h,
            alignment: Alignment.center,
            child: TextField(
              textAlignVertical: TextAlignVertical.center,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                isCollapsed: true, //居中的关键
                border: InputBorder.none,
                hintText: "${_model.num}",
                hintStyle: TextStyle(fontSize: 20.sp, color: Colors.grey),
              ),
              style: TextStyle(fontSize: 20.sp, color: Colors.black),
              keyboardType: TextInputType.number,
            ),
          ),
          _rightBtn(),
        ],
      ),
    );
  }
}
