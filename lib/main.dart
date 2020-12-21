import 'package:bytebank/database/app_database.dart';
import 'package:bytebank/screens/contact_form/contact_form.dart';
import 'package:bytebank/screens/dashboard/dashboard.dart';
import 'package:bytebank/screens/transference/list.dart';
import 'package:flutter/material.dart';

import 'core/theme.dart';
import 'models/contact.dart';

void main() {
  runApp(BytebankApp());
  save(Contact(0, 'test', 1000)).then((id) {
    findAll().then((contacts) => debugPrint(contacts.toString()));
  });
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
