import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './transaction.dart';

// void main() {
//   runApp(MyHomePage());
// }
void main() => runApp(MyHomePage());

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> transaction = [
    Transaction(
        id: 't1', title: 'transaction 1', amount: 50.55, date: DateTime.now()),
    Transaction(
        id: 't2', title: 'transaction 2', amount: 60.66, date: DateTime.now()),
    Transaction(
        id: 't3', title: 'transaction 3', amount: 720.77, date: DateTime.now()),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              title: Text("menu"),
              elevation: 0.0,
            ),
            body: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                // children: <Widget>[],
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    child: Card(
                      color: Colors.blue,
                      child: Text('chart'),
                      elevation: 5,
                    ),
                  ),

                  // INPUT AREA
                  Card(
                    child: Row(
                      children: <Widget>[
                        new Flexible(
                            child: TextField(
                                decoration: InputDecoration(
                                    border: UnderlineInputBorder(),
                                    labelText: 'Title'))),
                        SizedBox(
                          width: 20.0,
                        ),
                        new Flexible(
                            child: TextField(
                                decoration: InputDecoration(
                                    border: UnderlineInputBorder(),
                                    labelText: 'Amount'))),
                        SizedBox(
                          width: 20.0,
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 22),
                          child: new Flexible(
                            child: ElevatedButton(
                              onPressed: () {},
                              child: Text('Add Transaction'),
                            ),
                          ),
                        ),

                        // TextField()
                      ],
                    ),
                  ),
                  // INPUT AREA
                  //
                  Column(
                      children: transaction.map((tx) {
                    return Card(
                        child: Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            border: Border.all(
                                // color: Colors.black,
                                width: 2,
                                color: Colors.purple),
                          ),
                          padding: EdgeInsets.all(5),
                          child: Text(
                            '${tx.amount}',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.purple),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              tx.title,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            Text(DateFormat('dd-MM-yyyy').format(tx.date),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Colors.grey[500])),
                          ],
                        )
                      ],
                    ));
                  }).toList())
                ])));
  }
}
