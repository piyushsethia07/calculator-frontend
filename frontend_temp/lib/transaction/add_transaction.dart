import 'package:flutter/material.dart';
import 'package:frontend_temp/transaction/model.dart';

class AddEditTransactionScreen extends StatelessWidget {
  final Transaction? transaction;

  AddEditTransactionScreen({Key? key, this.transaction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: transaction != null ? Text('Edit Transaction') : Text('Add Transaction'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                initialValue: transaction != null ? transaction!.mobileNumber : '',
                decoration: InputDecoration(labelText: 'Mobile Number'),
              ),
              TextFormField(
                initialValue: transaction != null ? transaction!.transactionAmount.toString() : '',
                decoration: InputDecoration(labelText: 'Transaction Amount'),
                keyboardType: TextInputType.number,
              ),
              TextFormField(
                initialValue: transaction != null ? transaction!.transactionType : '',
                decoration: InputDecoration(labelText: 'Transaction Type'),
              ),
              TextFormField(
                initialValue: transaction != null ? transaction!.cashInOut : '',
                decoration: InputDecoration(labelText: 'Cash In/Out'),
              ),
              TextFormField(
                initialValue: transaction != null ? transaction!.personName : '',
                decoration: InputDecoration(labelText: 'Person Name'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Implement form submission logic here
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
