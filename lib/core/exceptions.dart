class ExcepcionLogin implements Exception {
  final String message;

  ExcepcionLogin([this.message = 'Error de inicio de sesión']);

  @override
  String toString() {
    return 'ExcepcionLogin: $message';
  }
}

class ExcepcionRegistrarse implements Exception {
  final String message;

  ExcepcionRegistrarse([this.message = 'Error de registro de usuario']);

  @override
  String toString() {
    return 'ExcepcionRegistrarse: $message';
  }
}

class ExceptionUsuarioYaExiste implements Exception {
  final String message;

  ExceptionUsuarioYaExiste([this.message = 'El usuario ya existe']);

  @override
  String toString() {
    return 'ExceptionUsuarioYaExiste: $message';
  }
}

class ExceptionLogout implements Exception {
  final String message;

  ExceptionLogout([this.message = 'Error al cerrar sesión']);

  @override
  String toString() {
    return 'ExceptionLogout: $message';
  }
}

class ExcepcionGuardarInspeccion implements Exception {}
