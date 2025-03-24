import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ssoma_app/repositories/auth_reporsitory.dart';
import 'package:ssoma_app/screens/pantalla_registro.dart';
import 'package:ssoma_app/core/ui/input_personalizado.dart'
    show InputPerzonalizado;
import 'package:ssoma_app/screens/splash_screen.dart' show SplashScreen;

class PantallaLogin extends StatefulWidget {
  const PantallaLogin({super.key});

  @override
  State<PantallaLogin> createState() => _PantallaLoginState();
}

class _PantallaLoginState extends State<PantallaLogin> {
  final _formKey = GlobalKey<FormState>(); // Clave para el formulario
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final authRepo = AuthRepository();
  bool isFinished = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey, // Asigna la clave al formulario
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              spacing: 12,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset("assets/images/logo.svg", height: 80),
                Text(
                  "SIG Smart Evolution SSOMA",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Colors.green,
                  ),
                ),
                Divider(height: 24),
                SizedBox(
                  width: 600,
                  child: InputPerzonalizado(
                    controller: _emailController,
                    label: "Correo electronico ",
                    keyboardType: TextInputType.emailAddress,
                    icono: Icons.email,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Ingrese su correo electrónico";
                      }
                      if (!RegExp(
                        r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[\w-]{2,4}$',
                      ).hasMatch(value)) {
                        return "Ingrese un correo electrónico válido";
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  width: 600,
                  child: InputPerzonalizado(
                    controller: _passwordController,
                    label: "Contraseña",
                    maxLength: 8,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    icono: Icons.lock,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Ingrese su contraseña";
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 6),
                Row(
                  children: [
                    Checkbox(
                      value: isFinished,
                      onChanged: (value) {
                        isFinished = value!;
                        setState(() {});
                      },
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("Al continuar aceptas los Terminos y"),
                          Text("Condiciones y Politicas de privacidad"),
                        ],
                      ),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      try {
                        await authRepo.login(
                          correo: _emailController.text,
                          contrasenia: _passwordController.text,
                        );
                        if (context.mounted) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (_) {
                                return SplashScreen();
                              },
                            ),
                          );
                        }
                      } catch (e) {
                        if (context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('No se pudo ingresar al sistema'),
                            ),
                          );
                        }
                      }
                    }
                  },
                  child: Text('Ingresar'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) {
                          return PantallaRegistro();
                        },
                      ),
                    );
                  },
                  child: Text("Registrarse"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
