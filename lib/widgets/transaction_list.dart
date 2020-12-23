import './transaction_item.dart';
import 'package:flutter/material.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deteleTx;
  TransactionList(this.transactions, this.deteleTx);
  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(builder: (ctx, constraints) {
            return Column(
              children: [
                Text(
                  'No transactions added yet!',
                  style: Theme.of(context).textTheme.headline6,
                ),
                const SizedBox(
                  height: 70,
                ),
                Container(
                    height: constraints.maxHeight * 0.6,
                    child: Image.asset(
                      'assets/images/flutterSym.png',
                      fit: BoxFit.cover,
                    ))
              ],
            );
          })
        : ListView(children:
               transactions.map((tx) => TransactionItem(
                key: ValueKey(tx.id),
                transaction: tx,
                 deteleTx: deteleTx
                 )).toList()
                 );
  }
}


