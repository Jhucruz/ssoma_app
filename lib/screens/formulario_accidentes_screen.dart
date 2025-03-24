import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart' show SvgPicture;

class FormularioAccidentesScreen extends StatefulWidget {
  const FormularioAccidentesScreen({super.key});

  @override
  State<FormularioAccidentesScreen> createState() =>
      _FormularioAccidentesScreenState();
}

class _FormularioAccidentesScreenState
    extends State<FormularioAccidentesScreen> {
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
      body: Column(children: [
        
      ],),
    );
  }
}
