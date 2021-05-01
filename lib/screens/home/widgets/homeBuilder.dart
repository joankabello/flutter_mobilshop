import 'package:flutter/material.dart';

class HomeBuilder extends StatefulWidget {
  @override
  _HomeStateBuilder createState() => _HomeStateBuilder();
}

class _HomeStateBuilder extends State<HomeBuilder> {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Home Screen",
          ),
        ],
      ),
    );
  }
}
