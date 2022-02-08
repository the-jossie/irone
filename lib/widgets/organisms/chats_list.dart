import 'package:irone/models/chat.dart';
import 'package:irone/widgets/molecules/chat_tile.dart';
import 'package:flutter/material.dart';

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
