import 'package:flutter/material.dart';

class LoginSuccess extends StatefulWidget {
  @override
  _LoginSuccessState createState() => _LoginSuccessState();
}

class _LoginSuccessState extends State<LoginSuccess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //สร้าง Object ให้อยู่ใน View
      appBar: AppBar(
        backgroundColor: Colors.yellow.shade600,
        title: Text('Welcome'),
      ),
      body: SafeArea(
          child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('images/background1.png'),
          fit: BoxFit.cover,
        )),
        child: Center(
          //     //set วัตถุให้อยู่กึ่งกลาง
          child: Column(
            mainAxisSize: MainAxisSize.min, //ปรับวัตถให้อยู่กึ่งกลางหน้าจอ
            children: [],
          ),
        ),
      )),
      // end Column
      //User row เรียงวัตถุจาซ้ายไปขวา
      //     child: Row(
      //   children: [showAppName(), showAppName(), showAppName(), showAppName()],
      // )),
      // end row
    );
  }
}
