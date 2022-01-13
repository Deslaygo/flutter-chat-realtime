import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

//models
import '../models/usuario.dart';
//widgets
import '../widgets/usuarios/usuario_tile.dart';
//services
import '../services/auth_services.dart';

class UsuariosScreen extends StatefulWidget {
  const UsuariosScreen({Key? key}) : super(key: key);

  @override
  State<UsuariosScreen> createState() => _UsuariosScreenState();
}

class _UsuariosScreenState extends State<UsuariosScreen> {
  final _refreshController = RefreshController(initialRefresh: false);
  final _usuarios = [
    Usuario(
        uid: '1',
        email: 'usuario1@demo.com',
        nombre: 'Usuario uno',
        online: true),
    Usuario(
        uid: '2',
        email: 'usuario2@demo.com',
        nombre: 'Usuario dos',
        online: true),
    Usuario(
        uid: '3',
        email: 'usuario3@demo.com',
        nombre: 'Usuario tres',
        online: false),
  ];

  _cargarUsuarios() async {
    await Future.delayed(const Duration(seconds: 2));

    _refreshController.refreshCompleted();
  }

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text(
            authService.usuario!.nombre ?? '',
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.black87),
          ),
          elevation: 1,
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () {
              // TODO: Desconectar el socket service
              AuthService.deleteToken();
              Navigator.pushReplacementNamed(context, 'login');
            },
            icon: const Icon(
              Icons.exit_to_app,
              color: Colors.black87,
            ),
          ),
          actions: [
            Container(
              margin: const EdgeInsets.only(right: 16),
              // child: Icon(Icons.offline_share, color: Colors.red[400]),
              child: Icon(Icons.check_circle, color: Colors.blue[400]),
            )
          ],
        ),
        body: SmartRefresher(
          controller: _refreshController,
          onRefresh: _cargarUsuarios,
          enablePullDown: true,
          header: WaterDropHeader(
            complete: Icon(
              Icons.check,
              color: Colors.blue[400],
            ),
            waterDropColor: (Colors.blue[400])!,
          ),
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (_, i) => UsuarioTile(usuario: _usuarios[i]),
            separatorBuilder: (_, i) => const Divider(),
            itemCount: _usuarios.length,
          ),
        ));
  }
}
