import 'package:chitchat/models/messages_model.dart';

abstract class ChatState {}

class ChatInitial extends ChatState {}

class ChatSuccess extends ChatState {
  final List<MessagesModel> messages;

  ChatSuccess({required this.messages});
}
