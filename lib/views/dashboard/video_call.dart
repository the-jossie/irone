import '../../models/doctor.dart';
import '../../widgets/molecules/video_call_bottom_actions.dart';
import 'package:flutter/material.dart';

class VideoCallScreenArguments {
  final Doctor doctor;

  VideoCallScreenArguments({required this.doctor});
}

class VideoCallScreen extends StatelessWidget {
  const VideoCallScreen({Key? key}) : super(key: key);
  static const routeName = '/video-call';

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as VideoCallScreenArguments;
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/video-call-bg.png"),
        ),
      ),
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SafeArea(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 23),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
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
                  Container(
                    height: 111,
                    width: 81,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(12)),
                    child: const Image(
                      image: AssetImage("assets/video-call-img.png"),
                    ),
                  )
                ],
              ),
            ),
          ),
          VideoCallBottomActions(
            doctor: args.doctor,
          )
        ],
      ),
    ));
  }
}
