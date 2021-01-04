import 'package:bytebank/models/transference.dart';
import 'package:flutter/material.dart';

class Transferences extends ChangeNotifier {
  final List<Transference> _transferences = [];

  List<Transference> get transferences => _transferences;

  add(Transference newTransference) {
    _transferences.add(newTransference);

    notifyListeners();
  }
}
