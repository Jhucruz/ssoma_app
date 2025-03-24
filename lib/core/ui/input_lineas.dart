import 'package:flutter/material.dart';

class InputLineas extends StatelessWidget {
  const InputLineas({
    super.key, // Corrección aquí: usa super.key
    required this.controller,
    required this.label,
    required this.keyboardType,
    required this.autocorrect,
    this.maxLength,
    this.maxLines,
    this.validator,
  }); // Eliminamos : super(key: key);

  final TextEditingController controller;
  final String label;
  final TextInputType keyboardType;
  final bool autocorrect;
  final int? maxLength;
  final int? maxLines;
  final String? Function(String?)? validator;

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
