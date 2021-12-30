import 'package:flutter/material.dart';
import './routes/routes.dart';

void main() => runApp(const ChatApp());

class ChatApp extends StatelessWidget {
  const ChatApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat App',
      debugShowCheckedModeBanner: false,
      initialRoute: 'login',
      routes: appRoutes,
    );
  }
}
