import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../helpers/api_handler.dart';

//models
import '../models/login_response.dart';
import '../models/usuario.dart';

class AuthService with ChangeNotifier {
  Usuario? usuario;
  bool _autenticando = false;

  final _storage = const FlutterSecureStorage();

  bool get autenticando => _autenticando;
  set autenticando(bool valor) {
    _autenticando = valor;
    notifyListeners();
  }

  //Se definen getter y sette de token de manera statica
  static Future<String> getToken() async {
    const storage = FlutterSecureStorage();
    final token = await storage.read(key: 'token');
    return token!;
  }

  static Future deleteToken() async {
    const storage = FlutterSecureStorage();
    await storage.delete(key: 'token');
  }

  Future login(String email, String password) async {
    try {
      autenticando = true;
      final data = {
        'email': email,
        'password': password,
      };

      final dataLogin = await ApiHandler.post(
        'login',
        '',
        data,
      );

      if (dataLogin != null) {
        final loginResponse = LoginResponse.fromJson(dataLogin);
        usuario = loginResponse.usuario;

        await _guardarToken(loginResponse.token);
      } else {
        throw Exception('Credenciales incorrectas');
      }

      autenticando = false;
    } catch (e) {
      autenticando = false;
      rethrow;
    }
  }

  Future register(Map<String, dynamic> params) async {
    try {
      autenticando = true;
      final data = await ApiHandler.post('login', 'new', params);
      if (data != null) {
        final loginResponse = LoginResponse.fromJson(data);
        usuario = loginResponse.usuario;

        await _guardarToken(loginResponse.token);
      } else {
        throw Exception('No se pudo registrar el usuario');
      }
      autenticando = false;
    } catch (e) {
      autenticando = false;
      rethrow;
    }
  }

  Future _guardarToken(String? token) async {
    await _storage.write(key: 'token', value: token);
  }

  Future logout() async {
    await _storage.delete(key: 'token');
  }

  Future<bool> isLoggedIn() async {
    try {
      final token = await _storage.read(key: 'token');

      final data = await ApiHandler.get('login', 'renew', {}, token: token!);

      if (data != null) {
        final loginResponse = LoginResponse.fromJson(data);
        usuario = loginResponse.usuario;

        await _guardarToken(loginResponse.token);
      } else {
        logout();
        return false;
      }
      return true;
    } catch (e) {
      return false;
    }
  }
}
