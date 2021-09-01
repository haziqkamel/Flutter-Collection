import 'package:flutter/material.dart';
import 'package:flutter_collection/CustomShapedBottomNavBar/custom_shaped_nav_bar.dart';

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
      ),
      home: CustomShapedNavBar(),
    );
  }
}
