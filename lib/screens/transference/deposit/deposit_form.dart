import 'package:bytebank/components/editor.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bytebank/models/balance.dart';

const _title = 'Receive Deposit';
const _labelValue = '';
const _hintValue = '0.00';
const _textBtnConfirmation = 'Confirm';
final TextEditingController _fieldValueController = TextEditingController();

class DepositForm extends StatelessWidget {
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
                controller: _fieldValueController,
                label: _labelValue,
                hint: _hintValue,
                icon: Icons.monetization_on),
            ElevatedButton(
              child: Text(_textBtnConfirmation),
              onPressed: () => _createDeposit(context),
            ),
          ],
        ),
      ),
    );
  }

  _createDeposit(context) {
    final double value = double.tryParse(_fieldValueController.text);
    final isValid = _validateDeposit(value);
    if (isValid) {
      _updateState(context, value);
      Navigator.pop(context);
    }
  }

  _validateDeposit(value) {
    final _filledField = value != null;

    return _filledField;
  }

  _updateState(context, value) {
    /**
     * O Consumer busca otimizar nossa aplicação granularizando os constantes 
     * rebuilds (remontagens) que fazemos na nossa aplicação, fazendo com que a 
     * menor parte possível seja remontada. Além disso, também é possível utilizar
     *  o Consumer sem um context (diferente de usar o Provider.of diretamente).
     * 
     * Já o Selector, por sua vez, é um equivalente ao Consumer, 
     * porém com um filtro específico, onde ele tem valores específicos
     *  que ele quer verificar se foram ou não alterados, e não a classe como um todo.
     */
    Provider.of<Balance>(context, listen: false).add(value);
  }
}
