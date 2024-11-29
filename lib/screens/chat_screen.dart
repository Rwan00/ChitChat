import 'package:chitchat/constants/consts.dart';
import 'package:chitchat/features/cubits/chat_cubit/chat_cubit.dart';
import 'package:chitchat/features/cubits/chat_cubit/chat_state.dart';
import 'package:chitchat/theme/fonts.dart';
import 'package:chitchat/widgets/chat_messages.dart';
import 'package:chitchat/widgets/input_feild.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});
  static String id = "Chat Screen";
  @override
  Widget build(BuildContext context) {
    TextEditingController messages = TextEditingController();

    ScrollController scrollController = ScrollController();
    String email = ModalRoute.of(context)!.settings.arguments as String;
    return BlocProvider(
      create: (context) => ChatCubit()..getMessages(),
      child: BlocConsumer<ChatCubit, ChatState>(
        listener: (context,state){},
        builder: (context, state) {
          var cubit = ChatCubit.get(context);
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
                  Expanded(
                    child: ChatMessages(
                      scrollController: scrollController,
                      id: email,
                    ),
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
                         cubit.sendMessage(
                            message: messages.text,
                            email: email,
                          );
                          messages.clear();
                          scrollController.animateTo(
                            0,
                            duration: const Duration(seconds: 1),
                            curve: Curves.easeIn,
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ));
        },
      ),
    );
  }
}
