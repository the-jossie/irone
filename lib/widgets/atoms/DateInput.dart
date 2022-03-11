import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateInput extends StatelessWidget {
  final DateTime selectedDate;
  final Function setSelectedDate;
  final TextEditingController dateController;
  const DateInput(
      {Key? key,
      required this.selectedDate,
      required this.setSelectedDate,
      required this.dateController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: () => _selectDate(context),
      decoration: InputDecoration(
        hintText: DateFormat.yMMMd().format(
          DateTime.parse(
            selectedDate.toString(),
          ),
        ),
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
      readOnly: true,
      controller: dateController,
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900, 1),
      lastDate: DateTime(2020),
    );
    if (picked != null && picked != selectedDate) {
      setSelectedDate(picked);
    }
  }
}
