import 'package:flutter/material.dart';

class Shipping extends StatefulWidget {
  @override
  _ShippingState createState() => _ShippingState();
}

class _ShippingState extends State<Shipping> {
  List orderList = [];
  @override
  Widget build(BuildContext context) {
    final order = ModalRoute.of(context).settings.arguments;
    orderList = order;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.yellow.shade800,
          title: Text('Shipping'),
          actions: [
            //showOrder(),
          ],
        ),
        body: Text(orderList.toString()));
  }
}
