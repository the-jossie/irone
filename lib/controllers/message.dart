import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/models/user_model.dart';
import '/services/message.dart';

class MessageController {
  final CurrentUser currentUser = CurrentUser();

  String getConversationID(String uid, String peerID) {
    return uid.hashCode <= peerID.hashCode
        ? uid + '_' + peerID
        : peerID + '_' + uid;
  }

  Future<QuerySnapshot<Object?>> getChatRooms(BuildContext context, String uid) async {
    final messagesList = Provider.of<MessageService>(context, listen: false);

    return await messagesList.streamChatRooms(uid).then((snapshot) => {
          snapshot.map(
            (QuerySnapshot list) => list.docs
                .map(
                  (DocumentSnapshot snap) => UserModel.fromMap(snap.data),
                )
                .toList(),
          )
        });
  }
}
