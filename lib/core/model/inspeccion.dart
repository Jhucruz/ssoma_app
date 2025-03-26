import 'package:cloud_firestore/cloud_firestore.dart' show Timestamp;

class Inspeccion {
  final String id;
  final String evento;
  final String accion;
  final String idUsuario;
  final String? rutaImagen;
  final String tipoInspeccionId;
  final String tipoInspeccionUuid;
  final DateTime fechaInci;

  Inspeccion({
    required this.id,
    required this.evento,
    required this.accion,
    required this.idUsuario,
    required this.tipoInspeccionId,
    required this.fechaInci,
    required this.tipoInspeccionUuid,
    this.rutaImagen,
  });
  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "evento": evento,
      "id_usuario": idUsuario,
      "accion": accion,
      "tipoInspeccionId": tipoInspeccionId,
      "tipoInspeccionUuid": tipoInspeccionUuid,
      'fechaInci': Timestamp.fromDate(fechaInci),
      'rutaImagen': rutaImagen,
    };
  }
}
