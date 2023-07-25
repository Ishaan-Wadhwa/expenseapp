import 'package:expenseapp/models/expense.dart';
import 'package:expenseapp/widgets/expenses_item.dart';
import 'package:flutter/material.dart';
import 'package:expenseapp/expenses.dart';
import'../models/expense.dart';



class ExpensesList extends StatelessWidget
{
   ExpensesList
  (
  {
    required this.onRemoveExpense,
    required this.YourExpenses,
  }
  );
  final List<expense> YourExpenses;
 final Function (expense expense)onRemoveExpense;
  @override
  Widget build(BuildContext context) 
  {
    return ListView.builder
    (
        itemCount: YourExpenses.length,
        itemBuilder: (ctx, index) =>
         Dismissible
         (
          background: Container(
            color:Theme.of(context).colorScheme.error.withOpacity(0.5),
            margin: EdgeInsets.symmetric
            (
              horizontal:Theme.of(context).cardTheme.margin!.horizontal,
            vertical: Theme.of(context).cardTheme.margin!.vertical
            ),
            ),
          key:ValueKey(YourExpenses[index]) ,
          child:ExpenseItem(YourExpenses[index]),
          onDismissed:((direction)
          {
            onRemoveExpense(YourExpenses[index]);
            }),
         )
        );
  }
}
