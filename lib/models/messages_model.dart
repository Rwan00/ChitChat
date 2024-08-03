class MessagesModel {
  final String message;
  final String sendAt;
  final String id;
 

  MessagesModel({
    required this.message,
    required this.sendAt,
    required this.id,
  
    });

  factory MessagesModel.fromJson(json) {
    return MessagesModel(
      message: json["message"],
      sendAt: json["sendAt"].toString(),
      id: json["id"],
     
    );
  }
}
