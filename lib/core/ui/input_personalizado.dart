import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputPerzonalizado extends StatefulWidget {
  const InputPerzonalizado({
    super.key,
    required this.label,
    this.autocorrect = true,
    this.controller,
    this.inputFormatters,
    this.keyboardType,
    this.maxLength,
    this.icono,
    this.obscureText = false,
  });

  final String label;
  final bool autocorrect;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final int? maxLength;
  final IconData? icono;
  final bool obscureText;

  @override
  State<InputPerzonalizado> createState() => _InputPerzonalizadoState();
}

class _InputPerzonalizadoState extends State<InputPerzonalizado> {
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
        autocorrect: widget.autocorrect,
        inputFormatters: widget.inputFormatters,
        controller: widget.controller,
        keyboardType: widget.keyboardType,
        obscureText: _obscureText,
        maxLength: widget.maxLength,
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
