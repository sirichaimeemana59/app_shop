import 'package:app_shop/user/login.dart';
import 'package:app_shop/user/register.dart';
//import 'package:app_shop/user/user.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
//Method

  Widget showLogo() {
    //สร้าง Widget เพื่อนำไปใช้ใน SafeArea
    return Container(
      width: 120.0,
      height: 120.0,
      child: Image.asset('images/resume.png'),
    );
  }

  Widget showAppName() {
    //สร้าง Widget เพื่อนำไปใช้ใน SafeArea
    return Text(
      'SIRICHAI',
      style: TextStyle(
        fontSize: 30.0,
        color: Colors.blue.shade700,
        fontWeight: FontWeight.bold,
        fontFamily: 'Arvo',
      ),
    );
  }

  Widget singInButton() {
    // ignore: deprecated_member_use
    return RaisedButton(
      color: Colors.blue.shade800,
      child: Text('Sign In', style: TextStyle(color: Colors.white)),
      onPressed: () {
        MaterialPageRoute materialPageRoute =
            MaterialPageRoute(builder: (BuildContext context) => LoginForm());
        Navigator.of(context)
            .push(materialPageRoute); //การสร้าง Route เพื่อเปิดหน้าใหม่
      },
    );
  }

  Widget registerButton() {
    // ignore: deprecated_member_use
    return RaisedButton(
      color: Colors.green.shade700,
      child: Text('Register', style: TextStyle(color: Colors.white)),
      onPressed: () {
        //print('You Click');

        MaterialPageRoute materialPageRoute =
            MaterialPageRoute(builder: (BuildContext context) => Register());
        Navigator.of(context)
            .push(materialPageRoute); //การสร้าง Route เพื่อเปิดหน้าใหม่
      },
    );
  }

  Widget showButton() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        singInButton(),
        SizedBox(
          width: 8.0,
        ),
        registerButton(),
        SizedBox(
          width: 8.0,
        ),
        //apiTestButton()
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //สร้าง Object ให้อยู่ใน View
      body: SafeArea(
          child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('images/PetBackground.png'),
          fit: BoxFit.cover,
        )),
        child: Center(
          //     //set วัตถุให้อยู่กึ่งกลาง
          child: Column(
            mainAxisSize: MainAxisSize.min, //ปรับวัตถให้อยู่กึ่งกลางหน้าจอ
            children: [
              SizedBox(
                height: 500.0,
              ),
              showAppName(),
              SizedBox(
                height: 30.0,
              ),
              showButton(),
            ],
          ),
        ),
      )),
    );
  }
}
