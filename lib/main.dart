import 'package:bytebank/screens/dashboard/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/theme.dart';
import 'database/dao/contact_dao.dart';
import 'models/balance.dart';
import 'models/transferences.dart';

// void main() {
//   runApp(BytebankApp());
//   ContactDao().findAll().then((contacts) => debugPrint(contacts.toString()));
// }
void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => Balance(10),
      ),
      ChangeNotifierProvider(
        create: (context) => Transferences(),
      ),
    ],
    child: BytebankApp(),
  ));
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
