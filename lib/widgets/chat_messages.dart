import 'package:chitchat/models/messages_model.dart';
import 'package:chitchat/theme/fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../constants/consts.dart';
import 'chat_bubble.dart';

class ChatMessages extends StatelessWidget {
  const ChatMessages({super.key});

  @override
  Widget build(BuildContext context) {
    CollectionReference messagesCollection =
        FirebaseFirestore.instance.collection(kMessagesCollection);
    return StreamBuilder(
      stream: messagesCollection.orderBy("SendAt").snapshots(),
      builder: (context, snapshot) {
         if (snapshot.hasError) {
          return Center(child: Text('Something went wrong',style: titleStyle,),);
        }

        else if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
          child:   Image.asset(
                  kLoading,
                  width: 90,
                  height: 90,
                ),
          );
        }
        else if (snapshot.hasData) {
          List<MessagesModel> messagesList = [];
          for (int i = 0; i < snapshot.data!.docs.length; i++) {
            messagesList.add(MessagesModel.fromJson(snapshot.data!.docs[i]));
          }
          return ListView.builder(
            itemCount: messagesList.length,
            itemBuilder: (context, index) {
              return MessageBubble.first(
                username: "Rowan",
                message: messagesList[index].message,
                isMe: true,
                time: "",
              );
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
