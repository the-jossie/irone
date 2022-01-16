import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  final TextEditingController textController;
  final Function validator;
  final String text;
  const Input(
      {Key? key,
      required this.textController,
      required this.validator,
      required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: text,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor,
          ),
          borderRadius: BorderRadius.circular(14),
        ),
      ),
      controller: textController,
      validator: (value) => validator(value),
    );
  }
}
