import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//widgets
import '../widgets/chat/chat_message.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> with TickerProviderStateMixin {
  final chatTxt = TextEditingController();

  final chatFocus = FocusNode();

  bool _estaEscribiendo = false;

  final List<ChatMessage> messages = [];

  @override
  void dispose() {
    //TODO: El off de socket
    super.dispose();
    for (final message in messages) {
      message.animationController!.dispose();
    }
  }

  Widget _inputChat() => SafeArea(
          child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(
              width: 0.5,
              color: Colors.black38,
            ),
          ),
        ),
        child: Row(
          children: <Widget>[
            Flexible(
              child: TextField(
                focusNode: chatFocus,
                decoration:
                    const InputDecoration.collapsed(hintText: 'Enviar mensaje'),
                controller: chatTxt,
                onSubmitted: _handleSummit,
                onChanged: (String text) {
                  if (text.isEmpty) {
                    _estaEscribiendo = false;
                  } else {
                    _estaEscribiendo = true;
                  }
                  setState(() {});
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 4),
              child: Platform.isIOS
                  ? CupertinoButton(
                      child: const Text('Enviar'), onPressed: () {})
                  : Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      child: IconTheme(
                        data: IconThemeData(color: Colors.blue[400]),
                        child: IconButton(
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          icon: const Icon(Icons.send),
                          onPressed: _estaEscribiendo
                              ? () => _handleSummit(chatTxt.text.trim())
                              : null,
                        ),
                      )),
            )
          ],
        ),
      ));

  _handleSummit(String texto) {
    if (texto.isEmpty) return;
    final newMessage = ChatMessage(
      uuid: '123',
      texto: texto,
      animationController: AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 300),
      ),
    );
    messages.insert(0, newMessage);
    newMessage.animationController?.forward();
    chatTxt.clear();
    chatFocus.requestFocus();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: Row(
          children: [
            CircleAvatar(
              maxRadius: 14,
              child: const Text(
                'Te',
                style: TextStyle(fontSize: 12),
              ),
              backgroundColor: Colors.blue[100],
            ),
            const SizedBox(width: 16),
            const Text(
              'Melissa Flores',
              style: TextStyle(fontSize: 12, color: Colors.black87),
            ),
          ],
        ),
      ),
      body: Column(
        children: <Widget>[
          Flexible(
            child: ListView.builder(
              reverse: true,
              physics: const BouncingScrollPhysics(),
              itemCount: messages.length,
              itemBuilder: (_, i) => messages[i],
            ),
          ),
          const Divider(
            height: 1,
          ),
          // TODO: caja de texto
          SizedBox(
            height: 50,
            child: _inputChat(),
          )
        ],
      ),
    );
  }
}
