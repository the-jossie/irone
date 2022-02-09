import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  bool? isLoading;
  final Function buttonClick;
  final String buttonText;
  Button({
    Key? key,
    required this.buttonText,
    required this.buttonClick,
    this.isLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => buttonClick(),
      style: ElevatedButton.styleFrom(
        primary: Theme.of(context).primaryColor,
        fixedSize: const Size(315, 57),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14.0),
        ),
      ),
      child: isLoading != null && isLoading!
          ? const Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.white,
              ),
            )
          : Text(
              buttonText,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
    );
  }
}
