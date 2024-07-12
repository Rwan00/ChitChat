import 'package:chitchat/constants/consts.dart';
import 'package:chitchat/theme/fonts.dart';
import 'package:chitchat/widgets/chat_bubble.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});
  static String id = "Chat Screen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          title: Row(
            children: [
              Image.asset(
                kLogo,
                height: 50,
                width: 50,
              ),
              Text(
                "Group Chat",
                style: titleStyle,
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            MessageBubble.first(
              username: "Rowan",
              message: "Hello There",
              isMe: true,
              time: "",
            ),
            MessageBubble.next(
              message: "Hello There",
              isMe: true,
              time: "",
            ),
            MessageBubble.first(
              username: "Mira123654788855455",
              message: "Hello There",
              isMe: false,
              time: "",
            ),
            MessageBubble.next(
              message: "Hello There",
              isMe: false,
              time: "",
            ),
          ],
        ));
  }
}
