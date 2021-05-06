import 'package:app_shop/main_menu/mainMenu.dart';
import 'package:app_shop/shop/orderSuccess.dart';
import 'package:flutter/material.dart';

class Shipping extends StatefulWidget {
  @override
  _ShippingState createState() => _ShippingState();
}

class _ShippingState extends State<Shipping> {
  final formKey = GlobalKey<FormState>();
  List orderList = [];
  String address;
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
      body: Form(
          key: formKey,
          child: Center(
            child: ListView(
              padding: EdgeInsets.all(30.0),
              children: [
                paymentText(),
                SizedBox(
                  height: 25.0,
                ),
                addressText(),
                SizedBox(
                  height: 25.0,
                ),
                showButton(),
              ],
            ),
          )),
    );
  }

  Widget addressText() {
    return TextFormField(
      style: TextStyle(
        color: Colors.blue.shade900,
        fontWeight: FontWeight.bold,
        fontSize: 18.0,
      ),
      decoration: InputDecoration(
        labelText: 'ระบุที่อยู่',
        labelStyle: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
        helperText: 'กรุณาระบุที่อยู่',
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return 'กรุณาระบุที่อยู่';
        } else {
          return null;
        }
      },
      onSaved: (String value) {
        address = value.trim();
      },
    );
  }

  Widget paymentText() {
    String payment = '';
    for (var i = 0; i < orderList.length; i++) {
      print(orderList[i]['pay']);
      if (orderList[i]['pay'] == '1') {
        payment = "ชำระเงินด้วยบัตรเครดิต";
      } else {
        payment = "ชำระเงินปลายทาง";
      }
      //print('object');
    }
    return Text(payment);
  }

  Widget showButton() {
    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          submitButton(),
          SizedBox(
            width: 8.0,
          ),
          cancelButton(),
        ],
      ),
    );
  }

  Widget submitButton() {
    // ignore: deprecated_member_use
    return RaisedButton(
      color: Colors.blue.shade900,
      child: Text('สั่งซื้อ', style: TextStyle(color: Colors.white)),
      onPressed: () async {
        if (formKey.currentState.validate()) {
          formKey.currentState.save();
          final String addressData = address;
          //orderList.add({'address': addressData});
          var data = {'order': orderList, 'address': addressData};
          print(data.toString());
          MaterialPageRoute materialPageRoute =
              MaterialPageRoute(builder: (BuildContext context) => Success());
          Navigator.of(context)
              .push(materialPageRoute); //การสร้าง Route เพื่อเปิดหน้าใหม่
        }
      },
    );
  }

  Widget cancelButton() {
    // ignore: deprecated_member_use
    return RaisedButton(
      color: Colors.red.shade400,
      child: Text('ยกเลิก', style: TextStyle(color: Colors.white)),
      onPressed: () {
        //print('You Click');
        MaterialPageRoute materialPageRoute =
            MaterialPageRoute(builder: (BuildContext context) => MainMenu());
        Navigator.of(context)
            .push(materialPageRoute); //การสร้าง Route เพื่อเปิดหน้าใหม่
      },
    );
  }
}
