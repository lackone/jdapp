import 'package:flutter/material.dart';

class MyAlertDialog {
  static show({
    required BuildContext context,
    required String title,
    required String content,
    Function()? onConfirm,
    Function()? onCancel,
  }) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
                onCancel?.call();
              },
              child: Text("取消"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true);
                onConfirm?.call();
              },
              child: Text("确定"),
            ),
          ],
        );
      },
    );
  }
}
