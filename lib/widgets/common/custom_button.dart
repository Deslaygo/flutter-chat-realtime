import 'package:flutter/material.dart';

class CustomButtom extends StatelessWidget {
  final String? label;
  final Color? bgButton;
  final VoidCallback? onPressed;

  const CustomButtom({
    Key? key,
    this.label,
    this.bgButton = Colors.blue,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary: bgButton,
        shape: const StadiumBorder(),
      ),
      child: SizedBox(
        width: double.infinity,
        height: 40,
        child: Center(
          child: Text(
            label ?? '',
            style: const TextStyle(fontSize: 17),
          ),
        ),
      ),
    );
  }
}
