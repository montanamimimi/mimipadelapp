import 'package:flutter/material.dart';

Future<String?> showTextInputDialog({
  required BuildContext context,
  required String title,
  required String initialValue,
  String hintText = '',
  String saveButtonText = 'Save',
  TextInputType keyboardType = TextInputType.text,
}) async {
  final controller = TextEditingController(text: initialValue);

  return showDialog<String>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(title),
        content: TextField(
          controller: controller,
          autofocus: true,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            hintText: hintText,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(
              context,
              controller.text.trim(),
            ),
            child: Text(saveButtonText),
          ),
        ],
      );
    },
  );
}