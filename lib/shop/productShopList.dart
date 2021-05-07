import 'dart:convert';

import 'package:app_shop/shop/orderProduct.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProductShopList extends StatefulWidget {
  @override
  _ProductShopList createState() => _ProductShopList();
}

class Item {
  String nameTH;
  String nameEN;
  int price;
  int priceTo;
  String detailTH;
  String detailEN;
  String id;
  int numberofitems;

  Item(
      {this.nameTH,
      this.nameEN,
      this.price,
      this.detailTH,
      this.detailEN,
      this.id,
      this.numberofitems});
}

class _ProductShopList extends State<ProductShopList> {
  var values = [];
  //Valiable
  // ignore: deprecated_member_use
  List productList = [];
  List cartProduct = [];
  int numItem = 1;
  // ignore: avoid_init_to_null
  int idItem = null;

  //End Valiable
  //setState
  void initState() {
    super.initState();
    this.fetchProductList(null);
  }

//Cart Shop
  // ignore: missing_return
  Future<List<Item>> cartShop(
      // ignore: non_constant_identifier_names
      nameProduct,
      price,
      id,
      numberofitems,
      priceTo,
      // ignore: non_constant_identifier_names
      id_shop) async {
    values = [
      {
        "nameProduct": nameProduct,
        "price": price,
        "id": id,
        "numberofitems": 1,
        "priceTo": price,
        "id_shop": id_shop
      }
    ];

    //return values;
    if (nameProduct != null) {
      if (mounted)
        setState(() {
          cartProduct.addAll(values);
        });
    }

    //print(cartFood.length);
  }

//End Cart
  //End setState
  //Connect API
  fetchProductList(id) async {
    var response = await http.get(
      Uri.http('127.0.0.1:8000', '/user_create_product_list/' + "$id"),
    );
    //print(response.body);
    if (response.statusCode == 200) {
      var status = json.decode(response.body)['status'];
      var items = json.decode(response.body)['product'];
      // print(status);
      if (status == 0) {
        //print('object');
        if (mounted)
          setState(() {
            productList = [];
          });
      } else {
        //print(items);
        if (mounted)
          setState(() {
            productList = items;
          });
      }
    } else {
      setState(() {
        productList = [];
      });
    }
  }

  //End Connect
  //List View
  Widget getbody() {
    return ListView.builder(
        itemCount: productList.length,
        itemBuilder: (context, index) {
          return getCard(productList[index]);
        });
  }

  Widget getCard(item) {
    //print(item);
    var nameProduct = item['name'];
    var detail = item['detail'];
    var price = item['price'].toString();
    var id = item['id'];
    // ignore: non_constant_identifier_names
    var id_shop = item['id_shop'];
    int numberofitems = 0;
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
                    borderRadius: BorderRadius.circular(1),
                    // ignore: missing_required_param
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('images/product.png'),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 140,
                      child: Text("Product Name : " + nameProduct),
                    ),
                    SizedBox(height: 8.0),
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 140,
                      child: Text("Detail : " + detail),
                    ),
                    SizedBox(height: 8.0),
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 140,
                      child: Text("Price : " + price),
                    ),
                    SizedBox(height: 8.0),
                    ButtonBar(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          // child: Text(
                          //   (idItem == id)
                          //       ? numItem.toString().padLeft(2, "")
                          //       : "1",
                          // ),
                        ),
                        // ignore: deprecated_member_use
                        FlatButton.icon(
                          shape: OutlineInputBorder(
                              borderSide: BorderSide(
                                  style: BorderStyle.solid,
                                  width: 1.0,
                                  color: Colors.blue.shade800),
                              borderRadius: BorderRadius.circular(8)),
                          onPressed: () {
                            cartShop(nameProduct, price, id, numberofitems,
                                price, id_shop);
                            // setState(() {
                            //   idItem = id;
                            //   numItem++;
                            // });
                          },
                          icon: Center(child: Icon(Icons.shopping_bag)),
                          label: Text(''),
                        )
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

  //End view

  @override
  Widget build(BuildContext context) {
    final idShop = ModalRoute.of(context).settings.arguments;
    fetchProductList(idShop.toString());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow.shade800,
        title: Text('Shop'),
        actions: [
          submitCart(),
        ],
      ),
      body: getbody(),
    );
  }

  Widget submitCart() {
    return IconButton(
        icon: Icon(Icons.shopping_basket),
        onPressed: () async {
          var materialPageRoute = MaterialPageRoute(
              builder: (context) => OrderProductList(),
              settings: RouteSettings(arguments: cartProduct));
          Navigator.push(context, materialPageRoute);

          //print(cartProduct);
        });
  }
}

// class UserID extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Material(
//         child: FutureBuilder(
//             future: FlutterSession().get('userData'),
//             builder: (context, snapshot) {
//               return Text(snapshot.hasData ? snapshot.data : 'Loading...');
//             }));
//   }
// }
