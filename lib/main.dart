import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:topic6/models/user.dart';
import 'package:topic6/screens/wrapper.dart';
import 'package:topic6/services/auth.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: Authservice().user,
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}
