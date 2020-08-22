import 'package:flutter/material.dart';
import 'package:fridge_app/services/auth.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String username = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[50],
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent[400],
        elevation: 0.0,
        title: Text('Register'),
        actions: <Widget>[
          FlatButton.icon(
              icon: Icon(Icons.person),
              label: Text('Sign In'),
              onPressed: () {
                widget.toggleView();
              })
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50),
        child: Form(
          key: _formKey,
          child: Column(children: <Widget>[
            SizedBox(height: 20.0),
            TextFormField(
                validator: (val) =>
                    val.isEmpty ? 'Please Enter a Username' : null,
                decoration: InputDecoration(
                    icon: Icon(Icons.person), labelText: "Enter a Username"),
                onChanged: (val) {
                  setState(() => username = val);
                }),
            SizedBox(height: 20.0),
            TextFormField(
                decoration: InputDecoration(
                    icon: Icon(Icons.email), labelText: "Enter a Email"),
                validator: (val) =>
                    val.isEmpty ? 'Please Enter an Email' : null,
                onChanged: (val) {
                  setState(() => email = val);
                }),
            SizedBox(height: 20.0),
            TextFormField(
              decoration: InputDecoration(
                  icon: Icon(Icons.lock), labelText: "Enter a Password"),
              obscureText: true,
              validator: (val) => val.length < 6 ? 'Password Invalid' : null,
              onChanged: (val) {
                setState(() => password = val);
              },
            ),
            SizedBox(height: 20.0),
            RaisedButton(
                color: Colors.pink[400],
                child: Text(
                  'Register',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                  if (_formKey.currentState.validate()) {
                    dynamic result = await _auth.registerWithEmailAndPassword(
                        email, password);
                    if (result == null) {
                      setState(() => error = 'Please supply a valid email');
                    }
                  }
                }),
            SizedBox(height: 12.0),
            Text(
              error,
              style: TextStyle(color: Colors.red, fontSize: 14.0),
            ),
          ]),
        ),
      ),
    );
  }
}
