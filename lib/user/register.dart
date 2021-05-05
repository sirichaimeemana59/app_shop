import 'package:app_shop/cleass_model/userModel.dart';
import 'package:app_shop/screen/home.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
//import 'package:my_app/cleass_model/userModel.dart';
//import 'package:my_app/screen/home.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

createAlertDialog(BuildContext context) {
  //popupRegisterController registerController = popupRegisterController();
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Sirichai'),
          content: TextField(),
          actions: [
            MaterialButton(
              elevation: 5.0,
              child: Text('OK'),
              onPressed: () {},
            )
          ],
        );
      });
}

class _RegisterState extends State<Register> {
  //Explict ตัวแปร
  //UserModel _user;
  final formKey = GlobalKey<FormState>(); //Validate form
  String nameString,
      lnameString,
      phoneString,
      emailString,
      dobString,
      passwordString;
  //Method
  Widget registerButton() {
    return IconButton(
        icon: Icon(Icons.cloud_upload),
        onPressed: () async {
          //print('You Click save');
          if (formKey.currentState.validate()) {
            formKey.currentState.save();
            final String name = nameString;
            final String email = emailString;
            final String password = passwordString;
            //print('name= $nameString, lname= $lnameString, phone= $phoneString,dob= $dobString, password= $passwordString');
            createUser(name, email, password);

            // setState(() {
            //   _user = user;
            // });
          }
        });
  }

  // ignore: missing_return
  Future<UserModel> createUser(
      //สร้าง Future เพื่อเรียก UserModel และส่งไปสรเาง User
      String name,
      String email,
      String password) async {
    //final String apiCreateUser = "http://127.0.0.1:8000/user_create_user";

    var response = await http.post(
        Uri.http('127.0.0.1:8000', '/user_create_user'),
        body: {"name": name, "email": email, "password": password});
    if (response.statusCode == 200) {
      print('success');
      //contentPopup();
      //createAlertDialog(context);
      MaterialPageRoute materialPageRoute =
          MaterialPageRoute(builder: (BuildContext context) => Home());
      Navigator.of(context).push(materialPageRoute);
    } else {
      print('Error');
    }
  }

  // Future<void> registerThread() async {
  //   //สร้าง Future เพื่อรับข้อมูลจนกว่าข้อมูลจะครบทุกตัว
  //   FirebaseAuth firebaseAuth =
  //       FirebaseAuth.instance; // สร้าง instance เพื่อเรียกใช้งาน Firebase
  //   await firebaseAuth
  //       .createUserWithEmailAndPassword(
  //           email: emailString, password: passwordString)
  //       .then((response) {
  //     print('Register suceess for = $emailString');
  //   }).catchError((response) {
  //     String title = response.code;
  //     String message = response.message;
  //     print('title = $title,message=$message');
  //   });
  // }

  Widget nameText() {
    return TextFormField(
      style: TextStyle(
          color: Colors.blue.shade900,
          fontWeight: FontWeight.bold,
          fontSize: 18.0,
          fontFamily: 'Arvo'),
      decoration: InputDecoration(
        icon: Icon(Icons.face, color: Colors.blue.shade800),
        labelText: 'Displays Name',
        labelStyle: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
        helperText: 'Please inout your first name',
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Please Fill Your Name';
        } else {
          return null;
        }
      },
      onSaved: (String value) {
        nameString = value.trim();
      },
    );
  }

  Widget lastNameText() {
    return TextFormField(
      decoration: InputDecoration(
        icon: Icon(Icons.face, color: Colors.blue.shade800),
        labelText: 'Displays Last Name',
        labelStyle: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
        helperText: 'Please inout your last name',
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Please Fill Your Last Name';
        } else {
          return null;
        }
      },
      onSaved: (String value) {
        lnameString = value.trim();
      },
    );
  }

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

  Widget phoneText() {
    return TextFormField(
      decoration: InputDecoration(
        icon: Icon(Icons.phone, color: Colors.blue.shade800),
        labelText: 'Displays Phone Number',
        labelStyle: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
        helperText: 'Please inout your phone',
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Please Fill Your Phone Number';
        } else {
          return null;
        }
      },
      onSaved: (String value) {
        phoneString = value.trim();
      },
    );
  }

  Widget dobText() {
    return TextFormField(
      decoration: InputDecoration(
        icon: Icon(Icons.calendar_today, color: Colors.blue.shade800),
        labelText: 'Displays Date of birth',
        labelStyle: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
        helperText: 'Please inout your birthday',
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Please Fill Your Birthday';
        } else {
          return null;
        }
      },
      onSaved: (String value) {
        dobString = value.trim();
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

  Widget repasswordText() {
    return TextFormField(
        decoration: InputDecoration(
          icon: Icon(Icons.keyboard, color: Colors.blue.shade800),
          labelText: 'Displays Confirm Password',
          labelStyle:
              TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
          helperText: 'Please inout your confirm password',
        ),
        validator: (String value) {
          if (value.isEmpty) {
            return 'Please Fill Your Confirm Passwrod';
          } else {
            return null;
          }
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow.shade600,
        title: Text('Register'),
        actions: [
          registerButton(),
        ],
      ),
      body: Form(
        key: formKey, //ทำ widget form ครอบเพื่อให้validate
        child: ListView(
          padding: EdgeInsets.all(30.0),
          children: [
            nameText(),
            lastNameText(),
            emailText(),
            phoneText(),
            dobText(),
            passwordText(),
            //repasswordText(),
          ],
        ),
      ),
    );
  }
}
