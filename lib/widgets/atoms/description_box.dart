import 'package:flutter/material.dart';

class DescriptionBox extends StatelessWidget {
  final String title;
  final String subTitle;
  const DescriptionBox({Key? key, required this.title, required this.subTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 52, vertical: 14),
      color: const Color(0xffF9F6F4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 24),
          ),
          const SizedBox(height: 6),
          Text(
            subTitle,
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
