import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart' show SvgPicture;

class PantallaListaIncidente extends StatefulWidget {
  const PantallaListaIncidente({super.key});

  @override
  State<PantallaListaIncidente> createState() => _PantallaListaIncidenteState();
}

class _PantallaListaIncidenteState extends State<PantallaListaIncidente> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Perfil ",
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
      drawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.grey[200]),
              child: Center(
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 32,
                        backgroundImage: AssetImage("assets/images/logo2.png"),
                        backgroundColor: Colors.grey[200],
                      ),
                      Text(
                        "SIG Smart Evolution",
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "SSOMA",
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.people, color: Colors.green),
              title: Text("Mi perfil"),
            ),
            ListTile(
              leading: Icon(Icons.lock, color: Colors.green),
              title: Text("Cambiar Contraseña"),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.file_copy, color: Colors.green),
              title: Text("Formulario Incidentes"),
            ),

            ListTile(
              leading: Icon(Icons.file_copy_sharp, color: Colors.green),
              title: Text("Formulario OPT"),
            ),

            ListTile(
              leading: Icon(Icons.file_copy_sharp, color: Colors.green),
              title: Text("Formulario IPERC"),
            ),

            ListTile(
              leading: Icon(Icons.file_copy_sharp, color: Colors.green),
              title: Text("Formulario PETAR"),
            ),
            ListTile(
              leading: Icon(Icons.file_copy_sharp, color: Colors.red),
              title: Text("Formulario Flash Report"),
            ),
            ListTile(
              leading: Icon(Icons.file_copy_sharp, color: Colors.red),
              title: Text("Formulario Accidentes"),
            ),
            Divider(),

            ListTile(
              leading: Icon(Icons.download, color: Colors.black),
              title: Text("Descargar Excel"),
            ),
            ListTile(
              leading: Icon(Icons.settings_backup_restore, color: Colors.black),
              title: Text("Configuraciones"),
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app, color: Colors.black),
              title: Text("Cerrar Sesion"),
            ),
          ],
        ),
      ),
      body: Center(child: Column()),
    );
  }
}
