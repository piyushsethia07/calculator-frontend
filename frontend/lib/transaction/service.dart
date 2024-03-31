import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:frontend/transaction/model.dart';

class TransactionService {
  Future<List<Transaction>> fetchTransactions() async {
    final response = await http.get(Uri.parse('https://calculator-service-pk-embedded-solution.koyeb.app/api/transactions'));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      print(jsonResponse);
      return jsonResponse.map((data) => Transaction.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load transactions');
    }
  }

  Future<void> addTransaction(Transaction transaction) async {
    final response = await http.post(
      Uri.parse('https://calculator-service-pk-embedded-solution.koyeb.app/api/transactions'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        'mobile_number': transaction.mobileNumber,
        'transaction_amount': transaction.transactionAmount,
        'transaction_type': transaction.transactionType,
        'cash_in_out': transaction.cashInOut,
        'person_name': transaction.personName,
      }),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to add transaction');
    }
  }
}