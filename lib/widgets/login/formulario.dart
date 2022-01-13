import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//helpers
import '../../helpers/mostrar_alerta.dart';
//widgets
import '../common/custom_input.dart';
import '../common/custom_button.dart';
//services
import '../../services/auth_services.dart';

class Formulario extends StatefulWidget {
  const Formulario({Key? key}) : super(key: key);

  @override
  _FormularioState createState() => _FormularioState();
}

class _FormularioState extends State<Formulario> {
  final emailTxt = TextEditingController();
  final passwordTxt = TextEditingController();

  Future logear() async {
    try {
      final authService = Provider.of<AuthService>(context, listen: false);
      FocusScope.of(context).unfocus();
      await authService.login(emailTxt.text.trim(), passwordTxt.text.trim());

      // todo: conectar sockect service
      Navigator.pushReplacementNamed(context, 'usuarios');
    } catch (e) {
      mostrarAlerta(context, 'Login incorrecto', 'Revise sus credenciales');
    }
  }

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    return Container(
      margin: const EdgeInsets.only(top: 40),
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        children: [
          CustomInput(
            prefixIcon: Icons.email_outlined,
            hintText: 'Email',
            keyboardType: TextInputType.emailAddress,
            controller: emailTxt,
          ),
          CustomInput(
            controller: passwordTxt,
            prefixIcon: Icons.lock_outline,
            hintText: 'Password',
            obscureText: true,
          ),
          CustomButtom(
            onPressed: authService.autenticando ? null : () async => logear(),
            label: 'Ingresar',
          )
        ],
      ),
    );
  }
}
