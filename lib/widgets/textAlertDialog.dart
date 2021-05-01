import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

textAlertDialog({
  BuildContext context,
  String title,
  TextEditingController descriptionController,
  List<Widget> actions,
}) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          title ?? "",
          style: TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.bold,
          ),
        ),
        content: TextField(
          autofocus: true,
          textAlign: TextAlign.center,
          controller: descriptionController,
          style: TextStyle(
            height: 1.2,
            color: Colors.black,
          ),
        ),
        actions: actions,
      );
    },
  );
}
