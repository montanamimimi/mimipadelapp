import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key, 
    required this._controller, 
    required this.label,
    this.callback,
    this.required = false,
    this.defaultValue = "",

    });

  final TextEditingController _controller;
  final String label;
  final String defaultValue;
  final Future<void> Function()? callback;
  final bool required;
  // final _focusNode = FocusNode();

  @override
  Widget build(BuildContext  context) {
    return TextFormField(
      controller: _controller,
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        label: Text(label),
      ),
      // Why don't work? 
      autofocus: true,
      onFieldSubmitted: (_) async {
        await callback?.call();
      },      
      validator: required 
        ? (value) {
          if (value == null || value.isEmpty) {
            return "Field cannot be empty!";
          }
        }
        : (value) {        
          return null;
        }         
    );
  }
}