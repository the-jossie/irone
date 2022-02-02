import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:irone/models/EmergencyServices.dart';
import 'package:irone/models/UserModel.dart';
import 'package:irone/screens/Auth/LoginScreen.dart';
import 'package:irone/services/auth.dart';
import 'package:irone/widgets/atoms/Button.dart';
import 'package:irone/widgets/organisms/EmergencyServicesList.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CompleteServiceScreen extends StatefulWidget {
  static const routeName = '/complete-service';
  const CompleteServiceScreen({Key? key}) : super(key: key);

  @override
  _CompleteServiceScreenState createState() => _CompleteServiceScreenState();
}

class _CompleteServiceScreenState extends State<CompleteServiceScreen> {
  final _auth = FirebaseAuth.instance;
  List<String> selectedEmergencyServices = [];
  CompleteServiceScreenArguments args = {} as CompleteServiceScreenArguments;

  @override
  Widget build(BuildContext context) {
    setState(() {
      args = ModalRoute.of(context)!.settings.arguments
          as CompleteServiceScreenArguments;
    });

    final emergencyServices = Provider.of<EmergencyServices>(context);
    final services = emergencyServices.items;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 100),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 52, vertical: 14),
                  color: const Color(0xffF9F6F4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "What type of service you want for emergency ?",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 24),
                      ),
                      SizedBox(height: 6),
                      Text(
                        "You can choose as many as you like, we will  show recommended doctor and articles according to this",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 12),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 44),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 23),
                  child: EmergencyServicesList(
                    title: "Find Your Services",
                    titleSize: 24,
                    services: services,
                    selectedEmergencyServices: selectedEmergencyServices,
                    onClick: (service) => setState(() => {
                          selectedEmergencyServices.contains(service.name)
                              ? selectedEmergencyServices.removeWhere(
                                  (element) => element == service.name)
                              : selectedEmergencyServices.add(service.name)
                        }),
                    showMore: false,
                  ),
                ),
                const SizedBox(height: 36),
                Button(
                  buttonText: 'Done',
                  buttonClick: () => saveUserDetails(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  saveUserDetails() async {
    if (selectedEmergencyServices.isEmpty) {
      Fluttertoast.showToast(msg: "Please select at least a service");
    } else {
      FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
      User? user = _auth.currentUser;

      UserModel userModel = UserModel();

      userModel.sex = args.sex;
      userModel.height = args.height;
      userModel.weight = args.weight;
      userModel.bloodType = args.bloodType;
      userModel.dob = args.dob;
      userModel.services = selectedEmergencyServices;

      await firebaseFirestore
          .collection("users")
          .doc(user!.uid)
          .update(userModel.toMap());

      Fluttertoast.showToast(msg: "Profile updated. Please login!");

      final provider = Provider.of<GoogleSignInProvider>(
        context,
        listen: false,
      );
      await provider.logout();
      await _auth.signOut();

      Navigator.pushNamed(
        context,
        LoginScreen.routeName,
      );
    }
  }
}

class CompleteServiceScreenArguments {
  final String sex;
  final String height;
  final String weight;
  final String bloodType;
  final String dob;
  CompleteServiceScreenArguments({
    required this.sex,
    required this.height,
    required this.weight,
    required this.bloodType,
    required this.dob,
  });
}
