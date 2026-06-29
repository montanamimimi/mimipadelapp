import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({super.key, required this._controller, required this.label});

  final TextEditingController _controller;
  final String label;

  @override
  Widget build(BuildContext  context) {
    return TextFormField(
      controller: _controller,
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        label: Text(label),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Field cannot be empty!";
        }
      },              
    );
  }
}