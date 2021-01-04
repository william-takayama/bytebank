import 'package:bytebank/components/my_app_bar.dart';
import 'package:bytebank/screens/dashboard/widgets/balance.dart';
import 'package:bytebank/screens/dashboard/widgets/contacts.dart';
import 'package:bytebank/screens/transference/deposit/deposit_form.dart';
import 'package:bytebank/screens/transference/form.dart';
import 'package:bytebank/screens/transference/last.dart';
import 'package:flutter/material.dart';

const _appBarTitle = 'Dashboard';
const _logoImage = 'assets/images/logo/logo_bytebank.png';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: _appBarTitle,
      ),
      body: Flex(
        direction: Axis.vertical,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.asset(
              _logoImage,
              width: 120,
              height: 120,
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: BalanceCard(),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: [
              RaisedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return DepositForm();
                  }));
                },
                child: Text('Add'),
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return TransferenceForm();
                    }),
                  );
                },
                child: Text('New transference'),
              ),
            ],
          ),
          LastTransferences(),
          Contacts(),
        ],
      ),
    );
  }
}
