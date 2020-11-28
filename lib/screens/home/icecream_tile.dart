import 'package:flutter/material.dart';
import 'package:topic6/models/icecream.dart';

class IcecreamTile extends StatelessWidget {
  final iceCream ice;
  IcecreamTile({this.ice});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 8.0),
        child: Card(
          margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
          child: ListTile(
            leading: CircleAvatar(
              radius: 25.0,
              backgroundColor: Colors.brown[ice.strength],
              backgroundImage: AssetImage('assets/shape_circle-512.png'),
            ),
            title: Text(ice.name),
            subtitle: Text('Takes ${ice.sugar} sugar(s)'),
          ),
        ));
  }
}
