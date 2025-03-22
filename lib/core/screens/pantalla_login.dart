import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ssoma_app/core/ui/input_personalizado.dart'
    show InputPerzonalizado;

class PantallaLogin extends StatefulWidget {
  const PantallaLogin({super.key});

  @override
  State<PantallaLogin> createState() => _PantallaLoginState();
}

class _PantallaLoginState extends State<PantallaLogin> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
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
                InputPerzonalizado(
                  controller: _emailController,
                  label: "Correo electronico ",
                  keyboardType: TextInputType.emailAddress,
                  icono: Icons.email,
                ),

                InputPerzonalizado(
                  controller: _passwordController,
                  label: "Contraseña",
                  maxLength: 8,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  icono: Icons.lock,
                ),

                ElevatedButton(onPressed: () {}, child: Text("ingresar")),
                TextButton(onPressed: () {}, child: Text("Registrarse")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
