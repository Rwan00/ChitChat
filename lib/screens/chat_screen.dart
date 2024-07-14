import 'package:chitchat/constants/consts.dart';
import 'package:chitchat/theme/fonts.dart';
import 'package:chitchat/widgets/chat_messages.dart';
import 'package:chitchat/widgets/input_feild.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});
  static String id = "Chat Screen";
  @override
  Widget build(BuildContext context) {
    TextEditingController messages = TextEditingController();
    CollectionReference messagesCollection =
        FirebaseFirestore.instance.collection(kMessagesCollection);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          title: Row(
            children: [
              Image.asset(
                kLogo,
                height: 40,
                width: 40,
              ),
              const SizedBox(
                width: 18,
              ),
              Text(
                "Group Chat",
                style: titleStyle.copyWith(fontSize: 22),
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            const Expanded(
              child: ChatMessages(),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: InputField(
                hint: "Send Message",
                controller: messages,
                widget: IconButton(
                  icon: Icon(
                    Icons.send,
                    color: kBrownColor,
                  ),
                  onPressed: () {
                    messagesCollection.add({
                      "message": messages.text,
                      "SendAt" : DateTime.now(),
                    });
                    messages.clear();
                  },
                ),
              ),
            ),
          ],
        ));
  }
}
