import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//helpers
import '../../helpers/mostrar_alerta.dart';
//services
import '../../services/auth_services.dart';
//widgets
import '../common/custom_input.dart';
import '../common/custom_button.dart';

class FormularioRegistro extends StatefulWidget {
  const FormularioRegistro({Key? key}) : super(key: key);

  @override
  _FormularioRegistroState createState() => _FormularioRegistroState();
}

class _FormularioRegistroState extends State<FormularioRegistro> {
  final nameTxt = TextEditingController();
  final emailTxt = TextEditingController();
  final passwordTxt = TextEditingController();

  Future registrar() async {
    try {
      final authService = Provider.of<AuthService>(context, listen: false);
      await authService.register({
        'nombre': nameTxt.text.trim(),
        'email': emailTxt.text.trim(),
        'password': passwordTxt.text.trim(),
      });
      Navigator.pushReplacementNamed(context, 'usuarios');
    } catch (e) {
      mostrarAlerta(
          context, 'Registro incorrecto', 'Revise los datos de regitros');
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
            prefixIcon: Icons.person,
            hintText: 'nombre',
            keyboardType: TextInputType.name,
            controller: nameTxt,
          ),
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
            onPressed:
                authService.autenticando ? null : () async => registrar(),
            label: 'Ingresar',
          )
        ],
      ),
    );
  }
}
