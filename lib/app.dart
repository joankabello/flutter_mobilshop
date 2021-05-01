import 'package:flutter/material.dart';
import 'package:flutter_mobilshop/screens/home/homeRoute.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeRoute.provider,
    );
  }
}