import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../config/config.dart';
import '../model/goods_model.dart';
import '../provider/cart.dart';
import 'cart_num.dart';

class CheckoutItem extends StatefulWidget {
  GoodsModel? model;
  CheckoutItem({Key? key, this.model}) : super(key: key);

  @override
  _CheckoutItemState createState() => _CheckoutItemState();
}

class _CheckoutItemState extends State<CheckoutItem> {
  late GoodsModel _model;

  @override
  void initState() {
    super.initState();
    _model = widget.model!;
  }

  @override
  Widget build(BuildContext context) {
    _model = widget.model!;
    return Container(
      height: 140.h,
      padding: EdgeInsets.symmetric(vertical: 10.w),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey[300]!, width: 0.5),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 100.w,
            child: Image.asset(
              "${_model.image}",
              width: 100.w,
              height: 100.h,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.all(10.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${_model.title}",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    height: 40.h,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Positioned(
                          top: 0,
                          left: 0,
                          child: Text(
                            "${_model.price}",
                            style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.red,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 0,
                          right: 0,
                          child: Text("X${_model.num}"),
                        ),
                      ],
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
