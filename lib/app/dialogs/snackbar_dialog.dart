import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SnackBarDialog
{
  static final SnackBarDialog instance = SnackBarDialog.internal();

  SnackBarDialog.internal();

  factory SnackBarDialog() {
    return instance;
  }

  void show(String title,String message, {Color? color})
  {
    title = title.length > 100?title.substring(0,100):title;
    message = message.length > 200?message.substring(0,200):message;
    Get.snackbar(title, message,colorText: Colors.white,backgroundColor: color??Colors.black87);
  }

}
