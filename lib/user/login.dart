import 'dart:convert';

import 'package:app_shop/cleass_model/loginModel.dart';
import 'package:app_shop/main_menu/mainMenu.dart';
import 'package:app_shop/screen/home.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final formKey = GlobalKey<FormState>();
  String emailString, passwordString;
  List users = [];
  //Text Input
  Widget emailText() {
    return TextFormField(
      decoration: InputDecoration(
        icon: Icon(Icons.email, color: Colors.blue.shade800),
        labelText: 'Displays Email',
        labelStyle: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
        helperText: 'Please inout your email',
      ),
      validator: (String value) {
        if (!((value.contains('@')) && (value.contains('.')))) {
          return 'Please Fill Your Email Format Exp. you@gmail.com';
        } else {
          return null;
        }
      },
      onSaved: (String value) {
        emailString = value.trim();
      },
    );
  }

  Widget passwordText() {
    return TextFormField(
      decoration: InputDecoration(
        icon: Icon(Icons.keyboard, color: Colors.blue.shade800),
        labelText: 'Displays Password',
        labelStyle: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
        helperText: 'Please inout your password',
      ),
      validator: (String value) {
        if (value.length < 6) {
          return 'Please Fill Your Password More 6 Charactor';
        } else {
          return null;
        }
      },
      onSaved: (String value) {
        passwordString = value.trim();
      },
    );
  }

  Widget loginButton() {
    // ignore: deprecated_member_use
    return RaisedButton(
      color: Colors.blue.shade900,
      child: Text('Login', style: TextStyle(color: Colors.white)),
      onPressed: () async {
        //print('You Click');
        if (formKey.currentState.validate()) {
          formKey.currentState.save();
          final String email = emailString;
          final String password = passwordString;
          //print('email= $email, password= $password');
          //userLogin(email, password);
          MaterialPageRoute materialPageRoute = MaterialPageRoute(
              builder: (BuildContext context) => MainMenu(),
              settings: RouteSettings(arguments: null));
          Navigator.of(context).push(materialPageRoute);
        }
      },
    );
  }

  // ignore: missing_return
  Future<LoginModel> userLogin(
      //สร้าง Future เพื่อเรียก UserModel และส่งไปสรเาง User
      String email,
      String password) async {
    //final String apiCreateUser = "http://127.0.0.1:8000/user_create_user";

    var response = await http.post(
        Uri.http('127.0.0.1:8000', '/mobile_user_login'),
        body: {"email": email, "password": password});

    var status = json.decode(response.body)['status'];
    //var items = json.decode(response.body)['user'];
    var name = json.decode(response.body)['user_name'];
    //var userData = json.decode(response.body)['user'];

    // print(userData[0]['id']);
    // await FlutterSession().set('userData', userData[0]['id']);
    if (status == 1) {
      // print('success');
      loginAlertDialog(context, name);
    } else {
      //print('Error');
      loginErrorAlertDialog(context);
    }
  }

  Widget cancelButton() {
    // ignore: deprecated_member_use
    return RaisedButton(
      color: Colors.red.shade400,
      child: Text('Cancel', style: TextStyle(color: Colors.white)),
      onPressed: () {
        //print('You Click');
        MaterialPageRoute materialPageRoute =
            MaterialPageRoute(builder: (BuildContext context) => Home());
        Navigator.of(context)
            .push(materialPageRoute); //การสร้าง Route เพื่อเปิดหน้าใหม่
      },
    );
  }

  Widget showButton() {
    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          loginButton(),
          SizedBox(
            width: 8.0,
          ),
          cancelButton(),
        ],
      ),
    );
  }

//Popup Login Success
  loginAlertDialog(BuildContext context, String name) {
    //popupRegisterController registerController = popupRegisterController();
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Center(child: Text('Welcome')),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  Text('Welcome to my family'),
                ],
              ),
            ),
            actions: [
              MaterialButton(
                elevation: 5.0,
                child: Text('OK'),
                onPressed: () {
                  MaterialPageRoute materialPageRoute = MaterialPageRoute(
                      builder: (BuildContext context) => MainMenu(),
                      settings: RouteSettings(arguments: name));
                  Navigator.of(context).push(materialPageRoute);
                },
              )
            ],
          );
        });
  }
//End Popup

//Popup Login Error
  loginErrorAlertDialog(BuildContext context) {
    //popupRegisterController registerController = popupRegisterController();
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Center(child: Text('Login')),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  Text('You Can not login'),
                  Text('Please check your email and password.'),
                ],
              ),
            ),
            actions: [
              MaterialButton(
                elevation: 5.0,
                child: Text('OK'),
                onPressed: () {
                  MaterialPageRoute materialPageRoute = MaterialPageRoute(
                      builder: (BuildContext context) => LoginForm());
                  Navigator.of(context).push(materialPageRoute);
                },
              )
            ],
          );
        });
  }

//End Popup

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow.shade600,
        title: Text('Login'),
        actions: [],
      ),
      body: Form(
          key: formKey,
          child: Center(
            child: ListView(
              padding: EdgeInsets.all(30.0),
              children: [
                emailText(),
                passwordText(),
                SizedBox(
                  height: 25.0,
                ),
                showButton(),
              ],
            ),
          )),
    );
  }
}
