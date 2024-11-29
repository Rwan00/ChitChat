import 'dart:developer';

import 'package:chitchat/features/cubits/chat_cubit/chat_cubit.dart';
import 'package:chitchat/features/cubits/chat_cubit/chat_state.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import 'chat_bubble.dart';

class ChatMessages extends StatelessWidget {
  final ScrollController scrollController;
  final String id;
  const ChatMessages(
      {required this.scrollController, required this.id, super.key});

  @override
  Widget build(BuildContext context) {
    
    return BlocConsumer<ChatCubit, ChatState>(
      listener: (context, state) {
       
      },
      builder: (context, state) {
        
        return state is ChatSuccess? ListView.builder(
          reverse: true,
          controller: scrollController,
          itemCount: state.messages.length,
          itemBuilder: (context, index) {
            log("build");
            final message = state.messages[index];
            print(message.message);
            final nextMessage = index + 1 < state.messages.length
                ? state.messages[index + 1]
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
        ):Container();
      },
    );
  }
}
