import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:riverpodtodo/utils/index.dart';
import 'package:riverpodtodo/widgets/app_background.dart';
import 'package:riverpodtodo/widgets/display_white_text.dart';
import 'package:riverpodtodo/widgets/tasks_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colorScheme;
    double screenHeight = MediaQuery.of(context).size.height;
    double containerHeight = screenHeight * 0.3;

    return Scaffold(
        body: Stack(
      children: [
        AppBackground(
          headerHeight: containerHeight,
          header: const SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Column(
              children: [
                DisplayWhiteText(text: 'My Todo List', size: 40),
              ],
            ),
          ),
        ),
        Positioned(
            top: 100,
            right: 0,
            left: 0,
            child: SafeArea(
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    const TasksList(
                      tasks: [],
                    ),
                    const Gap(20),
                    DisplayWhiteText(
                      color: colors.primary,
                      text: "Completed!",
                      fontWeight: FontWeight.bold,
                    ),
                    const Gap(20),
                    const TasksList(
                      tasks: [],
                      completedTasks: true,
                    ),
                    const Gap(20),
                    ElevatedButton(
                        onPressed: () {},
                        child: const DisplayWhiteText(
                          text: "Add new task",
                          size: 20,
                        )),
                  ],
                ),
              ),
            ))
      ],
    ));
  }
}
