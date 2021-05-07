import 'dart:convert';

import 'package:app_shop/main_menu/mainMenu.dart';
import 'package:app_shop/shop/orderSuccess.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class CreditCard extends StatefulWidget {
  @override
  _CreditCard createState() => _CreditCard();
}

class _CreditCard extends State<CreditCard> {
  final formKey = GlobalKey<FormState>();
  List orderList = [];
  String address, cardName, cardNumber, cv;
  String payment = '';
  @override
  Widget build(BuildContext context) {
    final order = ModalRoute.of(context).settings.arguments;
    orderList = order;
    for (var i = 0; i < orderList.length; i++) {
      print(orderList[i]['pay']);
      if (orderList[i]['pay'] == '1') {
        payment = "ชำระเงินด้วยบัตรเครดิต";
      } else {
        payment = "ชำระเงินปลายทาง";
      }
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow.shade800,
        title: Text('Credit Card'),
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
                Center(
                  child: Text(payment.toString(),
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 25.0)),
                ),
                SizedBox(
                  height: 25.0,
                ),
                cardNameText(),
                cardNumberText(),
                cardCVText(),
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

  Widget cardNameText() {
    return TextFormField(
      style: TextStyle(
        color: Colors.blue.shade900,
        fontWeight: FontWeight.bold,
        fontSize: 18.0,
      ),
      decoration: InputDecoration(
        labelText: 'ช่ือผู้ถือบัตร',
        labelStyle: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
        helperText: 'กรุณาระบุช่ือผู้ถือบัตร',
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return 'กรุณาระบุช่ือผู้ถือบัตร';
        } else {
          return null;
        }
      },
      onSaved: (String value) {
        cardName = value.trim();
      },
    );
  }

  Widget cardNumberText() {
    return TextFormField(
      keyboardType: TextInputType.number,
      inputFormatters: [new LengthLimitingTextInputFormatter(16)],
      style: TextStyle(
        color: Colors.blue.shade900,
        fontWeight: FontWeight.bold,
        fontSize: 18.0,
      ),
      decoration: InputDecoration(
        labelText: 'หมายเลขบัตร',
        labelStyle: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
        helperText: 'กรุณาระบุหมายเลขบัตร',
      ),
      validator: (String value) {
        if (value.length < 16) {
          return 'กรุณาระบุหมายเลขบัตร';
        } else {
          return null;
        }
      },
      onSaved: (String value) {
        cardNumber = value.trim();
      },
    );
  }

  Widget cardCVText() {
    return TextFormField(
      keyboardType: TextInputType.number,
      inputFormatters: [new LengthLimitingTextInputFormatter(3)],
      style: TextStyle(
        color: Colors.blue.shade900,
        fontWeight: FontWeight.bold,
        fontSize: 18.0,
      ),
      decoration: InputDecoration(
        labelText: 'CV',
        labelStyle: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
        helperText: 'กรุณาระบุ CV',
      ),
      validator: (String value) {
        if (value.length < 3) {
          return 'กรุณาระบุ CV';
        } else {
          return null;
        }
      },
      onSaved: (String value) {
        cv = value.trim();
      },
    );
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
          final String cardNameData = cardName;
          final String cardNumData = cardNumber;
          final String cardCVData = cv;
          //orderList.add({'address': addressData});
          var card = {
            'cardName': cardNameData,
            'cardNumber': cardNumData,
            'cardCV': cardCVData,
          };
          final dataOrder = '''[
            {"order": "$orderList"},
            {"address": "$address"},
            {"card": "$card"}
          ]''';
          final json = jsonDecode(dataOrder);
          print(json);
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
