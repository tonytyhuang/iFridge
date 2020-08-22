import 'package:flutter/material.dart';
import 'package:fridge_app/screens/shopping_list.dart';
import 'package:fridge_app/screens/wrapper.dart';
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
        'wrapper': (content) => Wrapper(),
        'shopping_list': (content) => Shopping_List(),
      }
    );
  }
}