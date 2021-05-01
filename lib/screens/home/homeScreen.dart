import 'package:flutter/material.dart';
import 'package:flutter_mobilshop/screens/home/homeListener.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: SafeArea(
        minimum: const EdgeInsets.all(16),
        child: homeListener(),
      ),
    );
  }
}
