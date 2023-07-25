import 'package:expenseapp/expenses.dart';
import 'package:expenseapp/models/expense.dart';
import 'package:flutter/material.dart';


class ExpenseItem extends StatelessWidget 
{
  final  expense;
  const ExpenseItem(this.expense, {super.key});


  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              expense.title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                Text(
                  '\$${expense.values.toStringAsFixed(2)}',
                ),
                const Spacer(),
                Row(
                  children: [
                    Icon(CategoryIcons[expense.category]),
                    const SizedBox(width: 8),
                    Text(expense.formattedDate),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}