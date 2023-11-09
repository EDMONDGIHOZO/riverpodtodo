import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:riverpodtodo/providers/index.dart';
import 'package:riverpodtodo/screens/create_task_screen.dart';
import 'package:riverpodtodo/utils/helpers.dart';

class SelectDateTime extends ConsumerWidget {
  const SelectDateTime({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final date = ref.watch(dateProvider);
    final taskTime = ref.watch(timeProvider);

    return Row(
      children: [
        Expanded(
            child: CommonTextField(
                hint: DateFormat.yMMMd().format(date),
                title: "Date",
                suffix: IconButton(
                  onPressed: () => _selectDate(context, ref),
                  icon: const Icon(Icons.calendar_today),
                ))),
        Gap(10),
        Expanded(
            child: CommonTextField(
          hint: Helpers.timeToString(taskTime),
          title: "Time",
          suffix: IconButton(
            icon: const Icon(Icons.lock_clock),
            onPressed: () => _selectTime(context, ref),
          ),
        ))
      ],
    );
  }
}

void _selectTime(BuildContext context, WidgetRef ref) async {
  final initialTime = ref.read(timeProvider);
  TimeOfDay? pickedTime =
      await showTimePicker(context: context, initialTime: initialTime);

  if (pickedTime != null) {
    ref.read(timeProvider.notifier).state = pickedTime;
  }
}

void _selectDate(BuildContext context, WidgetRef ref) async {
  final initialDate = ref.read(dateProvider);
  DateTime? pickedDate = await showDatePicker(
      context: context,
      firstDate: DateTime(2023),
      initialDate: initialDate,
      lastDate: DateTime(2026));

  if (pickedDate != null) {
    ref.read(dateProvider.notifier).state = pickedDate;
  }
}
