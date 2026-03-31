import 'package:flutter/material.dart';
import 'package:projeto02/app/data/mock_database.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // Controladores para pegar o que o usuário digita
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Criar Conta"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 20),
                const Icon(Icons.person_add_alt_1_outlined, size: 80, color: Colors.blue),
                const SizedBox(height: 20),
                const Text(
                  "Novo Cadastro",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 32),
                
                // Campo Nome
                TextFormField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    labelText: "Nome Completo",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.person_outline),
                  ),
                ),
                const SizedBox(height: 16),

                // Campo Email
                TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: "Email",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.email_outlined),
                  ),
                ),
                const SizedBox(height: 16),

                // Campo Senha
                TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: "Senha",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.lock_outlined),
                  ),
                ),
                const SizedBox(height: 32),

                // Botão de Cadastrar
                SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      if (emailController.text.isNotEmpty && passwordController.text.length >= 6) {
                        
                        // SALVA NO BANCO MOCK (Diferencial Singleton)
                        MockDatabase().registerUser(
                          emailController.text, 
                          passwordController.text
                        );

                        // MENSAGEM DE SUCESSO (Diferencial SnackBar)
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Conta criada com sucesso! Faça login."),
                            backgroundColor: Colors.green,
                            behavior: SnackBarBehavior.floating,
                          ),
                        );

                        // Volta para a tela de Login
                        Navigator.pop(context);
                      } else {
                        // Mensagem caso falte algo
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Preencha todos os campos corretamente!"),
                            backgroundColor: Colors.orange,
                          ),
                        );
                      }
                    },
                    child: const Text("Finalizar Cadastro", style: TextStyle(fontSize: 18)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}