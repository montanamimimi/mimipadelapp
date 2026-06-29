import 'package:flutter/material.dart';

class CustomDateFormField extends StatelessWidget {
  const CustomDateFormField({
    super.key, 
    required this._controller, 
    required this.label, 
    required this._callback
    });

  final TextEditingController _controller;
  final String label;
  final VoidCallback _callback;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        label: Text(label),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Date cannot be empty!";
        }
      },
      onTap: _callback,
    );
  }
}