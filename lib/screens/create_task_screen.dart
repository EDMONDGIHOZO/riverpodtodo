import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpodtodo/widgets/display_white_text.dart';
import 'package:riverpodtodo/widgets/select_date_time.dart';

class CreateTaskScreen extends StatelessWidget {
  const CreateTaskScreen({super.key});

  static CreateTaskScreen builder(BuildContext context, GoRouterState state) =>
      const CreateTaskScreen();

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
            const CommonTextField(
              title: "Task title",
              hint: "Eate at marriot",
            ),
            const Gap(20),
            const SelectDateTime(),
            const Gap(20),
            const CommonTextField(
              title: "Note",
              hint: "wear black",
              maxLines: 5,
            ),
            const Gap(20),
            SizedBox(
              width: double.maxFinite,
              child: ElevatedButton(
                  onPressed: () {},
                  child: const DisplayWhiteText(text: "Save")),
            )
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
