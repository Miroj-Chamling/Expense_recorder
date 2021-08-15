import 'package:flutter/material.dart';

//this is a stateless widget
class Chart extends StatelessWidget {
  //this is a getter...
  //this is a map...
  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      return {'Day': 'T', 'Amount': 400};
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
