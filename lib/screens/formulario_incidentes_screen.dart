import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart' show SvgPicture;
import 'package:ssoma_app/core/ui/input_lineas.dart';
import 'package:ssoma_app/core/ui/input_personalizado.dart';
import 'package:ssoma_app/repositories/inspecciones_repository.dart';
import 'package:ssoma_app/widgets/image_picker_column.dart';
import 'package:uuid/uuid.dart' show Uuid;

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
  final _inspeccionRepo = InspeccionesRepository();

  Uint8List? imagenBytes;
  String? rutaImagen;

  final List<Map<String, String>> _tipoInspeccion = [
    {"id": "1", "name": 'Insp CSST '},
    {"id": "2", "name": 'Racs '},
    {"id": "3", "name": 'Insp Planeada '},
    {"id": "4", "name": 'Insp Inopinada'},
  ];
  String? _tipoInspeccionId;
  String? _tipoInspeccionUuid;

  final List<Map<String, String>> _nivelPerdida = [
    {"id": "1", "name": 'Alto '},
    {"id": "2", "name": 'Medio '},
    {"id": "3", "name": 'Bajo '},
  ];
  String? _nivelPerdidaId;

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
                      Divider(),
                      Text(
                        "Informacion de la Observacion ",
                        style: TextStyle(color: Colors.green),
                      ),
                      Divider(),
                      SizedBox(height: 8),
                      Center(
                        child: ImagePickerFormField(
                          onSaved: (bool? imageSelected) {
                            if (imageSelected == true) {
                              // En este caso, no es necesario guardar un booleano.
                            }
                          },
                          validator: (bool? imageSelected) {
                            if (imageSelected != true) {
                              return "Por favor, sube una imagen.";
                            }
                            return null;
                          },
                        ),
                      ),

                      SizedBox(height: 12),
                      InputPersonalizado(
                        controller: _fechaInciController,
                        label: "Fecha de registro",
                        readOnly: true,
                      ),
                      SizedBox(height: 8),
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
                      Divider(),
                      Text(
                        "Informacion del Tipo de Riesgo",
                        style: TextStyle(color: Colors.green),
                      ),
                      Divider(),
                      Text("Selecciona el Tipo de Inspeccion"),
                      SizedBox(height: 12),
                      DropdownButtonFormField<String>(
                        value: _tipoInspeccionId,
                        items:
                            _tipoInspeccion.map((tipoInspeccion) {
                              return DropdownMenuItem<String>(
                                value: tipoInspeccion["id"],
                                child: Text(tipoInspeccion["name"]!),
                              );
                            }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            _tipoInspeccionId = newValue;
                            _tipoInspeccionUuid = const Uuid().v4();
                          });
                        },
                        decoration: InputDecoration(
                          labelText: "Tipo de Inspeccion",
                          icon: Icon(Icons.check_box),
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Seleccione tipo de Inspeccion";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 8),
                      DropdownButtonFormField<String>(
                        value: _nivelPerdidaId,
                        items:
                            _nivelPerdida.map((nivelPerdida) {
                              return DropdownMenuItem<String>(
                                value:
                                    nivelPerdida["id"], // Corrección: Usa el 'id' del mapa
                                child: Text(nivelPerdida["name"]!),
                              );
                            }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            _nivelPerdidaId =
                                newValue; // Corrección: Asigna el newValue
                          });
                        },
                        decoration: InputDecoration(
                          labelText: "Nivel de Perdida",
                          icon: Icon(Icons.check_box),
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Selecciona el nivel de perdida";
                          }
                          return null;
                        },
                      ),

                      SizedBox(height: 12),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton.icon(
                          // Usamos ElevatedButton.icon para agregar un icono
                          onPressed: () async {
                            final esValido = _idForm.currentState?.validate();

                            if (esValido == true) {
                              try {
                                await _inspeccionRepo.guardarInspeccion(
                                  evento: _eventoController.text,
                                  accion: _accionController.text,
                                  fechaInci: _fechaInci,
                                  tipoInspeccionId: _tipoInspeccionId!,
                                  tipoInspeccionUuid: _tipoInspeccionUuid!,
                                  imagenBytes: imagenBytes,
                                  rutaImagen: rutaImagen,
                                );
                                // Guarda el context en una variable local
                                final localContext = context;
                                if (mounted && localContext.mounted) {
                                  Navigator.pop(localContext);
                                  _eventoController.clear();
                                  _accionController.clear();
                                  _fechaInciController.clear();
                                  imagenBytes = null; // Limpiar imagenBytes
                                  ScaffoldMessenger.of(
                                    localContext,
                                  ).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        "Perfecto!, tu reporte ha sido subido con exito ",
                                        style: TextStyle(
                                          color: Colors.amber,
                                          fontSize: 24,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                              } catch (e) {
                                final localContext = context;
                                if (mounted && localContext.mounted) {
                                  ScaffoldMessenger.of(
                                    localContext,
                                  ).showSnackBar(
                                    SnackBar(content: Text("ALGO SALIO MAL")),
                                  );
                                }
                              }
                            }
                          },
                          icon: Icon(Icons.save),
                          label: Text("Guardar Reporte"),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            foregroundColor: Colors.white,
                          ),
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
