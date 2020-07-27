import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:expense_tracker/models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> userTransactions;
  final Function deleteTransaction;

  TransactionList({
    this.userTransactions,
    this.deleteTransaction,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.67,
      child: userTransactions.isEmpty
          ? LayoutBuilder(
              builder: (context, constraints) {
                return Column(
                  children: <Widget>[
                    Text(
                      "No Transactions added yet",
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: constraints.maxHeight * 0.6,
                      child: Image.asset(
                        'assets/images/waiting.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                );
              },
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                  child: Dismissible(
                    background: Container(
                      color: Theme.of(context).errorColor,
                    ),
                    key: Key(userTransactions[index].id),
                    onDismissed: (direction) {
                      deleteTransaction(userTransactions[index].id);
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
                              '₹${userTransactions[index].amount.toString()}',
                            ),
                          ),
                        ),
                      ),
                      title: Text(
                        userTransactions[index].title,
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      subtitle: Text(DateFormat('dd MMM yyyy')
                          .format(userTransactions[index].date)),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        color: Theme.of(context).errorColor,
                        onPressed: () {
                          deleteTransaction(userTransactions[index].id);
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
              },
              itemCount: userTransactions.length,
            ),
    );
  }
}
