import 'package:flutter/material.dart';
import 'package:projeto02/app/routes/app_routes.dart';

// Este bloco abaixo é essencial para o app iniciar!
void main() {
  runApp(const AppWidget());
}

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Atividade Avaliativa P1',
      debugShowCheckedModeBanner: false, 
      
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: false, 
      ),

      // Define que o app começa na tela de Login
      initialRoute: AppRoutes.login, 

      // Conecta o mapa de rotas que você ajustou no app_routes.dart
      routes: AppRoutes.routes,
    );
  }
}