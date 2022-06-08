import '/widgets/molecules/chat_tile.dart';
import 'package:flutter/material.dart';

class ChatList extends StatelessWidget {
  final Stream chatMessageStream;
   ChatList({Key? key, required this.chatMessageStream}) : super(key: key);
  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: chatMessageStream,
      builder: (context, AsyncSnapshot snapshot) {
        return snapshot.hasData
            ? ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data.docs.length,
                reverse: true,
                controller: _scrollController,
                itemBuilder: (context, index) {
                  return ChatTile(
                    chat: snapshot.data.docs[index].data(),
                  );
                })
            : Container();
      },
      // children: chatsList.map((chat) => ChatTile(chat: chat)).toList(),
    );
  }
}
