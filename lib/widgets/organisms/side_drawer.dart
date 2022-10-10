import '/models/user.dart';
import '/screens/auth/login_screen.dart';
import '/screens/dashboard/appointments_screen/index.dart';
import '/screens/dashboard/bookmarks/index.dart';
import '/screens/dashboard/profile_screen/index.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SideDrawer extends StatelessWidget {
  const SideDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentUser = Provider.of<CurrentUser>(context);
    final user = currentUser.user;
    return SafeArea(
      child: Container(
        color: Theme.of(context).primaryColor,
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Image(
              height: 78,
              width: 76,
              image: AssetImage("assets/avatar.png"),
            ),
            const SizedBox(height: 20),
            const Text(
              "Hello,",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
            Text(
              user.userName,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            const SizedBox(height: 33),
            Container(
              padding: const EdgeInsets.only(left: 33),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(
                      context,
                      ProfileScreen.routeName,
                    ),
                    child: const Text(
                      "Profile",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  const SizedBox(height: 35),
                  GestureDetector(
                    onTap: () =>
                        Navigator.pushNamed(context, BookmarksScreen.routeName),
                    child: const Text(
                      "Bookmarks",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  const SizedBox(height: 35),
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(
                        context, AppointmentsScreen.routeName),
                    child: const Text(
                      "Appointments",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  const SizedBox(height: 240),
                  GestureDetector(
                    onTap: () =>
                        Navigator.pushNamed(context, LoginScreen.routeName),
                    child: const Text(
                      "Log out",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
