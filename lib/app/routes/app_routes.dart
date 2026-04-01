import 'package:flutter/material.dart';
import 'package:projeto02/features/auth/view/login_page.dart';
import 'package:projeto02/features/auth/view/register_page.dart';
import 'package:projeto02/features/auth/view/splash_page.dart';
import 'package:projeto02/features/auth/view/profile_page.dart'; // Import Novo

class AppRoutes {
  static const String splash = '/';
  static const String login = '/login';
  static const String register = '/register';
  static const String home = '/home';
  static const String profile = '/profile'; // Rota Nova

  static Map<String, WidgetBuilder> get routes => {
        splash: (context) => const SplashPage(),
        login: (context) => const LoginPage(),
        register: (context) => const RegisterPage(),
        profile: (context) => const ProfilePage(), // Registro Novo
        
        home: (context) => Scaffold(
              appBar: AppBar(
                title: const Text("Dashboard P1"),
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
                    // AQUI: Agora o Perfil usa Navigator.pushNamed
                    _cardMenu(context, Icons.person, "Perfil", Colors.orange, () {
                      Navigator.pushNamed(context, profile);
                    }),
                    _cardMenu(context, Icons.analytics, "Relatórios", Colors.blue, () {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Relatórios em breve...")));
                    }),
                    _cardMenu(context, Icons.notifications, "Alertas", Colors.red, () {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Sem alertas.")));
                    }),
                    _cardMenu(context, Icons.settings, "Ajustes", Colors.grey, () {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Configurações...")));
                    }),
                  ],
                ),
              ),
            ),
      };

  static Widget _cardMenu(BuildContext context, IconData icon, String titulo, Color cor, VoidCallback acao) {
    return InkWell(
      onTap: acao, // Agora ele executa a função que passamos acima
      borderRadius: BorderRadius.circular(15),
      child: Card(
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
      ),
    );
  }
}