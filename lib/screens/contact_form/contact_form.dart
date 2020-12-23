import 'package:bytebank/components/editor.dart';
import 'package:bytebank/components/my_app_bar.dart';
import 'package:bytebank/database/dao/contact_dao.dart';
import 'package:bytebank/models/contact.dart';
import 'package:flutter/material.dart';

const _appBarTitle = 'Contact Form';
const _labelContactName = 'Name';
const _hintContactName = 'Type your name here';
const _labelContactAccontNumber = 'Account Number';
const _hintContactAccontNumber = '0000';
const _submitButtonText = 'Create';

class ContactForm extends StatefulWidget {
  final TextEditingController _fieldContactNameController =
      TextEditingController();

  final TextEditingController _fieldContactAccountNumberController =
      TextEditingController();

  final ContactDao _dao = ContactDao();

  @override
  _ContactFormState createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
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
              controller: widget._fieldContactNameController,
              hint: _hintContactName,
              label: _labelContactName,
              inputType: TextInputType.text,
            ),
            Editor(
              controller: widget._fieldContactAccountNumberController,
              hint: _hintContactAccontNumber,
              label: _labelContactAccontNumber,
              inputType: TextInputType.number,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 24.0),
              child: ElevatedButton(
                child: Text(_submitButtonText),
                onPressed: () {
                  final String name = widget._fieldContactNameController.text;
                  final int accountNumber = int.tryParse(
                      widget._fieldContactAccountNumberController.text);

                  final Contact newContact = Contact(0, name, accountNumber);

                  widget._dao
                      .save(newContact)
                      .then((int id) => Navigator.pop(context));
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
