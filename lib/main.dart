import 'package:flutter/material.dart';

void main() => runApp(BytebankApp());

class BytebankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: TransferenceForm(),
      ),
    );
  }
}

class TransferenceForm extends StatelessWidget {
  final TextEditingController fieldAccountNumberController =
      TextEditingController();
  final TextEditingController fieldValueController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Appbar'),
        backgroundColor: Colors.red[500],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(24.0, 16.0, 24.0, 16.0),
            child: TextField(
              controller: fieldAccountNumberController,
              style: TextStyle(
                fontSize: 24.0,
              ),
              decoration: InputDecoration(
                labelText: 'Account number',
                hintText: '0000',
              ),
              keyboardType: TextInputType.number,
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
            child: TextField(
              controller: fieldValueController,
              style: TextStyle(
                fontSize: 24.0,
              ),
              decoration: InputDecoration(
                icon: Icon(Icons.monetization_on),
                labelText: 'Value',
                hintText: '0.00',
              ),
              keyboardType: TextInputType.number,
            ),
          ),
          RaisedButton(
            child: Text('Confirm'),
            onPressed: () {
              debugPrint('clicked');
              final int accountNumber =
                  int.tryParse(fieldAccountNumberController.text);
              final double value = double.tryParse(fieldValueController.text);
              if (accountNumber != null && value != null) {
                final createdTransference = Transference(value, accountNumber);
                debugPrint('$createdTransference');
              }
            },
          ),
        ],
      ),
    );
  }
}

class ListOfTransfers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tranferências'),
        backgroundColor: Colors.green[600],
      ),
      body: Column(
        children: [
          TransferItem(Transference(100, 123)),
          TransferItem(Transference(200, 123)),
          TransferItem(Transference(400, 123)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => print('test'),
        child: Icon(Icons.add),
      ),
    );
  }
}

class TransferItem extends StatelessWidget {
  final Transference transference;

  TransferItem(this.transference);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.green[100],
      shadowColor: Colors.black12,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(transference.value.toString()),
        subtitle: Text(transference.accountNumber.toString()),
      ),
    );
  }
}

class Transference {
  final double value;
  final int accountNumber;

  Transference(this.value, this.accountNumber);

  @override
  String toString() {
    return 'Transference{value: $value}, accountNumber: $accountNumber';
  }
}
