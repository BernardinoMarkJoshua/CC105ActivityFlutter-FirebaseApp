import 'package:flutter/material.dart';
import 'package:topic6/screens/authenticate/register.dart';
import 'package:topic6/screens/authenticate/sign_in.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn = true;
  void toggleView() {
    setState(() => showSignIn = !showSignIn);
  }

  @override
  Widget build(BuildContext context) {
    if (showSignIn) {
      return signIn(toggleView: toggleView);
    } else {
      return register(toggleView: toggleView);
    }
  }
}
