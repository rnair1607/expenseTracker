import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';
import './chart_bar.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransaction;

  Chart(this.recentTransaction);

  List<Map<String, Object>> get groupedTransaction {
    return List.generate(7, (index) {
      final weekday = DateTime.now().subtract(
        Duration(days: index),
      );
      var totalSum = 0.0;

      for (var i = 0; i < recentTransaction.length; i++) {
        if (recentTransaction[i].date.day == weekday.day &&
            recentTransaction[i].date.month == weekday.month &&
            recentTransaction[i].date.month == weekday.month) {
          totalSum += recentTransaction[i].amount;
        }
      }

      // print(DateFormat.E().format(weekday));
      // print(totalSum);

      return {
        'Day': DateFormat.E().format(weekday).substring(0, 1),
        'amount': totalSum,
      };
    }).reversed.toList();
  }

  double get maxSpending {
    return groupedTransaction.fold(0.0, (sum, item) {
      return sum + item['amount'];
    });
  }

  @override
  Widget build(BuildContext context) {
    print(groupedTransaction);
    return Container(
      // height: MediaQuery.of(context).size.height * 0.23,
      child: Card(
        elevation: 6,
        margin: EdgeInsets.all(20),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: groupedTransaction.map((data) {
              // return Text('${data['Day']}: ${data['amount']}');
              return Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: ChartBar(
                  label: data['Day'],
                  spendingAmount: data['amount'],
                  spendingPctOfTotal: maxSpending == 0.0
                      ? 0.0
                      : (data['amount'] as double) / maxSpending,
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
