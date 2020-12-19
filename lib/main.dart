import 'package:bytebank/screens/transference/list.dart';
import 'package:flutter/material.dart';

void main() => runApp(BytebankApp());

class BytebankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ListOfTransferences(),
      // theme: ThemeData.dark(),
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.purple[800],
        accentColor: Colors.purple[700],
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.purple[700],
          textTheme: ButtonTextTheme.primary,
        ),
      ),
    );
  }
}
