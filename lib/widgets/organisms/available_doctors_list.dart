import '/models/user_model.dart';
import 'package:provider/provider.dart';

import '/controllers/message.dart';
import '/models/doctor.dart';
import '../../views/dashboard/chat.dart';
import 'package:flutter/material.dart';

class AvailableDoctorsList extends StatelessWidget {
  final List<Doctor> doctorsList;
  AvailableDoctorsList({Key? key, required this.doctorsList}) : super(key: key);

  MessageController messageController = MessageController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "Emergency consult with your recommended doctor",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        const SizedBox(height: 18),
        SizedBox(
          height: 80,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: doctorsList
                .map(
                  (doctor) => singleView(context, doctor),
                )
                .toList(),
          ),
        ),
      ],
    );
  }

  Widget singleView(BuildContext context, doctor) {
    final currentUser = Provider.of<CurrentUser>(context);
    String convoID = messageController.getConversationID(
        currentUser.user.userId!, doctor.id);
    return Stack(
      children: [
        GestureDetector(
          onTap: () => Navigator.pushNamed(
            context,
            ChatScreen.routeName,
            arguments: ChatScreenArguments(doctor: doctor, convoID: convoID),
          ),
          child: Container(
            margin: const EdgeInsets.only(right: 10),
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                fit: BoxFit.contain,
                image: AssetImage(
                  doctor.profileImg,
                ),
              ),
            ),
          ),
        ),
        doctor.isActive
            ? Positioned(
                right: 10,
                top: 10,
                child: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  width: 15,
                  height: 15,
                  child: Center(
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Theme.of(context).accentColor,
                      ),
                      width: 10,
                      height: 10,
                    ),
                  ),
                ),
              )
            : Container()
      ],
    );
  }
}
