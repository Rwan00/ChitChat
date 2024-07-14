class MessagesModel {
  final String message;

  MessagesModel({required this.message});

  factory MessagesModel.fromJson(json) {
    return MessagesModel(
      message: json["message"],
    );
  }
}
