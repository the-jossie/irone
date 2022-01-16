import 'package:irone/models/Doctor.dart';
import 'package:irone/screens/Dashboard/VoiceCallScreen/VoiceCallBottomActions.dart';
import 'package:flutter/material.dart';

class VoiceCallScreenArguments {
  final Doctor doctor;

  VoiceCallScreenArguments({required this.doctor});
}

class VoiceCallScreen extends StatelessWidget {
  const VoiceCallScreen({Key? key}) : super(key: key);
  static const routeName = '/voice-call';

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as VoiceCallScreenArguments;
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
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Center(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.all(10),
                        height: 400,
                        decoration: const BoxDecoration(
                          // color: Theme.of(context).primaryColor,
                          // backgroundBlendMode: BlendMode.softLight,
                          image: DecorationImage(
                            fit: BoxFit.contain,
                            image: AssetImage(
                              "assets/call-bg.png",
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(10),
                        height: 214,
                        width: 214,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color(0xfff99441),
                            width: 20,
                          ),
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.contain,
                            image: AssetImage(
                              args.doctor.imgPath,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  args.doctor.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                const Text(
                  "05.00secs",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            VoiceCallBottomActions(
              doctor: args.doctor,
            )
          ],
        ),
      ),
    );
  }
}
