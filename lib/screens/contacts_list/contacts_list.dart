import 'package:bytebank/components/my_app_bar.dart';
import 'package:bytebank/screens/contact_form/contact_form.dart';
import 'package:flutter/material.dart';

const _appBarTitle = 'Contacts';

class ContactsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: _appBarTitle,
      ),
      body: ListView(
        children: [
          Card(
            child: ListTile(
              title: Text('Name'),
              subtitle: Text('1000'),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(
                MaterialPageRoute(
                  builder: (context) => ContactForm(),
                ),
              )
              .then(
                (newContact) => debugPrint(
                  newContact.toString(),
                ),
              );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
