import 'package:flutter/material.dart';
import 'package:frontend_temp/transaction/model.dart'; // Ensure this import points to your Transaction model

class AddTransactionDialog extends StatelessWidget {
  final Function(Transaction) onSubmit;

  const AddTransactionDialog({Key? key, required this.onSubmit})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Add Transaction'),
      content: Text('Transaction form yet to be implemented'),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            // Submit the transaction (not implemented in this example)
            // onSubmit(transaction);
            Navigator.of(context).pop();
          },
          child: Text('Submit'),
        ),
      ],
    );
  }
}
