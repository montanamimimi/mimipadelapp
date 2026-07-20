import 'package:flutter/material.dart';

// Check why nul in return in any case 

Future<String?> showConfirmDialog({
  required BuildContext context,
  required String title,
  String hintText = '',
  String confirmButtonText = 'Yes',
  TextInputType keyboardType = TextInputType.text,
}) async {

  return showDialog<String>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(title),
        content: Text(hintText),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(
              context,
              'sure'
            ),
            child: Text(confirmButtonText),
          ),
        ],
      );
    },
  );
}