import 'package:flutter/material.dart';

import '/models/Chat.dart';
import '/widgets/molecules/chat_tile.dart';

class ChatList extends StatelessWidget {
  final List<Chat> chatsList;
  const ChatList({Key? key, required this.chatsList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: chatsList.map((chat) => ChatTile(chat: chat)).toList(),
    );
  }
}
