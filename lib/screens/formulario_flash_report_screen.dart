import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart' show SvgPicture;

class FormularioFlashReportScreen extends StatefulWidget {
  const FormularioFlashReportScreen({super.key});

  @override
  State<FormularioFlashReportScreen> createState() =>
      _FormularioFlashReportScreenState();
}

class _FormularioFlashReportScreenState
    extends State<FormularioFlashReportScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Registrarse",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: Colors.green,
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 24.0),
            child: SvgPicture.asset(
              "assets/images/logo.svg",
              height: 32,
              width: 24,
            ),
          ),
        ],
      ),
    );
  }
}
