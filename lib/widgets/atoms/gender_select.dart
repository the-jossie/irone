import 'package:flutter/material.dart';

class GenderSelect extends StatelessWidget {
  final Function onClick;
  final String value;
  final String selectedValue;
  const GenderSelect(
      {Key? key,
      required this.onClick,
      required this.value,
      required this.selectedValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onClick(value),
      child: Container(
        height: 38,
        width: 133,
        decoration: BoxDecoration(
            color: selectedValue == value
                ? const Color(0xffEF873D)
                : const Color(0xffF9F6F4),
            borderRadius: BorderRadius.circular(12)),
        child: Center(
          child: Text(
            value,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 18,
              color: selectedValue == value ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
