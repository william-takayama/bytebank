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

class TransferenceForm extends StatefulWidget {
  final TextEditingController _fieldAccountNumberController =
      TextEditingController();
  final TextEditingController _fieldValueController = TextEditingController();

  void _createTransference(BuildContext context) {
    final int accountNumber = int.tryParse(_fieldAccountNumberController.text);
    final double value = double.tryParse(_fieldValueController.text);
    if (accountNumber != null && value != null) {
      final createdTransference = Transference(value, accountNumber);
      debugPrint('Creating transference');
      debugPrint('$createdTransference');
      Navigator.pop(context, createdTransference);
    }
  }

  @override
  State<StatefulWidget> createState() {
    return StateOfTransferenceForm();
  }
}

class StateOfTransferenceForm extends State<TransferenceForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Appbar'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Editor(
                controller: widget._fieldAccountNumberController,
                label: 'Account Number',
                hint: '0000'),
            Editor(
                controller: widget._fieldValueController,
                label: 'Value',
                hint: '0.00',
                icon: Icons.monetization_on),
            RaisedButton(
              child: Text('Confirm'),
              onPressed: () => widget._createTransference(context),
            ),
          ],
        ),
      ),
    );
  }
}

class Editor extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final IconData icon;

  const Editor({this.controller, this.label, this.hint, this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
      child: TextField(
        controller: controller,
        style: TextStyle(
          fontSize: 24.0,
        ),
        decoration: InputDecoration(
          icon: icon != null ? Icon(icon) : null,
          labelText: label,
          hintText: hint,
        ),
        keyboardType: TextInputType.number,
      ),
    );
  }
}

class ListOfTransferences extends StatefulWidget {
  final List<Transference> _transferences = List();

  @override
  State<StatefulWidget> createState() {
    return StateOfListOfTransferences();
  }
}

class StateOfListOfTransferences extends State<ListOfTransferences> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tranferências'),
      ),
      body: ListView.builder(
        itemCount: widget._transferences.length,
        itemBuilder: (context, index) {
          final transference = widget._transferences[index];
          return TransferenceItem(transference);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final Future<Transference> future =
              Navigator.push(context, MaterialPageRoute(builder: (context) {
            return TransferenceForm();
          }));
          future.then((receivedTransference) {
            Future.delayed(Duration(seconds: 1), () {
              debugPrint('receive transference');
              debugPrint('$receivedTransference');
              if (receivedTransference != null) {
                setState(() {
                  widget._transferences.add(receivedTransference);
                });
              }
            });
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class TransferenceItem extends StatelessWidget {
  final Transference transference;

  TransferenceItem(this.transference);

  @override
  Widget build(BuildContext context) {
    return Card(
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
