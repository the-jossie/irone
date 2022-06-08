import 'package:irone/models/user_model.dart';
import 'package:flutter/material.dart';
import '../../widgets/molecules/profile_info_tabs.dart';
import '../../widgets/organisms/profile_screen_appbar.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  static const routeName = 'profile';

  @override
  Widget build(BuildContext context) {
    final currentUser = Provider.of<CurrentUser>(context);
    final user = currentUser.user;
    return Scaffold(
      // TODO: CHECK THIS OUT oo
      appBar:  ProfileScreenAppBar(context),
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
                          user.firstName.toString(),
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
              ProfileInfoTabs(user: user),
            ],
          ),
        ),
      ),
    );
  }
}
