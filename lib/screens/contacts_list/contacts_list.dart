import 'package:bytebank/components/my_app_bar.dart';
import 'package:bytebank/database/dao/contact_dao.dart';
import 'package:bytebank/models/contact.dart';
import 'package:bytebank/screens/contact_form/contact_form.dart';
import 'package:flutter/material.dart';

const _appBarTitle = 'Contacts';

class ContactsList extends StatefulWidget {
  final ContactDao _dao = ContactDao();

  @override
  _ContactsListState createState() => _ContactsListState();
}

class _ContactsListState extends State<ContactsList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: _appBarTitle,
      ),
      /**
       * Future builder is when you need to render a async list
       * It needs:
       * 1) initial data to avoid errors
       * 2) Builder to create a scrollable and on demand array of widgets
       * TIP: You can type your FutureBuilder to define which kind of data is going to be
       * TIP2: The snapshot has a connectionstate!
       */
      body: FutureBuilder<List<Contact>>(
        initialData: List(),
        // future: Future.delayed(Duration(seconds: 1)).then((value) => findAll()),
        future: widget._dao.findAll(),
        builder: (context, snapshot) {
          // final List<dynamic> states = [ConnectionState.none,  ConnectionState.waiting, ConnectionState.active, ConnectionState.done,];
          // render() {
          //   states['ConnectionState.done']
          // }
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              break;
            case ConnectionState.waiting:
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                    Text('Loading'),
                  ],
                ),
              );
              break;
            // stream - kind of a download
            case ConnectionState.active:
              break;
            case ConnectionState.done:
              final List<Contact> contacts = snapshot.data;
              return ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  final Contact contact = contacts[index];
                  return _ContactItem(contact);
                },
                itemCount: contacts.length,
              );
          }
          // default value to be returned
          return Text('Unknown error');
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return new ContactForm();
              },
            ),
          );
          setState(() {
            widget.createState();
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class _ContactItem extends StatelessWidget {
  final Contact contact;

  _ContactItem(this.contact);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(contact.name),
        subtitle: Text(
          contact.accountNumber.toString(),
        ),
      ),
    );
  }
}
