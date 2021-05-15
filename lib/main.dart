import 'package:intl/intl.dart';

import './transaction.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final List<Transaction> transactions = [
    Transaction(
        id: "p1", title: "Head Phone", amount: 300, date: DateTime.now()),
    Transaction(id: "p2", title: "Keyboard", amount: 370, date: DateTime.now())
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Card(
            color: Colors.amberAccent,
            child: Container(
              child: Text("CHART!"),
              width: double.infinity,
            ),
            elevation: 5,
          ),
          Column(
            children: transactions.map((e) {
              return Card(
                child: Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 15.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.green, width: 2),
                      ),
                      padding: EdgeInsets.all(5),
                      child: Text(
                        '₺' + e.amount.toString(),
                        style: TextStyle(
                            color: Colors.grey[600],
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(e.title,style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.bold),),
                        Text(DateFormat('EEE, d/M/y').format(e.date),style: TextStyle(color: Colors.black,fontSize: 12))
                      ],
                    )
                  ],
                ),
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}
