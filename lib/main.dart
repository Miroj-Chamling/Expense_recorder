<<<<<<< HEAD
import 'package:first_app/widgets/user_transactions.dart';
=======
//expense App
>>>>>>> 3dd722bba92d30898f386970012b858ab778bed2
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My First Flutter App'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            width: double.infinity,
            child: Card(
              color: Colors.blue,
              child: Text(
                'CHART',
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.normal),
              ),
              elevation: 5,
            ),
          ),
          UserTransactions()
        ],
      ),
    );
  }
}
