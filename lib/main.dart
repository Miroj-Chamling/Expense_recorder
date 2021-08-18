import 'package:first_app/widgets/chart.dart';

import './widgets/transaction_list.dart';

import './widgets/new_transaction.dart';

import 'package:flutter/material.dart';
import './Models/transaction.dart';
import './widgets/chart.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense Recorder',
      theme: ThemeData(
        primarySwatch: Colors.green,
        accentColor: Colors.pink,
        //errorColor: Colors.redAccent,
        appBarTheme: AppBarTheme(
            color: Colors.pink,
            textTheme: ThemeData.light().textTheme.copyWith(
                    title: TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ))),
        fontFamily: 'Quicksands',
        textTheme: ThemeData.light().textTheme.copyWith(
              title: TextStyle(
                fontFamily: 'Quicksands',
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransacations = [
    /*
    Transaction(
      id: 't1',
      title: 'new tshirt',
      amount: 99.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'new pants',
      amount: 199.99,
      date: DateTime.now(),
    ),
    */
  ];
  List<Transaction> get _recentTransactions {
    return _userTransacations.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

  void _addNewTransaction(
      String txTitle, double txAmount, DateTime choosenDate) {
    final newTx = Transaction(
        id: DateTime.now().toString(),
        title: txTitle,
        amount: txAmount,
        date: choosenDate);
    setState(() {
      _userTransacations.add(newTx);
    });
  }

  //showing up the text area when floating button is pressed.
  void _startAddNewTransacction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: NewTransaction(_addNewTransaction),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  void _deleteTransaction(String id) {
    setState(() {
      _userTransacations.removeWhere((tx) => tx.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Expense Recorder',
        ),
        actions: [
          IconButton(
            onPressed: () => _startAddNewTransacction(context),
            icon: Icon(Icons.add),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Chart(_recentTransactions),
            TransactionList(_userTransacations, _deleteTransaction),
          ],
        ),
      ),
      //adding a floating button
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startAddNewTransacction(context),
      ),
    );
  }
}
