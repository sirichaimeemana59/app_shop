import 'package:app_shop/shop/shopList.dart';
import 'package:flutter/material.dart';

class MainMenu extends StatefulWidget {
  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  //Explicit
  String username = '';
  //EndExplicit
  //Method
  Widget showListMenuSales() {
    return ListTile(
      leading: Icon(Icons.pets, size: 36.0, color: Colors.blue.shade600),
      title: Text('ระบบขายสินค้า'),
      onTap: () {
        //print('object');
        MaterialPageRoute materialPageRoute =
            MaterialPageRoute(builder: (BuildContext context) => ShopList());
        Navigator.of(context).push(materialPageRoute);

        //Navigator.of(context).pop();
      },
    );
  }

  Widget showName(String username) {
    return Text(
      'Name Customer : Sirichai',
      style: TextStyle(
          color: Colors.blue.shade600,
          fontWeight: FontWeight.bold,
          fontSize: 20),
    );
  }

  Widget showImageProfile() {
    return Container(
      width: 80.0,
      height: 80.0,
      child: Image.asset('images/dog.png'),
    );
  }

  Widget showHead(String username) {
    return DrawerHeader(
      child: Column(
        children: [
          showImageProfile(),
          SizedBox(
            height: 8.0,
          ),
          showName(username),
        ],
      ),
    );
  }

  Widget showDrawer(String username) {
    return Drawer(
        child: ListView(
      children: [
        showHead(username),
        showListMenuSales(),
      ],
    ));
  }

  //End Method
  @override
  Widget build(BuildContext context) {
    final username = ModalRoute.of(context).settings.arguments;
    showName(username);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow.shade900,
        title: Text('Menu'),
        actions: [],
      ),
      //สร้าง Object ให้อยู่ใน View
      body: SafeArea(
          child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('images/home.jpg'),
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
      drawer: showDrawer(username),
      // end Column
    );
  }

  Widget menuSalesCard() {
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
                    //color: Colors.blue.shade400,
                    //image: DecorationImage(image: photo),
                    borderRadius: BorderRadius.circular(40 / 2),
                    // ignore: missing_required_param
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('images/dog.png'),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 140,
                      child: Text("ระบบขายสินค้า"),
                    ),
                    ButtonBar(
                      children: [
                        // ignore: deprecated_member_use
                        FlatButton(
                          //child: Text('Edit'),
                          onPressed: () async {
                            print('object');
                          },
                          child: null,
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
