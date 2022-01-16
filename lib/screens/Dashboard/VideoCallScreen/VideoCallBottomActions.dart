import 'package:irone/models/Doctor.dart';
import 'package:irone/screens/Dashboard/ChatScreen/index.dart';
import 'package:irone/screens/Dashboard/VoiceCallScreen/index.dart';
import 'package:flutter/material.dart';

class VideoCallBottomActions extends StatelessWidget {
  final Doctor doctor;
  const VideoCallBottomActions({Key? key, required this.doctor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(left: 80, right: 80, top: 13, bottom: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                color: const Color(0xffF9F6F4),
                borderRadius: BorderRadius.circular(7),
              ),
              child: Icon(
                Icons.message_outlined,
                color: Theme.of(context).accentColor,
              ),
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                color: const Color(0xffF9F6F4),
                borderRadius: BorderRadius.circular(7),
              ),
              child: const Icon(
                Icons.call_end_outlined,
                color: Colors.red,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
              color: const Color(0xffF9F6F4),
              borderRadius: BorderRadius.circular(7),
            ),
            child: Icon(
              Icons.sync_alt_outlined,
              color: Theme.of(context).accentColor,
            ),
          ),
        ],
      ),
    );
  }
}
