import 'package:flutter/material.dart';

//widgets
import '../widgets/register/formulario_registro.dart';
import '../widgets/login/logo.dart';
import '../widgets/login/labels.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFf2f2f2),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: SafeArea(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.9,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Logo(
                    titulo: 'Registro',
                  ),
                  FormularioRegistro(),
                  Labels(
                    ruta: 'login',
                    sugerencia: '¿Ya tienes una cuenta?',
                    instruccion: 'Ingresa ahora!',
                  ),
                  Text(
                    'Terminos y condiciones de uso',
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ));
  }
}
