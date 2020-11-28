import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:topic6/models/user.dart';
import 'package:topic6/screens/authenticate/authenticate.dart';
import 'package:topic6/screens/home/home.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    //return either home or authenticate widget
    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}
