import 'dart:ui';

import 'package:app_shop/shop/credit.dart';
import 'package:app_shop/shop/shipping.dart';
import 'package:flutter/material.dart';

class PaymentPage extends StatefulWidget {
  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  var payment = 0;
  List orderList = [];

  @override
  Widget build(BuildContext context) {
    final order = ModalRoute.of(context).settings.arguments;
    orderList = order;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow.shade800,
        title: Text('Payment'),
      ),
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ignore: deprecated_member_use
          RaisedButton(
            color: Colors.white,
            splashColor: Colors.white,
            padding: EdgeInsets.all(15),
            onPressed: () {
              orderList.add({"pay": "1"});
              //print(orderList.toString());
              var materialPageRoute = MaterialPageRoute(
                  builder: (context) => CreditCard(),
                  settings: RouteSettings(arguments: orderList));
              Navigator.push(context, materialPageRoute);
            },
            child: Center(
              child: Container(
                padding: EdgeInsets.all(10),
                height: 180,
                width: 160,
                decoration: BoxDecoration(
                    color: Colors.blue.shade200,
                    borderRadius: BorderRadius.circular(16)),
                child: Image.asset('images/C1.png'),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Center(
              child: Text(
                'ตัดบัตรเครดิต',
                style: TextStyle(color: Colors.blue.shade800),
              ),
            ),
          ),
          // ignore: deprecated_member_use
          RaisedButton(
            color: Colors.white,
            splashColor: Colors.white,
            padding: EdgeInsets.all(1),
            onPressed: () {
              orderList.add({"pay": "2"});
              //print(orderList.toString());
              var materialPageRoute = MaterialPageRoute(
                  builder: (context) => Shipping(),
                  settings: RouteSettings(arguments: orderList));
              Navigator.push(context, materialPageRoute);
            },
            child: Center(
              child: Container(
                padding: EdgeInsets.all(10),
                height: 180,
                width: 160,
                decoration: BoxDecoration(
                    color: Colors.blue.shade200,
                    borderRadius: BorderRadius.circular(16)),
                child: Image.asset('images/P1.png'),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Center(
              child: Text(
                'เก็บเงินปลายทาง',
                style: TextStyle(color: Colors.blue.shade800),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
