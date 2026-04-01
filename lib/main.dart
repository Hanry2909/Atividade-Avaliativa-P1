import 'package:flutter/material.dart';
import 'package:projeto02/app/routes/app_routes.dart';

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
        scaffoldBackgroundColor: Colors.white, 
        useMaterial3: false, 
      ),

      
      initialRoute: '/', 

      routes: AppRoutes.routes,
    );
  }
}