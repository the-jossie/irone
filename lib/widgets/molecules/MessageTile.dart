import 'package:irone/models/Message.dart';
import 'package:irone/screens/Dashboard/ChatScreen/index.dart';
import 'package:flutter/material.dart';

class MessageTile extends StatelessWidget {
  final Message message;
  const MessageTile({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(
        context,
        '/chat',
        arguments: ChatScreenArguments(doctor: message.doctor),
      ),
      child: Container(
        margin: const EdgeInsets.only(bottom: 15),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: const Color(0xffF9F9F9),
        ),
        child: ListTile(
          leading: Container(
            width: 56,
            height: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                fit: BoxFit.contain,
                image: AssetImage(
                  message.doctor.imgPath,
                ),
              ),
            ),
          ),
          title: Text(
            message.doctor.name,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
          subtitle: Row(
            children: [
              Text(
                message.lastMessage.length > 25
                    ? message.lastMessage
                        .replaceRange(25, message.lastMessage.length, "...")
                    : message.lastMessage,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  color: Color(0xff393938),
                ),
              ),
              Text(
                '• ${message.lastMsgTime}',
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  color: Color(0xff393938),
                ),
              ),
            ],
          ),
          trailing: !message.isRead
              ? Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  width: 15,
                  height: 15,
                  child: Center(
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Theme.of(context).accentColor,
                      ),
                      width: 10,
                      height: 10,
                    ),
                  ),
                )
              : Container(width: 0),
        ),
      ),
    );
  }
}
