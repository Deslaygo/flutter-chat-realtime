import 'package:flutter/material.dart';

import '../../models/usuario.dart';

class UsuarioTile extends StatelessWidget {
  final Usuario? usuario;

  const UsuarioTile({
    Key? key,
    this.usuario,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(usuario!.nombre ?? ''),
      subtitle: Text(
        usuario!.email ?? '',
        style: const TextStyle(
          color: Colors.black38,
        ),
      ),
      leading: CircleAvatar(
        backgroundColor: Colors.blue[200],
        child: Text(usuario!.nombre!.substring(0, 2)),
      ),
      trailing: Container(
        width: 10,
        height: 10,
        decoration: BoxDecoration(
          color: usuario!.online ? Colors.green[400] : Colors.red[400],
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
