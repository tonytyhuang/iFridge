import 'package:flutter/material.dart';
import 'package:fridge_app/screens/all_items.dart';
import 'package:fridge_app/screens/welcome_screen.dart';
import 'package:provider/provider.dart';
import 'package:fridge_app/models/user.dart';
import 'package:fridge_app/screens/LoginScreen.dart';
import 'package:fridge_app/screens/shopping_list.dart';
import 'package:fridge_app/screens/input_screen.dart';
import 'screens/home_screen.dart';
import 'package:fridge_app/services/auth.dart';
import 'package:camera/camera.dart';
import 'screens/upload_screen.dart';

List<CameraDescription> cameras = [];

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: HomeScreen(),
          routes: {
            'loginScreen': (content) => LoginScreen(),
            'shopping_list': (content) => Shopping_List(),
            'input_screen': (content) => InputScreen(),
            'all_items': (content) => AllItems(),
            'welcome': (content) => Welcome(),
            'upload_screen': (content) => UploadScreen(),
            'home_screen': (content) => HomeScreen()
          }),
    );
  }
}
