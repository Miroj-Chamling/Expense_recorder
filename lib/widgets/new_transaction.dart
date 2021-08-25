import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function adTxt;

  NewTransaction(this.adTxt);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  void _submitData() {
    if (_amountController.text.isEmpty) {
      return;
    }
    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }
    widget.adTxt(enteredTitle, enteredAmount, _selectedDate);
    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2018),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(
            top: 10,
            right: 10,
            left: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom + 13,
          ),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(labelText: 'Title'),
                controller: _titleController,
                onSubmitted: (_) => _submitData(),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Amount'),
                controller: _amountController,
                keyboardType: TextInputType.number,
                onSubmitted: (_) => _submitData(),
              ),
              Container(
                height: 70,
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Picked Date: '
                        '${DateFormat.yMd().format(_selectedDate)}',
                      ),
                    ),
                    FlatButton(
                      onPressed: _presentDatePicker,
                      child: Text(
                        'Choose Date',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.purple),
                      ),
                    ),
                  ],
                ),
              ),
              RaisedButton(
                onPressed: _submitData,
                child: Text(
                  'Add transaction',
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.purple,
              )
            ],
          ),
        ),
      ),
      elevation: 5,
    );
  }
}
