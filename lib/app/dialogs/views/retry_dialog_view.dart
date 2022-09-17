import 'package:flutter/material.dart';

import 'package:get/get.dart';

class RetryDialogView extends GetView
{
  final String title;
  final String message;
  final Function retryCallback;
  const RetryDialogView({Key? key,required this.title, required this.message, required this.retryCallback}) : super(key: key);

  @override
  Widget build(BuildContext context)
  {
    return AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: [
        TextButton(onPressed: () async {
          retryCallback();
        }, child: const Text("Retry"))
      ],
    );

  }
}
