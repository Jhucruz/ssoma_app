import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ssoma_app/screens/splash_screen.dart' show SplashScreen;
import 'package:ssoma_app/core/ui/input_personalizado.dart'
    show InputPersonalizado;
import 'package:ssoma_app/repositories/auth_reporsitory.dart';
import 'package:uuid/uuid.dart';

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
  final _fechaCreacionController = TextEditingController();
  final DateTime _fechaCreacion = DateTime.now();

  final List<Map<String, String>> _empresas = [
    {"id": "1", "name": 'Empresa A'},
    {"id": "2", "name": 'Empresa B'},
    {"id": "3", "name": 'Empresa C'},
    {"id": "4", "name": 'Empresa D'},
    {"id": "5", "name": 'Empresa E'},
    {"id": "6", "name": 'Empresa F'},
    {"id": "7", "name": 'Empresa G'},
    {"id": "8", "name": 'Empresa H'},
    {"id": "9", "name": 'Empresa I'},
    {"id": "10", "name": 'Empresa J'},
  ];
  String? _empresaId;
  String? _empresaUuid;

  final List<Map<String, String>> _mineras = [
    {"id": "1", "name": 'Minera A'},
    {"id": "2", "name": "Minera B"},
    {"id": "3", "name": "Minera c"},
    {"id": "4", "name": "Minera D"},
    {"id": "5", "name": "Minera E"},
    {"id": "6", "name": "Minera F"},
    {"id": "7", "name": "Minera G"},
  ];

  String? _mineraId;
  String? _mineraUuid;

  @override
  void initState() {
    super.initState();
    _fechaCreacionController.text =
        "${_fechaCreacion.day}/${_fechaCreacion.month}/${_fechaCreacion.year}";
  }

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
                      InputPersonalizado(
                        controller: _fechaCreacionController,
                        label: "Fecha de Registro",
                        readOnly: true,
                      ),
                      SizedBox(height: 16),
                      InputPersonalizado(
                        controller: _nombreController,
                        label: "Nombres",
                        keyboardType: TextInputType.name,
                        icono: Icons.person_2_outlined,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Ingrese su nombre";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16),
                      InputPersonalizado(
                        controller: _apellidoController,
                        label: "Apellidos",
                        keyboardType: TextInputType.name,
                        icono: Icons.person_2_outlined,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Ingrese su apellido";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16),

                      DropdownButtonFormField<String>(
                        value: _mineraId,
                        items:
                            _mineras.map((minera) {
                              return DropdownMenuItem<String>(
                                value: minera["id"],
                                child: Text(minera["name"]!),
                              );
                            }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            _mineraId = newValue;
                            _mineraUuid = const Uuid().v4();
                          });
                        },
                        decoration: InputDecoration(
                          labelText: "Unidad Minera",
                          icon: Icon(Icons.business), // Puedes cambiar el icono
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Seleccione la Unidad Minera";
                          }
                          return null;
                        },
                      ),

                      SizedBox(height: 16),

                      DropdownButtonFormField<String>(
                        value: _empresaId,
                        items:
                            _empresas.map((empresa) {
                              return DropdownMenuItem<String>(
                                value: empresa["id"],
                                child: Text(empresa["name"]!),
                              );
                            }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            _empresaId = newValue;
                            _empresaUuid = const Uuid().v4();
                          });
                        },
                        decoration: InputDecoration(
                          labelText: "Empresa",
                          icon: Icon(Icons.business),
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Seleccione una empresa";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16),

                      SizedBox(height: 16),
                      InputPersonalizado(
                        controller: _correoController,
                        label: "Correo electronico",
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

                      SizedBox(height: 16),
                      InputPersonalizado(
                        controller: _contraseniaController,
                        label: "Crea una nueva Contraseña",
                        keyboardType: TextInputType.visiblePassword,
                        icono: Icons.lock,
                        obscureText: true,
                        maxLength: 8,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Ingrese su contraseña";
                          }
                          if (value.length < 6) {
                            return "La contraseña debe tener al menos 6 caracteres";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16),
                      InputPersonalizado(
                        controller: _contraseController,
                        label: "Repita su contraseña ",
                        keyboardType: TextInputType.visiblePassword,
                        icono: Icons.lock,
                        obscureText: true,
                        maxLength: 8,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Repita su contraseña";
                          }
                          if (value != _contraseniaController.text) {
                            return "Las contraseñas no coinciden";
                          }
                          return null;
                        },
                      ),

                      SizedBox(height: 16),

                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              try {
                                final authRepo = AuthRepository();
                                await authRepo.registrarUsuario(
                                  email: _correoController.text,
                                  contrasenia: _contraseniaController.text,
                                  nombre: _nombreController.text,
                                  apellido: _apellidoController.text,
                                  empresa: _empresaId!,
                                  empresaId: _empresaUuid!,
                                  fechaCreacion: _fechaCreacion,
                                  minera: _mineraId!,
                                  mineraId: _mineraUuid!,
                                );
                                if (context.mounted) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        "Usuario creado correctamente",
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
