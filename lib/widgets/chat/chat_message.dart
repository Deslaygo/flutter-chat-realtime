import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {
  final String? texto;
  final String? uuid;
  final AnimationController? animationController;

  const ChatMessage({
    Key? key,
    this.texto,
    this.uuid,
    this.animationController,
  }) : super(key: key);

  Widget _myMessage() => Align(
        alignment: Alignment.centerRight,
        child: Container(
          margin: const EdgeInsets.only(bottom: 8, left: 50, right: 5),
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: const Color(0xFF4D9EF6),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            texto!,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
            ),
          ),
        ),
      );

  Widget _notMyMessage() => Align(
        alignment: Alignment.centerLeft,
        child: Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.only(bottom: 8, left: 5, right: 50),
          decoration: BoxDecoration(
            color: Colors.red[300],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            texto!,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
            ),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: animationController!,
      child: SizeTransition(
        sizeFactor: CurvedAnimation(
          parent: animationController!,
          curve: Curves.easeOut,
        ),
        child: Container(
          child: uuid == '123' ? _myMessage() : _notMyMessage(),
        ),
      ),
    );
  }
}
