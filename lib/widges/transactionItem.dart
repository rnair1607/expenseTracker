import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    Key key,
    @required this.userTransaction,
    @required this.deleteTransaction,
    @required this.screenWidth,
  }) : super(key: key);

  final Transaction userTransaction;
  final Function deleteTransaction;
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      child: Dismissible(
        background: Container(
          color: Theme.of(context).errorColor,
        ),
        key: Key(userTransaction.id),
        onDismissed: (direction) {
          deleteTransaction(userTransaction.id);
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text('Transaction deleted'),
            ),
          );
        },
        child: ListTile(
          leading: CircleAvatar(
            radius: 30,
            child: Padding(
              padding: const EdgeInsets.all(6),
              child: FittedBox(
                child: Text(
                  '₹${userTransaction.amount.toString()}',
                ),
              ),
            ),
          ),
          title: Text(
            userTransaction.title,
            style: Theme.of(context).textTheme.headline6,
          ),
          subtitle:
              Text(DateFormat('dd MMM yyyy').format(userTransaction.date)),
          trailing: screenWidth > 460
              ? FlatButton.icon(
                  icon: Icon(Icons.delete),
                  label: Text("Delete"),
                  textColor: Theme.of(context).errorColor,
                  onPressed: () {
                    deleteTransaction(userTransaction.id);
                    Scaffold.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Transaction deleted'),
                      ),
                    );
                  },
                )
              : IconButton(
                  icon: Icon(Icons.delete),
                  color: Theme.of(context).errorColor,
                  onPressed: () {
                    deleteTransaction(userTransaction.id);
                    Scaffold.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Transaction deleted'),
                      ),
                    );
                  },
                ),
        ),
      ),
    );
  }
}
