// input_lineas.dart

import 'package:flutter/material.dart';

class InputLineas extends StatelessWidget {
  // Nombre corregido a InputLineas
  final TextEditingController controller;
  final String label;
  final TextInputType keyboardType;
  final bool autocorrect;
  final int? maxLength;
  final int? maxLines;
  final String? Function(String?)? validator;

  const InputLineas({
    // Nombre corregido a InputLineas
    Key? key,
    required this.controller,
    required this.label,
    required this.keyboardType,
    required this.autocorrect,
    required this.maxLength,
    required this.maxLines,
    required this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      autocorrect: autocorrect,
      maxLength: maxLength,
      maxLines: maxLines,
      validator: validator,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
      ),
    );
  }
}
