import 'package:flutter/material.dart';

import 'package:expense_tracker/models/transaction.dart';
import 'package:expense_tracker/widges/new_transaction.dart';
import 'package:expense_tracker/widges/transaction_list.dart';

class UserTransaction extends StatefulWidget {
  @override
  _UserTransactionState createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  final List<Transaction> _userTransactions = [
    Transaction(
      id: 'T1',
      title: 'new shoe',
      amount: 1000,
      date: DateTime.now(),
    ),
    Transaction(
      id: 'T2',
      title: 'Groceries',
      amount: 120,
      date: DateTime.now(),
    ),
  ];

  void _addNewTransaction(String title, double amount) {
    final newTx = Transaction(
      id: DateTime.now().toString(),
      title: title,
      amount: amount,
      date: DateTime.now(),
    );

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTransaction(
          addTransaction: _addNewTransaction,
        ),
        TransactionList(userTransactions: _userTransactions),
      ],
    );
  }
}
