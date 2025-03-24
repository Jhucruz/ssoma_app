import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputPersonalizado extends StatefulWidget {
  const InputPersonalizado({
    super.key,
    required this.label,
    this.autocorrect = true,
    this.controller,
    this.inputFormatters,
    this.keyboardType,
    this.maxLength,
    this.icono,
    this.obscureText = false,
    this.validator,
    this.readOnly = false,
  });

  final String label;
  final bool autocorrect;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final int? maxLength;
  final IconData? icono;
  final bool obscureText;
  final String? Function(String?)? validator;
  final bool readOnly;

  @override
  State<InputPersonalizado> createState() => _InputPersonalizadoState();
}

class _InputPersonalizadoState extends State<InputPersonalizado> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: TextFormField(
        validator: widget.validator,
        autocorrect: widget.autocorrect,
        inputFormatters: widget.inputFormatters,
        controller: widget.controller,
        keyboardType: widget.keyboardType,
        obscureText: _obscureText,
        maxLength: widget.maxLength,
        readOnly: widget.readOnly,

        decoration: InputDecoration(
          prefixIcon: widget.icono != null ? Icon(widget.icono) : null,
          suffixIcon:
              widget.obscureText
                  ? IconButton(
                    icon: Icon(
                      _obscureText ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                  )
                  : null,
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
          labelText: widget.label,
        ),
      ),
    );
  }
}
