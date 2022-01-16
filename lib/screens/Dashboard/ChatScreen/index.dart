import 'package:irone/models/Chat.dart';
import 'package:irone/models/Doctor.dart';
import 'package:irone/models/User.dart';
import 'package:irone/screens/Dashboard/VideoCallScreen/index.dart';
import 'package:irone/screens/Dashboard/VoiceCallScreen/index.dart';
import 'package:irone/widgets/organisms/ChatList.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatScreenArguments {
  final Doctor doctor;

  ChatScreenArguments({required this.doctor});
}

class ChatScreen extends StatelessWidget {
  ChatScreen({
    Key? key,
  }) : super(key: key);

  static const routeName = '/chat';
  final TextEditingController textController = TextEditingController();

  void sendMessage(message, chats, user) {
    if (message.isNotEmpty) {
      chats.addItem(
        Chat(
          message: message,
          senderImg: user.profileImg,
          time: DateTime.now().toString(),
          isSentByMe: true,
        ),
      );
      textController.text = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as ChatScreenArguments;
    final chats = Provider.of<Chats>(context);
    final chatsList = chats.items;
    final currentUser = Provider.of<CurrentUser>(context);
    final user = currentUser.user;
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
        title: Text(args.doctor.name),
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
                              args.doctor.imgPath,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        args.doctor.name,
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
                        chatsList: chatsList.values.toList(),
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
                        enableSuggestions: true,
                        onFieldSubmitted: (value) {
                          sendMessage(value, chats, user);
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
                        textController.text,
                        chats,
                        user,
                      );
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
