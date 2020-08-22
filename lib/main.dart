import 'package:flutter/material.dart';
import 'package:fridge_app/screens/LoginScreen.dart';
import 'package:fridge_app/screens/shopping_list.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
      routes: {
        'loginScreen': (content) => LoginScreen(),
        'shopping_list': (content) => Shopping_List(),
      }
    );
  }
}
