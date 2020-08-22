import 'package:flutter/material.dart';
import 'package:fridge_app/services/auth.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
          backgroundColor: Colors.brown[400],
          elevation: 0.0,
          title: Text('Sign In')),
      body: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50),
          child: Form(
            child: Column(children: <Widget>[]),
          )),
    );
  }
}
