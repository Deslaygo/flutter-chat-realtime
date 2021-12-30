import 'package:flutter/material.dart';

class Labels extends StatelessWidget {
  final String? ruta;
  final String? sugerencia;
  final String? instruccion;
  const Labels({
    Key? key,
    this.ruta,
    this.sugerencia,
    this.instruccion,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          sugerencia ?? '',
          style: const TextStyle(
              color: Colors.black54, fontSize: 15, fontWeight: FontWeight.w300),
        ),
        const SizedBox(height: 16),
        InkWell(
          onTap: () {
            Navigator.of(context).pushReplacementNamed(ruta!);
          },
          child: Text(
            instruccion ?? '',
            style: TextStyle(
                color: Colors.blue[600],
                fontSize: 18,
                fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
