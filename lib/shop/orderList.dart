import 'package:flutter/material.dart';
import 'package:footer/footer.dart';

class OrderList extends StatefulWidget {
  @override
  _OrderListState createState() => _OrderListState();
}

class _OrderListState extends State<OrderList> {
  List orderList = [];
  int summaryPrice = 0;
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
      body: createListView(),
    );
  }

  Widget createListView() {
    return ListView.builder(
      itemCount: orderList.length,
      itemBuilder: (BuildContext context, int index) {
        //summaryPrice +=  price;
        //print(summaryPrice);
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
              ),
            ],
          ),
        );
      },
    );
  }
}
