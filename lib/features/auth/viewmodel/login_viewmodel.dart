import 'package:flutter/material.dart';
import 'package:projeto02/app/data/mock_database.dart';

class LoginViewModel extends ChangeNotifier {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _obscurePassword = true;
  bool get obscurePassword => _obscurePassword;

  void togglePasswordVisibility() {
    _obscurePassword = !_obscurePassword;
    notifyListeners();
  }

  // Validações
  String? emailValidator(String? value) {
    if (value == null || value.isEmpty) return "Campo obrigatório";
    if (!value.contains('@')) return "E-mail inválido";
    return null;
  }

  String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) return "Campo obrigatório";
    if (value.length < 6) return "Mínimo 6 caracteres";
    return null;
  }

  // AGORA ACEITA O CONTEXTO PARA MOSTRAR A MENSAGEM DE ERRO
  Future<bool> login(BuildContext context) async {
    if (!formKey.currentState!.validate()) return false;

    _isLoading = true;
    notifyListeners();

    // Simula um delay de rede
    await Future.delayed(const Duration(seconds: 1));

    // VERIFICA NO BANCO MOCK
    bool sucesso = MockDatabase().login(emailController.text, passwordController.text);

    _isLoading = false;
    notifyListeners();

    if (!sucesso) {
      // DIFERENCIAL: MENSAGEM DE ERRO (SNACKBAR)
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("E-mail ou senha não encontrados!"),
          backgroundColor: Colors.red,
          behavior: SnackBarBehavior.floating,
        ),
      );
    }

    return sucesso;
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}