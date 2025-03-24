import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart' show SvgPicture;
import 'package:ssoma_app/core/ui/input_lineas.dart';
import 'package:ssoma_app/core/ui/input_personalizado.dart';

class FormularioIncidentesScreen extends StatefulWidget {
  const FormularioIncidentesScreen({super.key});

  @override
  State<FormularioIncidentesScreen> createState() =>
      _FormularioIncidentesScreenState();
}

class _FormularioIncidentesScreenState
    extends State<FormularioIncidentesScreen> {
  final _idForm = GlobalKey<FormState>();
  final _eventoController = TextEditingController();
  final _accionController = TextEditingController();
  final _fechaInciController = TextEditingController();
  final DateTime _fechaInci = DateTime.now();
  String? rutaImagenPreview;

  @override
  void initState() {
    super.initState();
    _fechaInciController.text =
        "${_fechaInci.day}/${_fechaInci.month}/${_fechaInci.year}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Registra tu  Incidente",
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
        key: _idForm,
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 600),
                  child: ListView(
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    children: [
                      SizedBox(height: 8),
                      Column(
                        children: [
                          if (rutaImagenPreview != null)
                            Column(
                              children: [
                                Image.file(File(rutaImagenPreview!)),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        setState(() {
                                          rutaImagenPreview = null;
                                        });
                                      },
                                      child: Text("Borrar"),
                                    ),
                                    SizedBox(width: 10),
                                    ElevatedButton(
                                      onPressed: () async {
                                        final result = await FilePicker.platform
                                            .pickFiles(type: FileType.image);
                                        if (result != null) {
                                          setState(() {
                                            rutaImagenPreview =
                                                result.files.single.path!;
                                          });
                                        }
                                      },
                                      child: Text("Cambiar Foto"),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          else
                            ElevatedButton(
                              onPressed: () async {
                                final result = await FilePicker.platform
                                    .pickFiles(type: FileType.image);
                                if (result != null) {
                                  setState(() {
                                    rutaImagenPreview =
                                        result.files.single.path!;
                                  });
                                }
                              },
                              child: Text("Subir Evidencia"),
                            ),
                        ],
                      ),
                      SizedBox(height: 12),
                      InputPersonalizado(
                        controller: _fechaInciController,
                        label: "Fecha de registro",
                        readOnly: true,
                      ),
                      Text("Descrripcion del evento "),
                      SizedBox(height: 4),
                      InputLineas(
                        controller: _eventoController,
                        label: "Hola ! Que observastes hoy?",
                        keyboardType: TextInputType.text,
                        autocorrect: true,
                        maxLength: 400,
                        maxLines: 3,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Hey este campo es Obligatorio";
                          }
                          return null;
                        },
                      ),
                      Text("Accion a implementar "),
                      SizedBox(height: 4),
                      InputLineas(
                        controller: _accionController,
                        label:
                            "Cuentame  lo solucionastes? o como deben de hacerlo?",
                        keyboardType: TextInputType.text,
                        maxLines: 3,
                        autocorrect: true,
                        maxLength: 400,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Hey este campo es Obligatorio";
                          }
                          return null;
                        },
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
