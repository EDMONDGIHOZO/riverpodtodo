import 'package:flutter/material.dart';
import 'package:riverpodtodo/data/models/task.dart';
import 'package:riverpodtodo/utils/index.dart';
import 'package:riverpodtodo/widgets/common_container.dart';
import 'package:riverpodtodo/widgets/task_tile.dart';

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
              visible: false,
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
              final task = tasks[index];
              return InkWell(
                onLongPress: () {
                  print("long presses");
                },
                onTap: () async {
                  await showModalBottomSheet(
                      context: context,
                      builder: (ctx) {
                        return TaskDetails(task: task);
                      });
                },
                child: TaskTile(
                  task: task,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class TaskDetails extends StatelessWidget {
  const TaskDetails({
    super.key,
    required this.task,
  });

  final Task task;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      padding: const EdgeInsets.all(20),
      child: Text('Selected task is ${task.title}'),
    );
  }
}
