import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';
import'package:intl/intl.dart';
final uuid = Uuid();

enum CategoryList { food, travel, leisure, work }

const CategoryIcons =
{
CategoryList.food : Icons.lunch_dining,
CategoryList.travel : Icons.flight_takeoff,
CategoryList.leisure : Icons.movie,
CategoryList.work : Icons.work,
};

final formatter = DateFormat.yMd();

class expense {
  expense({
    // super.key,
    required this.values,
    required this.date,
    required this.title,
    required this.category,
  }) : id = uuid.v4(); //generate a unique string id.
  final String id;
  final double values;
  final String title;
  final DateTime date;
  final CategoryList category;
  String get formattedDate
  {
return formatter.format(date);
  }
}


class expensebucket
{
  expensebucket
  (
    {
      required this.category,
    required this.expenses
    }
  );//default constructor
  expensebucket.forCategory(List<expense>allExpenses , this.category)://named constructor
  expenses=allExpenses.where((expenseobj) =>( expenseobj.category==category)).toList();

  final CategoryList category;
  final List<expense>expenses;
  double get totalexpenses
{
    double  sum =0 ;
for(final expense in expenses)
  {
    sum += expense.values;
  }
  return sum;
}
}