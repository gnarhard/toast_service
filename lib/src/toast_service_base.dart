import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

/// 🍞
class ToastService {
  static const Duration short = Duration(seconds: 2);
  static const Duration long = Duration(seconds: 4);

  final Color colorError;
  final Color colorErrorText;
  final Color colorWarning;
  final Color colorWarningText;
  final Color colorSuccess;
  final Color colorSuccessText;

  ToastService({
    this.colorError = Colors.red,
    this.colorSuccess = Colors.green,
    this.colorWarning = Colors.yellow,
    this.colorErrorText = Colors.white,
    this.colorSuccessText = Colors.white,
    this.colorWarningText = Colors.black54,
  });

  void error(
      {required String message,
      String? devError,
      response,
      required BuildContext context}) {
    final Fluttertoast toast = Fluttertoast();

    if (Platform.environment.containsKey('FLUTTER_TEST')) {
      return;
    }

    if (kDebugMode) {
      message = (devError == null) ? message : "$message $devError";
      message = (response == null)
          ? message
          : "$message ${response.statusCode}: ${response.reasonPhrase}";
      print(message);
    }

    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 2,
        backgroundColor: colorError,
        textColor: colorErrorText,
        fontSize: 16.0);
  }

  void success({required message}) {
    if (Platform.environment.containsKey('FLUTTER_TEST')) {
      return;
    }
    if (kDebugMode) {
      print(message);
    }

    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 2,
        backgroundColor: colorSuccess,
        textColor: colorSuccessText,
        fontSize: 16.0);
  }

  void warning({required message}) {
    if (Platform.environment.containsKey('FLUTTER_TEST')) {
      return;
    }
    if (kDebugMode) {
      print(message);
    }

    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 2,
        backgroundColor: colorWarning,
        textColor: colorWarningText,
        fontSize: 16.0);
  }
}
