import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/transference.dart';
import 'package:bytebank/models/transferences.dart';
import 'package:bytebank/models/balance.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

const _title = 'Appbar';
const _labelValue = 'Value';
const _hintValue = '0.00';
const _labelAccountNumber = 'Account Number';
const _hintAccountNumber = '0000';
const _textBtnConfirmation = 'Confirm';

// class TransferenceForm extends StatefulWidget {
//   final TextEditingController _fieldAccountNumberController =
//       TextEditingController();
//   final TextEditingController _fieldValueController = TextEditingController();

//   void _createTransference(BuildContext context) {
//     final int accountNumber = int.tryParse(_fieldAccountNumberController.text);
//     final double value = double.tryParse(_fieldValueController.text);
//     if (accountNumber != null && value != null) {
//       final createdTransference = Transference(value, accountNumber);
//       debugPrint('Creating transference');
//       debugPrint('$createdTransference');
//       Navigator.pop(context, createdTransference);
//     }
//   }

//   @override
//   State<StatefulWidget> createState() {
//     return StateOfTransferenceForm();
//   }
// }

class TransferenceForm extends StatelessWidget {
  final TextEditingController _fieldAccountNumberController =
      TextEditingController();
  final TextEditingController _fieldValueController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Editor(
                controller: _fieldAccountNumberController,
                label: _labelAccountNumber,
                hint: _hintAccountNumber),
            Editor(
                controller: _fieldValueController,
                label: _labelValue,
                hint: _hintValue,
                icon: Icons.monetization_on),
            ElevatedButton(
              child: Text(_textBtnConfirmation),
              onPressed: () => _createTransference(context),
            ),
          ],
        ),
      ),
    );
  }

  void _createTransference(BuildContext context) {
    final int accountNumber = int.tryParse(_fieldAccountNumberController.text);
    final double value = double.tryParse(_fieldValueController.text);
    final isValid = _validateTransference(context, accountNumber, value);

    if (isValid) {
      final newTransference = Transference(value, accountNumber);
      debugPrint('Creating transference');
      debugPrint('$newTransference');
      _updateState(context, newTransference, value);
      // Navigator.pop(context, newTransference);
      Navigator.pop(context);
    }
  }

  bool _validateTransference(context, int accountNumber, double value) {
    final _filledFields = accountNumber != null && value != null;
    final _enoughBalance = value <=
        Provider.of<Balance>(
          context,
          listen: false,
        ).value;
    return _filledFields && _enoughBalance;
  }

  _updateState(context, newTransference, double value) {
    Provider.of<Transferences>(context, listen: false).add(newTransference);

    Provider.of<Balance>(context, listen: false).subtract(value);
  }
}
