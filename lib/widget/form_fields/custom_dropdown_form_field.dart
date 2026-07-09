import 'package:flutter/material.dart';

class CustomDropdownFormField extends StatelessWidget {
  const CustomDropdownFormField({
    super.key,     
    required this.label, 
    required this.items,
    required this.onChanged,
    this.initialValue,
  });

  final String label;
  final List<int> items;
  final ValueChanged<int?> onChanged;
  final int? initialValue;

  @override
  Widget build(BuildContext  context) {
    return DropdownButtonFormField<int>(                
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: label,
      ),
      initialValue: initialValue,
      items: items.map((number) {
        return DropdownMenuItem(          
          value: number,
          child: Text(number.toString()),
        );
      })
      .toList(),    
      onChanged: onChanged,
      validator: (value) {
        if (value == null) {
          return "Please select courts";
        }
        return null;
      },                
    );
  }
}