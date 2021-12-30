import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  final String? hintText;
  final IconData? prefixIcon;
  final bool? obscureText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;

  const CustomInput(
      {Key? key,
      this.hintText,
      this.prefixIcon,
      this.obscureText,
      this.controller,
      this.keyboardType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      padding: const EdgeInsets.only(
        left: 5,
        top: 5,
        bottom: 5,
        right: 24,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            offset: const Offset(0, 5),
            blurRadius: 5,
          )
        ],
      ),
      child: TextField(
        controller: controller,
        autocorrect: false,
        keyboardType: keyboardType ?? TextInputType.name,
        obscureText: obscureText ?? false,
        decoration: InputDecoration(
            prefixIcon: Icon(prefixIcon),
            focusedBorder: InputBorder.none,
            border: InputBorder.none,
            hintText: hintText ?? ''),
      ),
    );
  }
}
