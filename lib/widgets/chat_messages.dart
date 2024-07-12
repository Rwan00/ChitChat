import 'package:flutter/material.dart';

import 'chat_bubble.dart';

class ChatMessages extends StatelessWidget {
  const ChatMessages({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context, index) {
      return MessageBubble.first(
        username: "Rowan",
        message: "Hello There",
        isMe: true,
        time: "",
      );
    });
  }
}
