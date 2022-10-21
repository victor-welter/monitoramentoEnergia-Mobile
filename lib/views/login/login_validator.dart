class LoginValidator {
  static String? validateUsuario(String? usuario) {
    if (usuario == null || usuario.trim().isEmpty) {
      return 'Informe o seu usuário';
    }

    return null;
  }

  static String? validateSenha(String? senha) {
    if (senha == null || senha.trim().isEmpty) {
      return 'Informe uma senha';
    }

    if (senha.length < 6) {
      return 'Senha deve ter no mínimo 6 dígitos';
    }

    return null;
  }
}
