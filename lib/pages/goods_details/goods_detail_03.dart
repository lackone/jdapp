import 'package:flutter/material.dart';

class GoodsDetail03 extends StatefulWidget {
  GoodsDetail03({Key? key}) : super(key: key);

  @override
  _GoodsDetail03State createState() => _GoodsDetail03State();
}

class _GoodsDetail03State extends State<GoodsDetail03> {
  @override
  void initState() {
    super.initState();
    print("评价");
  }

  @override
  Widget build(BuildContext context) {
    return Container(child: Text("评价"));
  }
}
