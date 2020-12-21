import 'package:bytebank/components/editor.dart';
import 'package:bytebank/components/my_app_bar.dart';
import 'package:bytebank/models/contact.dart';
import 'package:flutter/material.dart';

const _appBarTitle = 'Contact Form';
const _labelContactName = 'Name';
const _hintContactName = 'Type your name here';
const _labelContactAccontNumber = 'Account Number';
const _hintContactAccontNumber = '0000';
const _submitButtonText = 'Create';

class ContactForm extends StatefulWidget {
  @override
  _ContactFormState createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final TextEditingController _fieldContactNameController =
      TextEditingController();

  final TextEditingController _fieldContactAccountNumberController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: _appBarTitle,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Editor(
              controller: _fieldContactNameController,
              hint: _hintContactName,
              label: _labelContactName,
              inputType: TextInputType.text,
            ),
            Editor(
              controller: _fieldContactAccountNumberController,
              hint: _hintContactAccontNumber,
              label: _labelContactAccontNumber,
              inputType: TextInputType.number,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 24.0),
              child: ElevatedButton(
                child: Text(_submitButtonText),
                onPressed: () {
                  final String name = _fieldContactNameController.text;
                  final int accountNumber =
                      int.tryParse(_fieldContactAccountNumberController.text);

                  final Contact newContact = Contact(0, name, accountNumber);

                  Navigator.pop(context, newContact);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
