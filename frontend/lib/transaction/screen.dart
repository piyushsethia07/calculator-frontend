import 'package:flutter/material.dart';
import 'package:frontend/transaction/model.dart';
import 'package:frontend/transaction/service.dart';
import 'package:frontend/transaction/add_transaction.dart';

class TransactionsPage extends StatefulWidget {
  @override
  _TransactionsPageState createState() => _TransactionsPageState();
}

class _TransactionsPageState extends State<TransactionsPage> {
  final TransactionService _transactionService = TransactionService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transactions'),
      ),
      body: FutureBuilder<List<Transaction>>(
        future: _transactionService.fetchTransactions(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                Transaction transaction = snapshot.data![index];
                return ListTile(
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Top Row - 30% for transactionType
                      Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Text(
                              transaction.transactionType,
                              style: TextStyle(fontSize: 18), // Adjust font size as needed
                            ),
                          ),
                          Expanded(
                            flex: 7,
                            child: SizedBox(), // Placeholder for second column
                          ),
                        ],
                      ),
                      // Bottom Row - Divided into 3 columns
                      Row(
                        children: [
                          // First Column - Phone Icon
                          Expanded(
                            flex: 2,
                            child: Icon(
                              transaction.cashInOut == 'In' ? Icons.arrow_downward : Icons.arrow_upward,
                              color: transaction.cashInOut == 'In' ? Colors.green : Colors.red,
                            ),
                          ),
                          // Middle Column - transaction.personName and transaction.time
                          Expanded(
                            flex: 8,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  transaction.personName ?? 'Unknown',
                                  style: TextStyle(fontSize: 16), // Adjust font size as needed
                                ),
                                Text(
                                  transaction.time,
                                  style: TextStyle(fontSize: 14, color: Colors.grey), // Adjust font size and color as needed
                                ),
                              ],
                            ),
                          ),
                          // Last Column - transaction.transactionAmount
                          Expanded(
                            flex: 2,
                            child: Text(
                              '₹' + transaction.transactionAmount.toString(),
                              textAlign: TextAlign.end,
                              style: TextStyle(fontSize: 16), // Adjust font size as needed
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showDialog(
          context: context,
          builder: (BuildContext context) => AddTransactionDialog(onSubmit: (Transaction transaction) {
            _transactionService.addTransaction(transaction).then((_) {
              setState(() {}); // Refresh the list after adding a transaction
            });
          }),
        ),
        child: Icon(Icons.add),
      ),
    );
  }
}