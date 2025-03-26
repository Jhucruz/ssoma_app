import 'package:flutter/material.dart';
import 'package:ssoma_app/screens/formulario_accidentes_screen.dart'
    show FormularioAccidentesScreen;
import 'package:ssoma_app/screens/formulario_flash_report_screen.dart'
    show FormularioFlashReportScreen;
import 'package:ssoma_app/screens/formulario_iperc_screen.dart'
    show FormularioIpercScreen;
import 'package:ssoma_app/screens/formulario_opt_screen.dart'
    show FormularioOptScreen;
import 'package:ssoma_app/screens/formulario_petar_screen.dart'
    show FormularioPetarScreen;
// Importa las pantallas de los formularios
import '../screens/formulario_incidentes_screen.dart';

class MyDrawerWidet extends StatelessWidget {
  const MyDrawerWidet({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
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
            onTap: () {
              // Navega a la pantalla de perfil si la tienes
              // Navigator.push(context, MaterialPageRoute(builder: (context) => PerfilScreen()));
            },
          ),
          ListTile(
            leading: Icon(Icons.lock, color: Colors.green),
            title: Text("Cambiar Contraseña"),
            onTap: () {
              // Navega a la pantalla de cambio de contraseña si la tienes
              // Navigator.push(context, MaterialPageRoute(builder: (context) => CambiarContrasenaScreen()));
            },
          ),
          Divider(),
          Center(
            // Envolvemos el Text en un Center
            child: Text("U.M San Juan "),
          ),
          ListTile(
            leading: Icon(Icons.file_copy, color: Colors.green),
            title: Text("Formulario Incidentes"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FormularioIncidentesScreen(),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.file_copy_sharp, color: Colors.green),
            title: Text("Formulario OPT"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FormularioOptScreen()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.file_copy_sharp, color: Colors.green),
            title: Text("Formulario IPERC"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FormularioIpercScreen(),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.file_copy_sharp, color: Colors.green),
            title: Text("Formulario PETAR"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FormularioPetarScreen(),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.file_copy_sharp, color: Colors.red),
            title: Text("Formulario Flash Report"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FormularioFlashReportScreen(),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.file_copy_sharp, color: Colors.red),
            title: Text("Formulario Accidentes"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FormularioAccidentesScreen(),
                ),
              );
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.download, color: Colors.black),
            title: Text("Descargar Excel"),
            onTap: () {
              // Navega a la pantalla de descarga de Excel si la tienes
              // Navigator.push(context, MaterialPageRoute(builder: (context) => DescargarExcelScreen()));
            },
          ),
          ListTile(
            leading: Icon(Icons.settings_backup_restore, color: Colors.black),
            title: Text("Configuraciones"),
            onTap: () {
              // Navega a la pantalla de configuraciones si la tienes
              // Navigator.push(context, MaterialPageRoute(builder: (context) => ConfiguracionesScreen()));
            },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app, color: Colors.black),
            title: Text("Cerrar Sesion"),
            onTap: () {
              // Navega a la pantalla de cierre de sesión si la tienes
              // Navigator.push(context, MaterialPageRoute(builder: (context) => CerrarSesionScreen()));
            },
          ),
        ],
      ),
    );
  }
}
