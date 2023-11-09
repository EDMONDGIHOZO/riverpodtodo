import 'package:flutter/material.dart';
import 'package:riverpodtodo/data/models/task.dart';
import 'package:riverpodtodo/utils/extensions.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({super.key, required this.task});
  final Task task;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(5)),
      margin: const EdgeInsets.only(top: 4, bottom: 2),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(
          task.title,
          style: context.textTheme.bodyLarge,
        ),
        Icon(task.completed
            ? Icons.check_box
            : Icons.check_box_outline_blank_sharp)
      ]),
    );
    ;
  }
}
