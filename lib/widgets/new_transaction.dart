import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function adTxt;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  NewTransaction(this.adTxt);

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }
    adTxt(enteredTitle, enteredAmount);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
              onSubmitted: (_) => submitData(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData(),
            ),
            FlatButton(
              onPressed: submitData,
              child: Text('Add transaction'),
              textColor: Colors.purple,
            )
          ],
        ),
      ),
      elevation: 5,
    );
  }
}
