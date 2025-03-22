import 'package:cloud_firestore/cloud_firestore.dart' show FirebaseFirestore;
import 'package:firebase_auth/firebase_auth.dart'
    show FirebaseAuth, FirebaseAuthException;
import 'package:ssoma_app/core/exceptions.dart';

class AuthRepository {
  final firebaseAuth = FirebaseAuth.instance;
  final cloudFirestore = FirebaseFirestore.instance;

  bool estaLogeado() {
    return firebaseAuth.currentUser != null ? true : false;
  }

  Future<void> login({
    required String correo,
    required String contrasenia,
  }) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
        email: correo,
        password: contrasenia,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        throw ExcepcionLogin('Correo o contraseña incorrectos.');
      } else {
        throw ExcepcionLogin('Error al iniciar sesión: ${e.message}');
      }
    } catch (e) {
      throw ExcepcionLogin('Error desconocido: ${e.toString()}');
    }
  }

  Future<void> registrarUsuario({
    required String email,
    required String contrasenia,
    required String nombre,
    required String apellido,
    required String empresa,
  }) async {
    try {
      final result =
          await cloudFirestore
              .collection('usuarios')
              .where('correo', isEqualTo: email)
              .get();

      if (result.docs.isNotEmpty) {
        throw ExceptionUsuarioYaExiste();
      }

      final credentials = await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: contrasenia,
      );

      final usuarioFirebase = credentials.user;
      if (usuarioFirebase == null) {
        throw ExcepcionRegistrarse(
          'No se pudo crear el usuario en Firebase Authentication.',
        );
      }

      final firebaseIdUsuario = usuarioFirebase.uid;

      await cloudFirestore.collection('usuarios').doc(firebaseIdUsuario).set({
        'id': firebaseIdUsuario,
        'nombre': nombre,
        'apellido': apellido,
        'correo': email,
        "empresa": empresa,
      });
    } on FirebaseAuthException catch (e) {
      // Manejar excepciones específicas de Firebase Auth
      if (e.code == 'weak-password') {
        throw ExcepcionRegistrarse('La contraseña es demasiado débil.');
      } else if (e.code == 'email-already-in-use') {
        throw ExcepcionRegistrarse(
          'La cuenta ya existe para ese correo electrónico.',
        );
      } else {
        throw ExcepcionRegistrarse('Error al registrar usuario: ${e.message}');
      }
    } catch (e) {
      // Manejar otras excepciones
      throw ExcepcionRegistrarse('Error desconocido: ${e.toString()}');
    }
  }

  Future<void> cambiarContrasenia(String email) async {
    await firebaseAuth.sendPasswordResetEmail(email: email);
  }

  Future<void> logout() async {
    try {
      await firebaseAuth.signOut();
    } catch (e) {
      throw ExceptionLogout();
    }
  }
}
