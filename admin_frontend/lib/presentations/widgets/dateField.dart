// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateFormField extends StatefulWidget {
  final String label;
  final TextEditingController dateController;
  DateFormField({super.key, required this.dateController, required this.label});

  @override
  State<DateFormField> createState() => _DateFormFieldState();
}

class _DateFormFieldState extends State<DateFormField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      readOnly: true,
      decoration: InputDecoration(
        labelText: widget.label,
        border: const OutlineInputBorder(),
        hintText: DateFormat('yyyy-MM-dd').format(DateTime.now()),
        suffixIcon: const Icon(Icons.calendar_month_rounded),
      ),
      controller: widget.dateController,
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(1899),
          lastDate: DateTime(2200),
        );

        if (pickedDate != null) {
          setState(() {
            widget.dateController.text =
                DateFormat('yyyy-MM-dd').format(pickedDate);
          });
        }
      },
    );
  }
}
