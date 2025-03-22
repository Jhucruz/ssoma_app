import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart' show BorderSide, BuildContext;

class InputPerzonalizado extends StatelessWidget {
  const InputPerzonalizado({
    super.key,
    required this.label,
    this.autocorrect = true,
    this.controller,
    this.TextInputFormatters,
    this.keyboardType,
    this.maxLength,
    this.icono,
    this.obscureText = false,
  });

  final String label;
  final bool autocorrect;
  final TextEditingController? controller;
  final List<TextInputFormatter>? TextInputFormatters;
  final TextInputType? keyboardType;
  final int? maxLength;
  final IconData? icono;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autocorrect: autocorrect,
      inputFormatters: TextInputFormatters,
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      decoration: InputDecoration(
        prefixIcon: icono != null ? Icon(icono) : null,
        enabledBorder: OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.green),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
        labelText: label,
      ),
    );
  }
}
