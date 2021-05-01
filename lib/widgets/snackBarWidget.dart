import 'package:flutter/material.dart';

ScaffoldFeatureController snackBarWidget(
  BuildContext context,
  String errorMessage,
  Color color,
) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(errorMessage ?? ""),
      backgroundColor: color,
    ),
  );
}
