import 'package:flutter/material.dart';
import '../../models/user_model.dart';
import '../../widgets/atoms/profile_info_box.dart';

class ProfileInfoTabs extends StatelessWidget {
  final UserModel user;
  const ProfileInfoTabs({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      mainAxisSpacing: 25,
      crossAxisSpacing: 34,
      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 15),
      crossAxisCount: 2,
      shrinkWrap: true,
      children: [
        user.bloodType != null
            ? ProfileInfoBox(
                primaryText: user.bloodType.toString(),
                secondaryText: "Blood Type")
            : Container(),
        user.weight != null
            ? ProfileInfoBox(
                primaryText: '${user.weight} Kg', secondaryText: "Weight")
            : Container(),
        user.height != null
            ? ProfileInfoBox(
                primaryText: '${user.height} cm', secondaryText: "Height")
            : Container(),
        user.dob != null
            ? ProfileInfoBox(
                primaryText: user.dob.toString(), secondaryText: "Birth Date")
            : Container(),
        user.sex != null
            ? ProfileInfoBox(
                primaryText: user.sex.toString(), secondaryText: "Sex")
            : Container(),
      ],
    );
  }
}
