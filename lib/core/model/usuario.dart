import 'package:cloud_firestore/cloud_firestore.dart' show Timestamp;

class Usuario {
  final String id;
  final String nombre;
  final String apellido;
  final String email;
  final String empresa;
  final String minera;
  final DateTime fechaCreacion;

  Usuario({
    required this.id,
    required this.nombre,
    required this.apellido,
    required this.email,
    required this.empresa,
    required this.minera,
    required this.fechaCreacion,
  });

  factory Usuario.fromFirestore(Map<String, dynamic> data) {
    return Usuario(
      id: data["id"],
      nombre: data["nombre"],
      apellido: data["apellido"],
      email: data["correo"],
      empresa: data["empresa"],
      minera: data["minera"],
      fechaCreacion: (data["fechaCreacion"] as Timestamp).toDate(),
    );
  }
}
