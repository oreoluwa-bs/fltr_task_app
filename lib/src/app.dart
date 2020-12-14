import 'package:flutter/material.dart';
import 'package:task_app/src/globals/globals.dart';
import 'package:task_app/src/screens/home/home_screen2.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: themeData,
      home: HomeScreen(),
    );
  }
}
