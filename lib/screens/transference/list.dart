import 'package:bytebank/models/transference.dart';
import 'package:bytebank/screens/transference/form.dart';
import 'package:flutter/material.dart';

class ListOfTransferences extends StatefulWidget {
  final List<Transference> _transferences = List();

  @override
  State<StatefulWidget> createState() {
    return StateOfListOfTransferences();
  }
}

const _titleAppBar = 'Transferences';

class StateOfListOfTransferences extends State<ListOfTransferences> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titleAppBar),
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
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return TransferenceForm();
            }),
          ).then((receivedTransference) {
            _setTimeOut(receivedTransference, 1);
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void _setTimeOut(Transference receivedTransference, int seconds) {
    Future.delayed(Duration(seconds: seconds), () {
      debugPrint('receive transference');
      debugPrint('$receivedTransference');
      _updateTransference(receivedTransference);
    });
  }

  void _updateTransference(Transference receivedTransference) {
    if (receivedTransference != null) {
      setState(() {
        widget._transferences.add(receivedTransference);
      });
    }
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
