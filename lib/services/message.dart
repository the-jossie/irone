import 'package:cloud_firestore/cloud_firestore.dart';
import '/models/message.dart';
import '/models/user_model.dart';

class MessageService {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  streamUsers() async {
    return _firebaseFirestore.collection("users").snapshots().map(
          (QuerySnapshot list) => list.docs
              .map(
                (DocumentSnapshot snap) => UserModel.fromMap(snap.data),
              )
              .toList(),
        );
  }

  streamChatRooms(String uid) async {
    return _firebaseFirestore
        .collection("messages")
        .orderBy('lastMessage.timestamp', descending: true)
        .where("users", arrayContains: uid)
        .snapshots()
        .map((QuerySnapshot list) => list.docs
            .map((DocumentSnapshot doc) => Message.fromMap(doc))
            .toList());
  }

  streamChatMessages(String convoID) async {
    return _firebaseFirestore
        .collection('messages')
        .doc(convoID)
        .collection(convoID)
        .orderBy('timestamp', descending: true)
        .limit(50)
        .snapshots();
  }

  void sendMessage(
      {required String convoID,
      required String uid,
      required String senderImg,
      required String recipientID,
      required String message,
      required String timestamp}) {
    final DocumentReference convoDoc =
        _firebaseFirestore.collection('messages').doc(convoID);

    convoDoc.set(<String, dynamic>{
      'lastMessage': <String, dynamic>{
        'idFrom': uid,
        'idTo': recipientID,
        'senderImg': senderImg,
        'timestamp': timestamp,
        'content': message,
        'read': false,
      },
      'users': <String>[uid, recipientID]
    }).then(
      (dynamic success) {
        final DocumentReference messageDoc = _firebaseFirestore
            .collection('messages')
            .doc(convoID)
            .collection(convoID)
            .doc(timestamp);

        _firebaseFirestore.runTransaction(
          (transaction) async {
            transaction.set(
              messageDoc,
              <String, dynamic>{
                'idFrom': uid,
                'idTo': recipientID,
                'senderImg': senderImg,
                'timestamp': timestamp,
                'content': message,
                'read': false,
              },
            );
          },
        );
      },
    );
  }

  // Stream<List<UserModel>> getUsersBylist(List<String> userIds) {
  //   final List<Stream<UserModel>> streams = [];
  //   for (String id in userIds) {
  //     streams.add(_firebaseFirestore
  //         .collection('users')
  //         .doc(id)
  //         .snapshots()
  //         .map((DocumentSnapshot snap) => UserModel.fromMap(snap.data)));
  //   }
  //   return StreamZip<UserModel>(streams).asBroadcastStream();
  // }
}
