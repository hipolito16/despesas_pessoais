import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class AdaptativeDatePicker extends StatefulWidget {
  final DateTime selectedDate;
  final void Function(DateTime) onDateChanged;

  const AdaptativeDatePicker({
    required this.selectedDate,
    required this.onDateChanged,
    Key? key,
  }) : super(key: key);

  @override
  State<AdaptativeDatePicker> createState() => _AdaptativeDatePickerState();
}

class _AdaptativeDatePickerState extends State<AdaptativeDatePicker> {
  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? SizedBox(
            height: 180,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              initialDateTime: widget.selectedDate,
              minimumDate: DateTime(DateTime.now().year - 100),
              maximumDate: DateTime(DateTime.now().year + 100),
              onDateTimeChanged: widget.onDateChanged,
            ),
          )
        : SizedBox(
            height: 70,
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'Data Selecionada: ${widget.selectedDate.day}/${widget.selectedDate.month}/${widget.selectedDate.year}',
                  ),
                ),
                TextButton(
                  onPressed: () async {
                    final DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: widget.selectedDate,
                      firstDate: DateTime(DateTime.now().year - 100),
                      lastDate: DateTime(DateTime.now().year + 100),
                    );
                    if (pickedDate != null) {
                      widget.onDateChanged(pickedDate);
                    }
                  },
                  child: const Text(
                    'Selecionar Data',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          );
  }
}
