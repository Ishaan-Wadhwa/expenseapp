import 'package:flutter/material.dart';
// import '../expenses.dart';
import '../models/expense.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem(this.expenselist , {super.key});
  final expense expenselist;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text
              (
                expenselist.title ,
                style:Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(
                height: 4,
              ),
              Row(
                children: [
                  Text(expenselist.values.toStringAsFixed(2)),
                  const Spacer(),
                  Row(
                    children: [
                       Icon(CategoryIcons[expenselist.category]),
                      const SizedBox(width: 8),
                      Text(expenselist.date.toString()),  
                    ],
                  )
                ],
              )
            ],
          )),
    );
  }
}
