import 'package:flutter/material.dart';
import 'package:projeto02/app/routes/app_routes.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.pushReplacementNamed(context, AppRoutes.login);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.white, 
      body: Container(
        width: double.infinity, 
        height: double.infinity,
        color: Colors.white, 
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            const Icon(
              Icons.book, 
              size: 100, 
              color: Colors.blue,
            ),
            
            const SizedBox(height: 20),

            
            const Text(
              "Atividade P1",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.blue, 
              ),
            ),

            const SizedBox(height: 30),

            
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
            ),
          ],
        ),
      ),
    );
  }
}