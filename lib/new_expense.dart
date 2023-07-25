// import 'package:flutter/foundation.dart';
import'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';
import'../models/expense.dart';
import'./expenses.dart';

final formatter = DateFormat.yMd();

class NewExpense extends StatefulWidget {
  const NewExpense({super.key ,required this.onAddExpense});
  final void Function (expense expense)onAddExpense;

  @override
  State<NewExpense> createState() => _NewExpenseState();
}
var _enteredTitle = '';

void _saveTitleInput(String inputValue)
{
_enteredTitle = inputValue;
}

class _NewExpenseState extends State<NewExpense> 
{
  final _titleController = TextEditingController();
 final _amountController = TextEditingController();
 DateTime?_selectedDate;
CategoryList _selectedCategory = CategoryList.leisure;
 void _presentStatePicker()async
 {
  final now = DateTime.now();
  final firstDate = DateTime(now.year-1 , now.month , now.day);
  final pickedDate = await showDatePicker(context: context, initialDate: now, firstDate: firstDate, lastDate: now);
  
  setState((){
_selectedDate = pickedDate;
  }
  );
  }
  @override
  void dispose()
  {
    _titleController.dispose();
     _amountController.dispose();
    super.dispose();
  }

  void _submitExpenseData()//to check the error in the input by the user
  {
    final enteredAmount = double.tryParse(_amountController.text);
    final amountIsInvalid = (enteredAmount==null||enteredAmount<=0);
    if(amountIsInvalid||_selectedDate==null||_titleController.text.trim().isEmpty)
    {
showDialog(context: context, builder: (ctx)=>AlertDialog(
title:Text('invalid input') ,
content: Text('Please make sure a valid date , amount , and a category was entered.'),
actions:[
  TextButton(
    onPressed: (){
    Navigator.pop(context);
  }, 
  child: Text('okay'),
  )
]
)
);
return;
    }
    widget.onAddExpense(expense(title:_titleController.text,values:enteredAmount , date:_selectedDate! , category:_selectedCategory));
  Navigator.pop(context);//to close the overlay
  }


  Widget build(BuildContext context) 
  {
    return Padding(padding: const EdgeInsets.fromLTRB(16 , 48 , 16 , 16),
    child:Column
    (
      children: 
      [
      TextField
      (
        controller : _titleController,
        maxLength: 50,
      decoration: InputDecoration
      (
        label:Text('Title')
      ),
      ),

      Row
      (
        children: 
        [
 TextField
      (
        controller:_amountController,
keyboardType:TextInputType.number ,
maxLength: 50,
decoration: const InputDecoration
(
  prefixText: '\$',
  label: Text('Amount'),
)
,
      ),
      const SizedBox(width: 10,),
      Expanded(
        child:Row(
          mainAxisAlignment: MainAxisAlignment.center,
           crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(_selectedDate == null?'no date selected':formatter.format(_selectedDate!),),
            IconButton
            (
            onPressed: () {},
              icon:const Icon(Icons.calendar_month),
            )
          ],
        )
      )
      ],
      ),
      const SizedBox(height:20),

      Row(children: [
        DropdownButton(
          items: CategoryList.values.map
          (
          (category)=>
          DropdownMenuItem
          (
            value : category , 
          child: Text(category.name.toUpperCase()
          )
          )
        ).toList(),

onChanged: (value)
{
setState(() 
{
  if(value == null)
  {
    return;
  }
  else
  {
  _selectedCategory = value;
  }
}
);
}
),

        const Spacer(),
        ElevatedButton(onPressed: ()
        {
          Navigator.pop(context);
          _submitExpenseData();
        }, child: const Text('Save expense'))
      ],)
    ],
    )
    );
  }
}