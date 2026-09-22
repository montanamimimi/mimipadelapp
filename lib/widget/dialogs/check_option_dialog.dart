import 'package:flutter/material.dart';

class CheckOption<T> {
  final T key;
  final String value;

  const CheckOption({
    required this.key,
    required this.value,
  });
}

Future<T?> showCheckOptionDialog<T>({
  required BuildContext context,
  required String title,
  required List<CheckOption<T>> options, 
}) {

  return showDialog<T>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(title),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ...options.map(
              (option) => Column(
                children: [
                  Ink(
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(8),
                    ),              
                    child: InkWell(
                      onTap: () => Navigator.pop(context, option.key),
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        child: Text(option.value),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 12.0,
                  )
                ],
              ),
            ),           
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
        ],
      );
    },
  );
}