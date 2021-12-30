import 'package:flutter/material.dart';

//widgets
import '../common/custom_input.dart';
import '../common/custom_button.dart';

class Formulario extends StatefulWidget {
  const Formulario({Key? key}) : super(key: key);

  @override
  _FormularioState createState() => _FormularioState();
}

class _FormularioState extends State<Formulario> {
  final emailTxt = TextEditingController();
  final passwordTxt = TextEditingController();
  @override
  Widget build(BuildContext context) {
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
            onPressed: () {},
            label: 'Ingresar',
          )
        ],
      ),
    );
  }
}
