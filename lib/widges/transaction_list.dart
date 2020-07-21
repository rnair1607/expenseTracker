import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:expense_tracker/models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> userTransactions;

  TransactionList({
    this.userTransactions,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 583,
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          return Card(
            elevation: 10,
            child: Row(
              children: <Widget>[
                Container(
                  width: 90,
                  height: 70,
                  margin: EdgeInsets.symmetric(
                    horizontal: 15.0,
                    vertical: 10.0,
                  ),
                  decoration: BoxDecoration(
                    // borderRadius: BorderRadius.all(
                    //   Radius.circular(100),
                    // ),
                    shape: BoxShape.circle,
                    color: Colors.deepOrangeAccent[100],
                  ),
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        '₹${userTransactions[index].amount.toString()}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      userTransactions[index].title,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      DateFormat('d MMM yyyy')
                          .format(userTransactions[index].date),
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    )
                  ],
                ),
              ],
            ),
          );
        },
        itemCount: userTransactions.length,
      ),
    );
  }
}
