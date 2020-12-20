import 'package:bytebank/screens/contact_form/contact_form.dart';
import 'package:bytebank/screens/dashboard/dashboard.dart';
import 'package:bytebank/screens/transference/list.dart';
import 'package:flutter/material.dart';

import 'core/theme.dart';

void main() => runApp(BytebankApp());

class BytebankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Dashboard(),
      // home: ListOfTransferences(),
      theme: myThemeData,
    );
  }
}
