import 'package:chitchat/constants/consts.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../theme/fonts.dart';

class MessageBubble extends StatelessWidget {
  const MessageBubble.first({
    super.key,
   
    required this.message,
    required this.isMe,
    required this.time,
    this.file,
  }) : isFirstInSequence = true;

  const MessageBubble.next({
    super.key,
    required this.message,
    required this.isMe,
    required this.time,
    this.file,
  })  : isFirstInSequence = false
       ;

  final bool isFirstInSequence;

  
  final String? message;

  final bool isMe;

  final String? file;
  final String time;

  @override
  Widget build(BuildContext context) {
    DateTime apiDateTime = DateTime.parse(time);

     String formattedDateTime =
        DateFormat.MMMMEEEEd().addPattern("'at' HH:mm").format(apiDateTime); 
    return Stack(
      children: [
        Row(
          mainAxisAlignment:
              isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment:
                  isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
              children: [
                if (isFirstInSequence) const SizedBox(height: 18),
                
                Container(
                  decoration: BoxDecoration(
                    color: isMe ? kBrownColor : kPrimaryColor,
                    borderRadius: BorderRadius.only(
                      topLeft: !isMe && isFirstInSequence
                          ? Radius.zero
                          : const Radius.circular(12),
                      topRight: isMe && isFirstInSequence
                          ? Radius.zero
                          : const Radius.circular(12),
                      bottomLeft: const Radius.circular(12),
                      bottomRight: const Radius.circular(12),
                    ),
                  ),
                  constraints: const BoxConstraints(maxWidth: 300),
                  padding: file == null
                      ? const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 14,
                        )
                      : null,
                  margin: const EdgeInsets.symmetric(
                    vertical: 4,
                    horizontal: 12,
                  ),
                  child: file != null
                      ? GestureDetector(
                          onTap: () {},
                          child: InteractiveViewer(
                            minScale: 0.5,
                            maxScale: 4,
                            child: Container(
                              height: 260,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                image: DecorationImage(
                                  image: NetworkImage(
                                    file!,
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        )
                      : Text(
                          message!,
                          style: isMe
                              ? titleStyle.copyWith(color: Colors.white)
                              : titleStyle,
                          softWrap: true,
                        ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 13,
                    right: 13,
                  ),
                  child: Text(
                    formattedDateTime,
                    style: subTitle,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
