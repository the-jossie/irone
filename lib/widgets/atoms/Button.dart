import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final Function buttonClick;
  final String buttonText;
  const Button({
    Key? key,
    required this.buttonText,
    required this.buttonClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => buttonClick(),
      style: ElevatedButton.styleFrom(
        primary: Theme.of(context).primaryColor,
        minimumSize: const Size(315, 57),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14.0),
        ),
      ),
      child: Text(
        buttonText,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
