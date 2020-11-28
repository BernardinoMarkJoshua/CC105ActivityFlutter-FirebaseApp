import 'package:flutter/material.dart';
import 'package:topic6/models/icecream.dart';
import 'package:topic6/screens/home/brew_list.dart';
import 'package:topic6/screens/home/settings_form.dart';
import 'package:topic6/services/auth.dart';
import 'package:topic6/services/database.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  final Authservice _auth = Authservice();

  @override
  Widget build(BuildContext context) {
    void _showSettingsPanel() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
              child: SettingsForm(),
            );
          });
    }

    return StreamProvider<List<iceCream>>.value(
      value: DatabaseService().icecreams,
      child: Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          title: Text(
            'Jichu\'s Coffee ',
            style: TextStyle(fontSize: 15.0),
          ),
          backgroundColor: Colors.brown[400],
          elevation: 0.0,
          actions: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.person),
              label: Text('logout'),
              onPressed: () async {
                await _auth.signOut();
              },
            ),
            FlatButton.icon(
              icon: Icon(Icons.settings),
              label: Text('settings'),
              onPressed: () => _showSettingsPanel(),
            )
          ],
        ),
        body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/asd.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: IcecreamList()),
      ),
    );
  }
}
