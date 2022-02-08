import 'package:flutter/material.dart';

class ProfileInfoBox extends StatelessWidget {
  final String primaryText;
  final String secondaryText;
  const ProfileInfoBox(
      {Key? key, required this.primaryText, required this.secondaryText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 129,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xffF9F6F4),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            primaryText,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          const SizedBox(height: 18),
          Text(
            secondaryText,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Color(0x90393938),
            ),
          ),
        ],
      ),
    );
  }
}
