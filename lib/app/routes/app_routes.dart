import 'package:flutter/material.dart';
import 'package:projeto02/features/auth/view/login_page.dart';
import 'package:projeto02/features/auth/view/register_page.dart';

class AppRoutes {
  static const String splash = '/'; 
  static const String login = '/login';
  static const String register = '/register';
  static const String home = '/home';

  static Map<String, WidgetBuilder> get routes => {
    // Rota inicial (Login)
    splash: (context) => const LoginPage(),
    login: (context) => const LoginPage(),
    
    // Rota de Cadastro (A que estava em branco)
    register: (context) => const RegisterPage(),
    
    // Rota da Home (Melhoria Visual)
    home: (context) => Scaffold(
      appBar: AppBar(
        title: const Text("Sistema P1"),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            onPressed: () => Navigator.pushReplacementNamed(context, login),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
          children: [
            _cardMenu(Icons.person, "Perfil", Colors.orange),
            _cardMenu(Icons.analytics, "Relatórios", Colors.blue),
            _cardMenu(Icons.notifications, "Alertas", Colors.red),
            _cardMenu(Icons.settings, "Configurações", Colors.grey),
          ],
        ),
      ),
    ),
  };

  static Widget _cardMenu(IconData icon, String titulo, Color cor) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 45, color: cor),
          const SizedBox(height: 10),
          Text(titulo, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}