import 'package:flutter/material.dart';

/*
** ThemeData
*/
final _primaryColor = Colors.deepPurple[400];

final myThemeData = ThemeData(
  brightness: Brightness.dark,
  primaryColor: _primaryColor,
  accentColor: _primaryColor,
  buttonTheme: ButtonThemeData(
    buttonColor: _primaryColor,
    textTheme: ButtonTextTheme.primary,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      primary: _primaryColor,
      minimumSize: Size(double.maxFinite, 50),
      textStyle: TextStyle(
        fontSize: 16.0,
      ),
      side: BorderSide(
        color: Color.fromRGBO(84, 84, 84, 1.0),
        width: 1.0,
        style: BorderStyle.solid,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25.0),
      ),
    ),
  ),
);
