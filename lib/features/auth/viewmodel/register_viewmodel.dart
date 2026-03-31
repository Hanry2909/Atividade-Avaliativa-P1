import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';
// Lembre-se de importar o seu UserModel e o UserRepository!
// import '../model/user_model.dart';
// import '../model/user_repository.dart';

class RegisterViewmodel extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();

  // Aqui temos um controlador a mais: o de Nome
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool obscurePassword = true;
  bool isLoading = false;

  // Validação do Nome
  String? nameValidator(String? value) {
    return Validatorless.required('Nome é obrigatório')(value);
  }

  // Validação do Email
  String? emailValidator(String? value) {
    return Validatorless.multiple([
      Validatorless.required('Email é obrigatório'),
      Validatorless.email('Digite um email válido'),
    ])(value);
  }

  // Validação da Senha
  String? passwordValidator(String? value) {
    return Validatorless.multiple([
      Validatorless.required('Senha é obrigatória'),
      Validatorless.min(6, 'A senha deve ter pelo menos 6 caracteres'),
    ])(value);
  }

  void togglePasswordVisibility() {
    obscurePassword = !obscurePassword;
    notifyListeners();
  }

  // Função para CADASTRAR o usuário
  Future<bool> register() async {
    // Verifica se o formulário está preenchido corretamente
    if (!formKey.currentState!.validate()) {
      return false; 
    }

    isLoading = true;
    notifyListeners();

    // Simula o carregamento
    await Future.delayed(const Duration(seconds: 1));

    // 1. Cria um objeto do tipo UserModel com os dados digitados
    final newUser = UserModel(
      name: nameController.text,
      email: emailController.text,
      password: passwordController.text,
    );

    // 2. Adiciona esse novo usuário lá na nossa lista mockada
    UserRepository().addUser(newUser);

    isLoading = false;
    notifyListeners();

    return true; // Retorna sucesso!
  }
}