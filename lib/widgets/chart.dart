import 'package:first_app/Models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

//this is a stateless widget
class Chart extends StatelessWidget {
  final List<Transaction> recentTranscations;
  Chart(this.recentTranscations);
  //this is a getter...
  //this is a map...
  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );
      double totalSum = 0.0;

      for (var i = 0; i < recentTranscations.length; i++) {
        if (recentTranscations[i].date.day == weekDay.day &&
            recentTranscations[i].date.month == weekDay.month &&
            recentTranscations[i].date.month == weekDay.year) {
          totalSum += recentTranscations[i].amount;
        }
      }
      print(DateFormat.E(weekDay));
      print(totalSum);
      return {'Day': DateFormat.E(weekDay), 'Amount': totalSum};
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Row(
        children: [],
      ),
    );
  }
}
