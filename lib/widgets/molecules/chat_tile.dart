import '/models/Chat.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChatTile extends StatelessWidget {
  final Chat chat;
  const ChatTile({Key? key, required this.chat}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Column(
        children: [
          Text(
            DateFormat('HH:mm a').format(
              DateTime.parse(chat.time),
            ),
            // chat.time,
            style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Color(0xff393938)),
          ),
          const SizedBox(height: 8),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: chat.isSentByMe
                ? MainAxisAlignment.end
                : MainAxisAlignment.start,
            children: [
              chat.isSentByMe
                  ? Container()
                  : Container(
                      width: 43,
                      height: 43,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.contain,
                          image: AssetImage(
                            chat.senderImg,
                          ),
                        ),
                      ),
                    ),
              const SizedBox(width: 17),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                decoration: BoxDecoration(
                  color: const Color(0xfff9f6f4),
                  borderRadius: BorderRadius.circular(10.25),
                ),
                child: Text(
                  chat.message,
                  style: const TextStyle(
                    color: Color(0xff393938),
                    fontWeight: FontWeight.w500,
                    fontSize: 13,
                  ),
                ),
              ),
              const SizedBox(width: 17),
              chat.isSentByMe
                  ? Container(
                      width: 43,
                      height: 43,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.contain,
                          image: AssetImage(
                            chat.senderImg,
                          ),
                        ),
                      ),
                    )
                  : Container(),
            ],
          ),
        ],
      ),
    );
  }
}
