import 'package:irone/models/User.dart';
import 'package:irone/screens/Dashboard/ProfileScreen/ProfileInfoBox.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  static const routeName = '/profile';

  @override
  Widget build(BuildContext context) {
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
        title: const Text("Profile"),
        titleTextStyle: const TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 19, vertical: 20),
          child: Column(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 19),
                decoration: BoxDecoration(
                  color: const Color(0xffF9F6F4),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Image(
                      image: AssetImage("assets/profile-img.png"),
                      width: 89,
                      height: 91,
                    ),
                    const SizedBox(width: 30),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          user.userName,
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(height: 3),
                        const Text(
                          "Medical ID",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              GridView.count(
                mainAxisSpacing: 25,
                crossAxisSpacing: 34,
                padding:
                    const EdgeInsets.symmetric(vertical: 25, horizontal: 15),
                crossAxisCount: 2,
                shrinkWrap: true,
                children: [
                  ProfileInfoBox(
                      primaryText: user.bloodType, secondaryText: "Blood Type"),
                  ProfileInfoBox(
                      primaryText: '${user.weight} Kg',
                      secondaryText: "Weight"),
                  ProfileInfoBox(
                      primaryText: '${user.height} cm',
                      secondaryText: "Height"),
                  ProfileInfoBox(
                      primaryText: user.dob, secondaryText: "Birth Date"),
                  ProfileInfoBox(primaryText: user.sex, secondaryText: "Sex"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
