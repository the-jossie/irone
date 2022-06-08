import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/services/message.dart';
import '/models/chat.dart';
import '/models/doctor.dart';
import '/models/user_model.dart';
import 'video_call.dart';
import 'voice_call.dart';
import '/widgets/organisms/chats_list.dart';

class ChatScreenArguments {
  final Doctor doctor;
  String convoID;
  ChatScreenArguments({
    required this.doctor,
    required this.convoID,
  });
}

class ChatScreen extends StatefulWidget {
  ChatScreen({
    Key? key,
  }) : super(key: key);

  static const routeName = 'chat';

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController textController = TextEditingController();
  final _scrollController = ScrollController();

  late Stream chatMessagesStream;

  final MessageService messagesService = MessageService();

  void sendMessage(
      {required String convoID,
      required String uid,
      required String profileImg,
      required String recipientId,
      required String message}) {
    if (textController.text.trim() != '') {
      messagesService.sendMessage(
        convoID: convoID,
        uid: uid,
        senderImg: profileImg,
        recipientID: recipientId,
        message: textController.text.trim(),
        timestamp: DateTime.now().millisecondsSinceEpoch.toString(),
      );
      // chats.addItem(
      //   Chat(
      //     message: textController.text.trim(),
      //     senderImg: user.profileImg,
      //     time: DateTime.now().millisecondsSinceEpoch.toString(),
      //     isSentByMe: true,
      //   ),
      // );
      _scrollController.animateTo(0.0,
          duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
      textController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentUser = Provider.of<CurrentUser>(context);
    final user = currentUser.user;
    final args =
        ModalRoute.of(context)!.settings.arguments as ChatScreenArguments;

    String recipientId =
        args.convoID.replaceAll("_", "").replaceAll(user.userId.toString(), "");

    messagesService.streamChatMessages(args.convoID).then((val) {
      setState(() {
        chatMessagesStream = val;
      });
    });
    final chats = Provider.of<Chats>(context);
    final chatsList = chats.items;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
              color: const Color(0xffF9F6F4),
              borderRadius: BorderRadius.circular(7),
            ),
            child: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
        ),
        title: Text("Dr. ${args.doctor.lastName}"),
        centerTitle: false,
        titleTextStyle: const TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        actions: [
          GestureDetector(
            onTap: () => Navigator.pushNamed(
              context,
              VoiceCallScreen.routeName,
              arguments: VoiceCallScreenArguments(doctor: args.doctor),
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 10),
              decoration: BoxDecoration(
                color: const Color(0xffF9F6F4),
                borderRadius: BorderRadius.circular(7),
              ),
              child: Icon(
                Icons.call_outlined,
                color: Theme.of(context).accentColor,
              ),
            ),
          ),
          const SizedBox(
            width: 9,
          ),
          GestureDetector(
            onTap: () => Navigator.pushNamed(
              context,
              VideoCallScreen.routeName,
              arguments: VideoCallScreenArguments(doctor: args.doctor),
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                color: const Color(0xffF9F6F4),
                borderRadius: BorderRadius.circular(7),
              ),
              child: Icon(
                Icons.videocam_outlined,
                color: Theme.of(context).accentColor,
              ),
            ),
          ),
          const SizedBox(
            width: 23,
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 23),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 61,
                      ),
                      Container(
                        margin: const EdgeInsets.all(10),
                        height: 122,
                        width: 108,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.contain,
                            image: AssetImage(
                              args.doctor.profileImg,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        "Dr. ${args.doctor.lastName}",
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: args.doctor.specialty
                              .map(
                                (spec) => Text(
                                  " • $spec",
                                  style: const TextStyle(
                                    color: Color(0xff393938),
                                    fontWeight: FontWeight.w500,
                                  ),
                                  maxLines: 1,
                                  softWrap: false,
                                  overflow: TextOverflow.fade,
                                ),
                              )
                              .toList(),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: List.filled(
                              args.doctor.stars,
                              const Image(
                                image: AssetImage("assets/star.png"),
                              ),
                            ),
                          ),
                          const SizedBox(width: 5),
                          Text(
                            "${args.doctor.reviews} reviews",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 9,
                                color: Theme.of(context).accentColor),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            "${args.doctor.yearsOfExp} •Years Experience",
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 9,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 38,
                      ),
                      ChatList(
                        chatMessageStream: chatMessagesStream,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              padding:
                  const EdgeInsets.only(left: 9, right: 9, top: 16, bottom: 34),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(7),
                    decoration: const BoxDecoration(
                        color: Color(0xfff9f6f4), shape: BoxShape.circle),
                    child: Icon(
                      Icons.add,
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                  const SizedBox(width: 13),
                  Container(
                    padding: const EdgeInsets.all(7),
                    decoration: const BoxDecoration(
                        color: Color(0xfff9f6f4), shape: BoxShape.circle),
                    child: Icon(
                      Icons.attach_file_outlined,
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          color: const Color(0xfff9f6f4),
                          borderRadius: BorderRadius.circular(12)),
                      child: TextFormField(
                        autofocus: true,
                        enableSuggestions: true,
                        onFieldSubmitted: (value) {
                          sendMessage(
                            convoID: args.convoID,
                            uid: user.userId!,
                            profileImg: user.profileImg!,
                            recipientId: recipientId,
                            message: value,
                          );
                        },
                        decoration: const InputDecoration(
                          hintText: "Type Your problems",
                          border: InputBorder.none,
                        ),
                        controller: textController,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {
                      sendMessage(
                          convoID: args.convoID,
                          uid: user.userId!,
                          profileImg: user.profileImg!,
                          recipientId: recipientId,
                          message: textController.text.trim());
                    },
                    child: Container(
                      padding: const EdgeInsets.all(7),
                      decoration: const BoxDecoration(
                          color: Color(0xfff9f6f4), shape: BoxShape.circle),
                      child: Icon(
                        Icons.send_outlined,
                        color: Theme.of(context).accentColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
