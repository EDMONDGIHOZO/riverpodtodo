import 'package:flutter/material.dart';
import 'package:riverpodtodo/data/dataBoxes/task_box.dart';
// import 'package:riverpodtodo/data/models/task.dart';
import 'package:riverpodtodo/utils/index.dart';
import 'package:riverpodtodo/widgets/common_container.dart';
import 'package:riverpodtodo/widgets/task_tile.dart';
import 'package:riverpodtodo/data/datasource/task.dart';

class TasksList extends StatefulWidget {
  const TasksList(
      {super.key, this.completedTasks = false, required this.tasks});

  final List<dynamic> tasks;
  final bool completedTasks;

  @override
  State<TasksList> createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  @override
  Widget build(BuildContext context) {
    return CommonContainer(
      child: Column(
        children: [
          Visibility(
              visible: tasksBox.length == 0,
              child: Center(
                child: Text(
                  widget.completedTasks
                      ? 'No completed tasks'
                      : 'No tasks to do',
                  style: context.textTheme.headlineSmall,
                ),
              )),
          ListView.builder(
            shrinkWrap: true,
            itemCount: tasksBox.length,
            itemBuilder: (ctx, index) {
              final task = tasksBox.getAt(index);
              return InkWell(
                onLongPress: () {
                  setState(() {
                    tasksBox.deleteAt(index);
                  });
                  print("long deleted");
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
      child: Column(
        children: [
          Text(
            'Selected task is ${task.title}',
            style: context.textTheme.headlineMedium,
          ),
          Divider(thickness: 3),
          Text(
            task.note ?? "No title",
            style: context.textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }
}
