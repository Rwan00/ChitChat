import 'dart:developer';

import 'package:chitchat/models/messages_model.dart';
import 'package:chitchat/theme/fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../constants/consts.dart';
import 'chat_bubble.dart';

class ChatMessages extends StatelessWidget {
  final ScrollController scrollController;
  final String id;
  const ChatMessages(
      {required this.scrollController, required this.id, super.key});

  @override
  Widget build(BuildContext context) {
    CollectionReference messagesCollection =
        FirebaseFirestore.instance.collection(kMessagesCollection);

    return StreamBuilder(
      stream: messagesCollection
          .orderBy(
            "sendAt",
            descending: true,
          )
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text(
              'Something went wrong',
              style: titleStyle,
            ),
          );
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: Image.asset(
              kLoading,
              width: 90,
              height: 90,
            ),
          );
        } else if (snapshot.hasData) {
          log("start");
          List<MessagesModel> messagesList = [];
          for (int i = 0; i < snapshot.data!.docs.length; i++) {
            messagesList.add(MessagesModel.fromJson(snapshot.data!.docs[i]));
            log("done");
          }
          return ListView.builder(
            reverse: true,
            controller: scrollController,
            itemCount: messagesList.length,
            itemBuilder: (context, index) {
              log("build");
              final message = messagesList[index];
              print(message.message);
              final nextMessage = index + 1 < messagesList.length
                  ? messagesList[index + 1]
                  : null;
              final currentMessageUserId = message.id;
              final nextMessageUserId = nextMessage != null ? message.id : null;

              final bool nextUserIsSame =
                  nextMessageUserId == currentMessageUserId;
              if (nextUserIsSame) {
                return MessageBubble.next(
                  message: message.message,
                  time: message.sendAt,
                  isMe: id == message.id,
                );
              } else {
                return MessageBubble.first(
                  message: message.message,
                  time: message.sendAt,
                  isMe: id == currentMessageUserId,
                );
              }
            },
          );
        } else {
          return Center(
            child: Text(
              "No Messages Found",
              style: titleStyle,
            ),
          );
        }
      },
    );
  }
}
