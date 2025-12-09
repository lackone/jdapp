import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/cart.dart';

class CartList extends StatefulWidget {
  CartList({Key? key}) : super(key: key);

  @override
  _CartListState createState() => _CartListState();
}

class _CartListState extends State<CartList> {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);

    return Container(
      child: Column(
        children: cart.cartList.map((item) {
          return ListTile(title: Text(item));
        }).toList(),
      ),
    );
  }
}
