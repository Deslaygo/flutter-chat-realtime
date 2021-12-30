import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
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
            onPressed: () {},
            label: 'Ingresar',
          )
        ],
      ),
    );
  }
}
