import 'package:flutter/material.dart';
import 'package:flutter_collection/AnimatedLoginRegistration/auth_screen.dart';
import 'package:flutter_collection/AnimatedLoginRegistration/constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Collection',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // define textField style globally
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white38,
          border: InputBorder.none,
          hintStyle: TextStyle(color: Colors.black38),
          contentPadding: EdgeInsets.symmetric(
              vertical: defaultPadding * 1.2, horizontal: defaultPadding),
        ),
      ),
      home: AuthScreen(),
    );
  }
}
