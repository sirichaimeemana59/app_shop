import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UserList extends StatefulWidget {
  @override
  _UserListState createState() => _UserListState();
}

var data;

class _UserListState extends State<UserList> {
  //UserAccount _dataFromAPI;
  List users = [];
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    this.fetchUser();
    //getUser();
  }

  // ignore: missing_return
  fetchUser() async {
    var response =
        await http.get(Uri.http('127.0.0.1:8000', '/mobile_user_list'));
    if (response.statusCode == 200) {
      var items = json.decode(response.body);
      //print(items[0]['name']);
      setState(() {
        users = items;
      });
    } else {
      setState(() {
        users = [];
      });
    }
    //print(userAccountFromJson(response.body));
  }

  @override
  Widget build(BuildContext context) {
    //getUser();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow.shade600,
        title: Text('User'),
      ),
      body: getBody(),
    );
  }

  Widget getBody() {
    //List items = ["1", "2"];
    return ListView.builder(
        //int len = users.length;
        itemCount: users.length,
        itemBuilder: (context, index) {
          return getCard(users[index]);
        });
  }

  Widget getCard(item) {
    var fullName = item['name'];
    var email = item['email'];
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListTile(
          title: Row(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                    color: Colors.blue.shade400,
                    borderRadius: BorderRadius.circular(60 / 2)),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 140,
                    child: Text(fullName),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 140,
                    child: Text(email),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

// Future<UserModel> getUser() async {
//   //final url = 'http://127.0.0.1:8000/mobile_user_list';
//   final response =
//       await http.get(Uri.https('127.0.0.1:8000', '/mobile_user_list'));

//   if (response.statusCode == 200) {
//     String jsonUser = jsonDecode(response.body);
//     return UserModel.formJson(jsonUser);
//   } else {
//     throw Exception();
//   }
// }
