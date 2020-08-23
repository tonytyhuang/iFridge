import 'package:flutter/material.dart';
import 'package:fridge_app/screens/authenticate/authenticate.dart';
import 'package:fridge_app/screens/home/home.dart';
import 'package:fridge_app/models/user.dart';
import 'package:fridge_app/screens/home_screen.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    print(user);
    if (user == null) {
      return Authenticate();
    } else {
      return HomeScreen();
    }
  }
}
