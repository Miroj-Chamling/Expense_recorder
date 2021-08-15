import 'package:flutter/material.dart';

class Chart extends StatelessWidget {
  //this is a getter..
  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      return {'Day': 'T', 'Amount': 300};
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
