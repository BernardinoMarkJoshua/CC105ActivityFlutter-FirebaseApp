import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:topic6/models/icecream.dart';
import 'package:topic6/screens/home/icecream_tile.dart';

class IcecreamList extends StatefulWidget {
  @override
  _IcecreamListState createState() => _IcecreamListState();
}

class _IcecreamListState extends State<IcecreamList> {
  @override
  Widget build(BuildContext context) {
    final icecream = Provider.of<List<iceCream>>(context) ?? [];

    return ListView.builder(
      itemCount: icecream.length,
      itemBuilder: (context, index) {
        return IcecreamTile(ice: icecream[index]);
      },
    );
  }
}
