import 'package:bytebank/models/transferences.dart';
import 'package:bytebank/screens/transference/list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

final _title = 'Last Transferences';

class LastTransferences extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          _title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        Consumer<Transferences>(
          builder: (context, transferences, child) {
            final _lastTransferences =
                transferences.transferences.reversed.toList();
            final _qty = transferences.transferences.length;
            int size = 2;

            if (_qty == 0) {
              return WithoutTransference();
            }

            if (_qty < 2) {
              size = _qty;
            }
            return ListView.builder(
              padding: const EdgeInsets.all(8.0),
              itemCount: size,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return TransferenceItem(_lastTransferences[index]);
              },
            );
          },
        ),
        RaisedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return ListOfTransferences();
              }),
            );
          },
          child: Text('Transferences'),
        ),
      ],
    );
  }
}

class WithoutTransference extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(40),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          'You hasn\'t any transference yet',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
