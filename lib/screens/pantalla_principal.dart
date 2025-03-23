import 'package:flutter/material.dart';
import 'package:ssoma_app/screens/pantalla_lista_incidente.dart';

class PantallaPrincipal extends StatefulWidget {
  const PantallaPrincipal({super.key});

  @override
  State<PantallaPrincipal> createState() => _PantallaPrincipalState();
}

class _PantallaPrincipalState extends State<PantallaPrincipal> {
  var _indiceActual = 0;
  final _tads = <Widget>[
    PantallaListaIncidente(),
    Text("tabs 2"),
    Text("tabs 3"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _tads[_indiceActual]),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indiceActual,
        onTap: (value) {
          setState(() {
            _indiceActual = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.add_home_work),
            label: "Formularios",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.usb), label: "usb"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Perfil"),
        ],
      ),
    );
  }
}
