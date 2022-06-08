import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '/models/user_model.dart';

class ChatTile extends StatelessWidget {
  final dynamic chat;
  const ChatTile({Key? key, required this.chat}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final currentUser = Provider.of<CurrentUser>(context);
    final user = currentUser.user;
final bool isSentByMe = chat['idFrom'] == user.userId;
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Column(
        children: [
          Text(
            chat['timestamp'],
            // DateFormat('HH:mm a').format(
            //   DateTime.parse(chat['timestamp']),
            // ),
            style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Color(0xff393938)),
          ),
          const SizedBox(height: 8),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: isSentByMe
                ? MainAxisAlignment.end
                : MainAxisAlignment.start,
            children: [
              isSentByMe
                  ? Container()
                  : Container(
                      width: 43,
                      height: 43,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.contain,
                          image: AssetImage(
                            chat['senderImg'],
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
                  chat['content'],
                  style: const TextStyle(
                    color: Color(0xff393938),
                    fontWeight: FontWeight.w500,
                    fontSize: 13,
                  ),
                ),
              ),
              const SizedBox(width: 17),
              isSentByMe
                  ? Container(
                      width: 43,
                      height: 43,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.contain,
                          image: AssetImage(
                            chat['senderImg'],
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
