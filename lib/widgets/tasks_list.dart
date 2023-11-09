import 'package:flutter/material.dart';
import 'package:riverpodtodo/data/models/task.dart';
import 'package:riverpodtodo/utils/index.dart';
import 'package:riverpodtodo/widgets/common_container.dart';

class TasksList extends StatelessWidget {
  const TasksList(
      {super.key, this.completedTasks = false, required this.tasks});

  final List<Task> tasks;
  final bool completedTasks;

  @override
  Widget build(BuildContext context) {
    return CommonContainer(
      child: Column(
        children: [
          Visibility(
              visible: tasks.isEmpty,
              child: Center(
                child: Text(
                  completedTasks ? 'No completed tasks' : 'No tasks to do',
                  style: context.textTheme.headlineSmall,
                ),
              )),
          ListView.builder(
              shrinkWrap: true,
              itemCount: tasks.length,
              itemBuilder: (ctx, index) {
                return const Text("item");
              }),
        ],
      ),
    );
  }
}
