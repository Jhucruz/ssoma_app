import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ssoma_app/screens/splash_screen.dart' show SplashScreen;
import 'package:ssoma_app/core/ui/input_personalizado.dart'
    show InputPerzonalizado;
import 'package:ssoma_app/repositories/auth_reporsitory.dart';

class PantallaRegistro extends StatefulWidget {
  const PantallaRegistro({super.key});

  @override
  State<PantallaRegistro> createState() => _PantallaRegistroState();
}

class _PantallaRegistroState extends State<PantallaRegistro> {
  final _formKey = GlobalKey<FormState>();
  final _nombreController = TextEditingController();
  final _apellidoController = TextEditingController();
  final _correoController = TextEditingController();
  final _contraseniaController = TextEditingController();
  final _contraseController = TextEditingController();
  final _empresa = TextEditingController();

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
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 600),
                  child: ListView(
                    padding: EdgeInsets.symmetric(horizontal: 24),

                    children: [
                      SizedBox(height: 16),

                      InputPerzonalizado(
                        controller: _nombreController,
                        label: "Nombres",
                        keyboardType: TextInputType.name,
                        icono: Icons.person_2_outlined,
                      ),
                      SizedBox(
                        height: 16,
                      ), // Mantener solo el SizedBox con height: 16
                      InputPerzonalizado(
                        controller: _apellidoController,
                        label: "Apellidos",
                        keyboardType: TextInputType.name,
                        icono: Icons.person_2_outlined,
                      ),
                      SizedBox(height: 16),
                      InputPerzonalizado(
                        controller: _correoController,
                        label: "Correo electronico",
                        keyboardType: TextInputType.emailAddress,
                        icono: Icons.email,
                      ),
                      SizedBox(height: 16),
                      InputPerzonalizado(
                        controller: _empresa,
                        label: "Empresa ",
                        keyboardType: TextInputType.name,
                        icono: Icons.lock,
                      ),
                      SizedBox(height: 16),
                      InputPerzonalizado(
                        controller: _contraseniaController,
                        label: "Crea una nueva Contraseña",
                        keyboardType: TextInputType.visiblePassword,
                        icono: Icons.lock,
                        obscureText: true,
                        maxLength: 8,
                      ),
                      SizedBox(height: 16),
                      InputPerzonalizado(
                        controller: _contraseController,
                        label: "Repita su contraseña ",
                        keyboardType: TextInputType.visiblePassword,
                        icono: Icons.lock,
                        obscureText: true,
                        maxLength: 8,
                      ),

                      SizedBox(height: 16),

                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () async {
                            try {
                              final authRepo = AuthRepository();
                              await authRepo.registrarUsuario(
                                email: _correoController.text,
                                contrasenia: _contraseniaController.text,
                                nombre: _nombreController.text,
                                apellido: _apellidoController.text,
                                empresa: _empresa.text,
                              );
                              if (context.mounted) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      "Usuario creado corectamente",
                                    ),
                                  ),
                                );
                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) {
                                      return SplashScreen();
                                    },
                                  ),
                                  (route) => route.isFirst,
                                );
                              }
                            } catch (e) {
                              if (context.mounted) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('No se pudo crear usuario'),
                                  ),
                                );
                              }
                            }
                          },

                          child: Text("Registrarse"),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
