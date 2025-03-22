import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:ssoma_app/repositories/auth_reporsitory.dart';
import 'package:ssoma_app/core/screens/pantalla_login.dart';
import 'package:ssoma_app/core/screens/pantalla_principal.dart';

class SplashScrren extends StatefulWidget {
  const SplashScrren({super.key});

  @override
  State<SplashScrren> createState() => _SplashScrrenState();
}

class _SplashScrrenState extends State<SplashScrren> {
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      _verificarUsuarioLogeado();
    });
  }

  void _verificarUsuarioLogeado() {
    final authRepository = AuthRepository();

    final estaLogeado = authRepository.estaLogeado();

    if (estaLogeado) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) {
            return PantallaPrincipal();
          },
        ),
      );
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) {
            return PantallaLogin();
          },
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}
