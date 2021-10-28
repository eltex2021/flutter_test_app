import 'package:flutter/material.dart';

abstract class MySnackBar {
  static SnackBar mySnackBar = SnackBar(
      elevation: 30,
      behavior: SnackBarBehavior.floating,
      width: 230,
      backgroundColor: Colors.grey[800]!.withOpacity(0.8),
      duration: const Duration(milliseconds: 1000),
      content: const Text(
        'Your comment has been sent',
        textAlign: TextAlign.center,
        style: TextStyle(),
      ));
}
