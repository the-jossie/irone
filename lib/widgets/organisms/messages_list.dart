import '/models/user_model.dart';
import '/services/message.dart';
import 'package:provider/provider.dart';

import '/models/message.dart';
import '/widgets/molecules/message_tile.dart';
import 'package:flutter/material.dart';

class MessagesList extends StatefulWidget {
  final List<Message> messagesList;
  const MessagesList({
    Key? key,
    required this.messagesList,
  }) : super(key: key);

  @override
  State<MessagesList> createState() => _MessagesListState();
}

class _MessagesListState extends State<MessagesList> {
  final MessageService messagesService = MessageService();
  late Stream chatRoomsStream;

  @override
  Widget build(BuildContext context) {
    final currentUser = Provider.of<CurrentUser>(context);
    final user = currentUser.user;

    messagesService.streamChatRooms(user.userId!).then((val) {
      setState(() {
        chatRoomsStream = val;
      });
    });

    // final usersDirectory = Provider.of<UserModel>(context);

    return StreamBuilder(
      stream: chatRoomsStream,
      builder: (context, AsyncSnapshot snapshot) {
        return snapshot.hasData
            ? ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context, index) {
                  return MessageTile(message: snapshot.data.docs[index].data());
                })
            : const Center(
                child: Text("Your recent chats show up here"),
              );
      },
    );
    // return Column(
    //   children: messagesList.map((msg) => MessageTile(message: msg)).toList(),
    // );
  }
}
