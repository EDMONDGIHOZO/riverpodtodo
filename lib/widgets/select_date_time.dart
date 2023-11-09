import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:riverpodtodo/screens/create_task_screen.dart';

class SelectDateTime extends StatelessWidget {
  const SelectDateTime({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: CommonTextField(
                hint: "9/10",
                title: "Date",
                suffix: IconButton(
                  onPressed: () => _selectDate(context),
                  icon: const Icon(Icons.calendar_today),
                ))),
        Gap(10),
        Expanded(
            child: CommonTextField(
          hint: "9:30 PM",
          title: "Time",
          suffix: IconButton(
            icon: const Icon(Icons.lock_clock),
            onPressed: () => _selectTime(context),
          ),
        ))
      ],
    );
  }
}

void _selectTime(context) async {
  TimeOfDay? pickedTime =
      await showTimePicker(context: context, initialTime: TimeOfDay.now());

  if (pickedTime != null) {
    print(pickedTime);
  }
}

void _selectDate(context) async {
  DateTime? pickedDate = await showDatePicker(
      context: context,
      firstDate: DateTime(2023),
      initialDate: DateTime.now(),
      lastDate: DateTime(2026));

  if (pickedDate != null) {
    print(pickedDate);
  }
}
