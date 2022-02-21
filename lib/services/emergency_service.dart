import 'package:cloud_firestore/cloud_firestore.dart';

class EmergencyServiceClass {
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  Future getEmergencyServices() async {
    return await firebaseFirestore
        .collection("services")
        .get();
  }
}
