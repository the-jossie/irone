import '/models/doctor.dart';
import 'package:flutter/material.dart';

class VoiceCallBottomActions extends StatelessWidget {
  final Doctor doctor;
  const VoiceCallBottomActions({Key? key, required this.doctor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 13),
      color: Colors.white,
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
                color: Theme.of(context).colorScheme.secondary,
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
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
        ],
      ),
    );
  }
}
