import 'dart:math';

import 'package:flutter/material.dart';

class Chat {
  final String message;
  final String senderImg;
  final String time;
  final bool isSentByMe;

  Chat(
      {required this.message,
      required this.senderImg,
      required this.time,
      required this.isSentByMe});
}

class Chats with ChangeNotifier {
  final Map<int, Chat> _items = {
    1: Chat(
      message: "Hi Doc.! This is Joseph",
      senderImg: "assets/available-doctors/doctor-large-img.png",
      time: DateTime.now().toString(),
      isSentByMe: true,
    ),
    2: Chat(
      message: "Hello Joe, how can i help you ?",
      senderImg: "assets/available-doctors/doctor-large-img.png",
      time: DateTime.now().toString(),
      isSentByMe: false,
    ),
  };

  Map<int, Chat> get items {
    return {..._items};
  }

  void addItem(Chat chat) {
    _items.putIfAbsent(
      Random().nextInt(900000) + 100000,
      () => chat,
    );
    notifyListeners();
  }

}
