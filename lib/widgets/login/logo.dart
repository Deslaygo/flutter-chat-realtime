import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  final String? titulo;
  const Logo({
    Key? key,
    this.titulo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 170,
        margin: const EdgeInsets.only(top: 40),
        child: Column(
          children: [
            const Image(
              image: AssetImage('assets/images/chatting.png'),
            ),
            const SizedBox(height: 24),
            Text(titulo ?? '', style: const TextStyle(fontSize: 30)),
          ],
        ),
      ),
    );
  }
}
