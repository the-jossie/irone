import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final Function buttonClick;
  final String buttonText;
  final bool loading;

  const Button({
    Key? key,
    required this.buttonText,
    required this.buttonClick,
    required this.loading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: loading,
      child: ElevatedButton(
        onPressed: () => buttonClick(),
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).primaryColor,
          minimumSize: const Size(315, 57),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14.0),
          ),
        ),
        child: loading
            ? const CircularProgressIndicator.adaptive()
            : Text(
                buttonText,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
      ),
    );
  }
}
