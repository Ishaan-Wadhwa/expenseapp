import 'package:flutter/material.dart';
import './expenses.dart';
// import 'package:expense_tracker/expenses.dart';
var kColorScheme = ColorScheme.fromSeed(seedColor:Color.fromARGB(255, 96, 59, 181));
var kDarkColorScheme = ColorScheme.fromSeed
(
  brightness : Brightness.dark,
  seedColor:Color.fromARGB(255, 96, 59, 181),
  
  );
void main() {
  runApp(
     MaterialApp
    (
      darkTheme: ThemeData.dark().copyWith(
        useMaterial3: true,
        colorScheme: kDarkColorScheme,
      ),
      theme:ThemeData().copyWith
      (
        useMaterial3: true,
        colorScheme: kColorScheme,
        appBarTheme:const  AppBarTheme().copyWith(
          backgroundColor: kColorScheme.onPrimaryContainer,
          foregroundColor: kColorScheme.primaryContainer,
        ),
cardTheme:const CardTheme().copyWith(
  color:kColorScheme.onSecondaryContainer,
  margin:const EdgeInsets.symmetric(horizontal:15 ,
  vertical:8 ),
),
elevatedButtonTheme: ElevatedButtonThemeData
(
style:ElevatedButton.styleFrom(
  backgroundColor: kDarkColorScheme.primaryContainer,
  foregroundColor: kDarkColorScheme.onPrimaryContainer

),
),
textTheme:ThemeData().textTheme.copyWith(
titleLarge:  TextStyle(
  fontWeight: FontWeight.bold,
  color:kColorScheme.onSecondaryContainer,
  fontSize:20,
)
),
        ),
       themeMode:ThemeMode.dark,//default
      home: const Expenses(),
    ),
  );
}

