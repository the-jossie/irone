import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../views/auth/login.dart';
import '../../views/dashboard/index.dart';

class Dashlayout extends StatelessWidget {
  const Dashlayout({Key? key}) : super(key: key);
  static const routeName = 'dashboard';

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasData) {
          return const Dashboard();
        } else {
          return const LoginScreen();
        }
      },
    );
  }
}
