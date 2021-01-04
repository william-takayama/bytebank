import 'package:bytebank/models/transference.dart';
import 'package:bytebank/models/transferences.dart';
import 'package:bytebank/screens/transference/form.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// class ListOfTransferences extends StatefulWidget {
//   final List<Transference> _transferences = List();

//   @override
//   State<StatefulWidget> createState() {
//     return StateOfListOfTransferences();
//   }
// }

const _titleAppBar = 'Transferences';

class ListOfTransferences extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titleAppBar),
      ),
      body: Consumer<Transferences>(
        builder: (context, transferences, child) {
          return ListView.builder(
            itemCount: transferences.transferences.length,
            itemBuilder: (context, index) {
              final transference = transferences.transferences[index];
              return TransferenceItem(transference);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return TransferenceForm();
            }),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }

  // void _setTimeOut(Transference receivedTransference, int seconds) {
  //   Future.delayed(Duration(seconds: seconds), () {
  //     debugPrint('receive transference');
  //     debugPrint('$receivedTransference');
  //     _updateTransference(receivedTransference);
  //   });
  // }

  // void _updateTransference(Transference receivedTransference) {
  //   if (receivedTransference != null) {
  //     setState(() {
  //       widget._transferences.add(receivedTransference);
  //     });
  //   }
  // }
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
        title: Text(transference.toStringValue()),
        subtitle: Text(transference.toStringAccount()),
      ),
    );
  }
}
