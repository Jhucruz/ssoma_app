import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart' show Uint8List;
import 'package:ssoma_app/core/exceptions.dart';
import 'package:ssoma_app/core/model/inspeccion.dart';

class InspeccionesRepository {
  final cloudFirestore = FirebaseFirestore.instance;
  final firebaseAuth = FirebaseAuth.instance;

  Future<void> guardarInspeccion({
    required String evento,
    required String accion,
    required DateTime fechaInci,
    required String tipoInspeccionUuid,
    required String tipoInspeccionId,
    Uint8List? imagenBytes,
    String? rutaImagen,
  }) async {
    try {
      final userId = firebaseAuth.currentUser?.uid;
      if (userId == null) {
        throw ExcepcionGuardarInspeccion();
      }
      final idFirebase = cloudFirestore.collection("inspecciones").doc().id;
      final inspeccion = Inspeccion(
        id: idFirebase,
        evento: evento,
        accion: accion,
        tipoInspeccionId: tipoInspeccionId,
        tipoInspeccionUuid: tipoInspeccionUuid,
        fechaInci: fechaInci,
        idUsuario: userId,
        rutaImagen: rutaImagen,
      );
      await cloudFirestore
          .collection("inspecciones")
          .doc(idFirebase)
          .set(inspeccion.toMap());
    } catch (e) {
      throw ExcepcionGuardarInspeccion();
    }
  }
}
