import 'package:flutter/material.dart';
import 'package:bytebank/screens/contacts_list/contacts_list.dart';

const _contactText = 'Contacts';

class Contacts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Material(
        color: Theme.of(context).primaryColor,
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ContactsList(),
              ),
            );
          },
          child: Container(
            height: 80,
            width: 80,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.person_outline,
                  size: 24.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 8.0,
                  ),
                  child: Text(
                    _contactText,
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
