class Transaction {
  final int id;
  final String mobileNumber;
  final String? personName;
  final double transactionAmount;
  final String transactionType;
  final String cashInOut;
  final String date;
  final String time;

  Transaction({
    required this.id,
    required this.mobileNumber,
    this.personName,
    required this.transactionAmount,
    required this.transactionType,
    required this.cashInOut,
    required this.date,
    required this.time
  });

  factory Transaction.fromJson(Map<String, dynamic> json) {
    int createdAt = json['created_at'];

    // Convert epoch timestamp to DateTime
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(createdAt);

    // Extract date and time strings
    String date = '${dateTime.year}-${dateTime.month}-${dateTime.day}';
    String time = '${dateTime.hour}:${dateTime.minute}:${dateTime.second}';
    return Transaction(
      id: json['id'],
      mobileNumber: json['mobile_number'],
      personName: json['person_name'],
      transactionAmount: json['transaction_amount'].toDouble(),
      transactionType: json['transaction_type'],
      cashInOut: json['cash_in_out'],
      date: date,
      time: time,
    );
  }
}