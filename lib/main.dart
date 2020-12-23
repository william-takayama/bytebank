import 'package:bytebank/screens/dashboard/dashboard.dart';
import 'package:flutter/material.dart';

import 'core/theme.dart';
import 'database/dao/contact_dao.dart';

void main() {
  runApp(BytebankApp());
  ContactDao().findAll().then((contacts) => debugPrint(contacts.toString()));
}

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
