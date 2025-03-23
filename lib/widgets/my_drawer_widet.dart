import 'package:flutter/material.dart';

class MyDrawerWidet extends StatelessWidget {
  const MyDrawerWidet({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
    );
  }
}
