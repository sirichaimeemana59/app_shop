import 'package:app_shop/main_menu/mainMenu.dart';
import 'package:flutter/material.dart';

class Success extends StatefulWidget {
  @override
  _SuccessState createState() => _SuccessState();
}

class _SuccessState extends State<Success> {
  Widget showAppName() {
    return Text(
      'คำสั่งซื้อเสร็จสมบูรณ์',
      style: TextStyle(
        fontSize: 30.0,
        color: Colors.blue.shade700,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget backButton() {
    // ignore: deprecated_member_use
    return RaisedButton(
      color: Colors.blue.shade800,
      child: Text('กลับหน้าหลัก', style: TextStyle(color: Colors.white)),
      onPressed: () {
        MaterialPageRoute materialPageRoute =
            MaterialPageRoute(builder: (BuildContext context) => MainMenu());
        Navigator.of(context).push(materialPageRoute);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('images/success.jpg'),
          fit: BoxFit.cover,
        )),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 550.0,
              ),
              showAppName(),
              SizedBox(
                height: 30.0,
              ),
              backButton(),
            ],
          ),
        ),
      )),
    );
  }
}
