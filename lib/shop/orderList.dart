import 'package:app_shop/shop/payment.dart';
import 'package:flutter/material.dart';

class OrderList extends StatefulWidget {
  @override
  _OrderListState createState() => _OrderListState();
}

class _OrderListState extends State<OrderList> {
  List orderList = [];
  var totalPrice = 0;
  int price = 0;
  @override
  Widget build(BuildContext context) {
    final order = ModalRoute.of(context).settings.arguments;
    orderList = order;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow.shade800,
        title: Text('Check Out'),
        actions: [
          //showOrder(),
        ],
      ),
      body: SafeArea(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            createListView(),
            Container(
              height: 150,
              width: 450,
              margin: EdgeInsets.only(left: 10, right: 10, top: 10),
              decoration: BoxDecoration(
                color: Colors.white70,
                borderRadius: BorderRadius.circular(6.0),
                boxShadow: [
                  BoxShadow(
                      color: Colors.blue.shade600.withOpacity(.3),
                      offset: Offset(0.0, 8.0),
                      blurRadius: 2.0),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Expanded(
                                  child: Container(
                                      margin: EdgeInsets.only(
                                          left: 30, top: 50, bottom: 5),
                                      child: Text('จำนวนสินค้า :' +
                                          orderList.length.toString()))),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Container(
                                  margin: EdgeInsets.only(
                                      left: 30, top: 9, bottom: 5),
                                  child: Text(
                                    'ราคารวม : ' +
                                        totalPrice.toString() +
                                        ' บาท',
                                  )),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    ///margin: EdgeInsets.all(1),
                    child: Row(
                      children: <Widget>[
                        Container(
                          //margin: EdgeInsets.all(50),
                          //width: 40,
                          child: Center(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                paymentButton(),
                                SizedBox(
                                  width: 8.0,
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget createListView() {
    return ListView.builder(
      itemCount: orderList.length,
      itemBuilder: (BuildContext context, int index) {
        totalPrice += int.parse(orderList[index]['price']);
        //orderList.add('1');
        print(totalPrice.toString());
        return Container(
          height: 150,
          width: 150,
          margin: EdgeInsets.only(left: 10, right: 10, top: 10),
          decoration: BoxDecoration(
            color: Colors.white70,
            border: Border.all(width: 2.0, color: Colors.blueGrey),
            borderRadius: BorderRadius.circular(6.0),
            boxShadow: [
              BoxShadow(
                  color: Color(0xFF6078ea).withOpacity(.3),
                  offset: Offset(0.0, 8.0),
                  blurRadius: 8.0),
            ],
          ),
          child: Row(
            children: [
              Container(
                width: 75,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image(
                    image: AssetImage('images/product.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                margin: EdgeInsets.only(left: 10),
              ),
              Expanded(
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Expanded(
                              child: Container(
                                  margin: EdgeInsets.only(
                                      left: 10, top: 15, bottom: 5),
                                  child: Text(
                                    orderList[index]['nameProduct'],
                                  ))),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Container(
                              margin:
                                  EdgeInsets.only(left: 10, top: 15, bottom: 5),
                              child: Text(
                                'Price : ',
                              )),
                          Container(
                              margin:
                                  EdgeInsets.only(left: 10, top: 15, bottom: 5),
                              child: Text(
                                orderList[index]['price'].toString(),
                              )),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Container(
                              margin:
                                  EdgeInsets.only(left: 10, top: 15, bottom: 5),
                              child: Text(
                                'Amount : ',
                              )),
                          Container(
                              margin:
                                  EdgeInsets.only(left: 10, top: 15, bottom: 5),
                              child: Text(
                                orderList[index]['numberofitems'].toString(),
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  Widget paymentButton() {
    // ignore: deprecated_member_use
    return RaisedButton(
      color: Colors.blue.shade800,
      child: Text('Payment', style: TextStyle(color: Colors.white)),
      onPressed: () {
        var materialPageRoute = MaterialPageRoute(
            builder: (context) => PaymentPage(),
            settings: RouteSettings(arguments: orderList));
        Navigator.push(context, materialPageRoute);
      },
    );
  }
}
