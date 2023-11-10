import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpodtodo/data/dataBoxes/task_box.dart';
import 'package:riverpodtodo/data/datasource/task.dart';
import 'package:riverpodtodo/providers/index.dart';
import 'package:riverpodtodo/routes/route_location.dart';
import 'package:riverpodtodo/widgets/display_white_text.dart';
import 'package:riverpodtodo/widgets/select_date_time.dart';

class CreateTaskScreen extends StatefulWidget {
  const CreateTaskScreen({super.key});

  static CreateTaskScreen builder(BuildContext context, GoRouterState state) =>
      const CreateTaskScreen();

  @override
  State<CreateTaskScreen> createState() => _CreateTaskScreenState();
}

class _CreateTaskScreenState extends State<CreateTaskScreen> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController noteController = TextEditingController();
  final TextEditingController startDateController = TextEditingController();
  final TextEditingController startTimeDateController = TextEditingController();

  void saveTask(WidgetRef ref) async {
    var date = ref.read(dateProvider);
    var time = ref.read(dateProvider);
    try {
      tasksBox.put(
          'key_${titleController.text}',
          Task(
              completed: false,
              title: titleController.text,
              startDate: date.toString(),
              note: noteController.text,
              startTime: time.toString()));
      print('task is created');
      context.push(RouteLocation.home);
    } catch (e) {
      print("we have problem");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const DisplayWhiteText(text: "Add new task"),
      ),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            CommonTextField(
              title: "Task title",
              hint: "Eate at marriot",
              controller: titleController,
            ),
            const Gap(20),
            const SelectDateTime(),
            const Gap(20),
            CommonTextField(
              title: "Note",
              hint: "wear black",
              maxLines: 5,
              controller: noteController,
            ),
            const Gap(20),
            Consumer(builder: (context, WidgetRef ref, _) {
              return SizedBox(
                width: double.maxFinite,
                child: ElevatedButton(
                    onPressed: () {
                      saveTask(ref);
                    },
                    child: const DisplayWhiteText(text: "Save")),
              );
            }),
          ],
        ),
      ),
    );
  }
}

class CommonTextField extends StatelessWidget {
  final String title;
  final String? hint;
  final int? maxLines;
  final IconButton? suffix;
  final TextEditingController? controller;
  const CommonTextField(
      {super.key,
      required this.title,
      this.controller,
      this.hint,
      this.suffix,
      this.maxLines});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title),
          const Gap(10),
          TextField(
            maxLines: maxLines ?? 1,
            controller: controller,
            onTapOutside: (event) =>
                {FocusManager.instance.primaryFocus?.unfocus()},
            decoration:
                InputDecoration(hintText: hint ?? "", suffixIcon: suffix),
          )
        ],
      ),
    );
  }
}
