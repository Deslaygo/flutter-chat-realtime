import 'package:flutter/material.dart';

//screens
import '../screens/usuarios_screen.dart';
import '../screens/chat_screen.dart';
import '../screens/loading_scren.dart';
import '../screens/login_screen.dart';
import '../screens/register_screen.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  'usuarios': (_) => const UsuariosScreen(),
  'chat': (_) => const ChatScreen(),
  'loading': (_) => const LoadingScreen(),
  'login': (_) => const LoginScreen(),
  'register': (_) => const RegisterScreen(),
};
