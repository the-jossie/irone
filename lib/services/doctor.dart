import 'package:cloud_firestore/cloud_firestore.dart';

class DoctorDatabaseClass {
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  Future getDoctors() async {
    return await firebaseFirestore
        .collection("users")
        .where("userType", isEqualTo: "doctor")
        .get();
  }
}
