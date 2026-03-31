import 'package:flutter/material.dart';
import 'package:projeto02/app/routes/app_routes.dart';

import '../../features/auth/view/login_page.dart';
import '../../features/auth/view/register_page.dart';

abstract class AppPages {
  static Map<String, WidgetBuilder> get routes => {
    AppRoutes.login: (_) => const LoginPage(),
    AppRoutes.register: (_) => const RegisterPage(),
  };
}
