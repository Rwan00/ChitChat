import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants/consts.dart';
import '../../models/messages_model.dart';
import 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());

  static ChatCubit get(context) => BlocProvider.of(context);

  CollectionReference messagesCollection =
      FirebaseFirestore.instance.collection(kMessagesCollection);

  void sendMessage({required String message, required String email}) {
    messagesCollection.add({
      "message": message,
      "sendAt": DateTime.now().toString(),
      "id": email,
    });
  }



  void getMessages() {
    messagesCollection
        .orderBy(
          "sendAt",
          descending: true,
        )
        .snapshots()
        .listen((event) {
            List<MessagesModel> messagesList = [];
      for (var doc in event.docs) {
        messagesList.add(MessagesModel.fromJson(doc));
      }
      emit(ChatSuccess(messages: messagesList));
    });
  }
}
