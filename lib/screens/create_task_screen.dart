import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpodtodo/widgets/display_white_text.dart';

class CreateTaskScreen extends StatelessWidget {
  const CreateTaskScreen({super.key});

  static CreateTaskScreen builder(BuildContext context, GoRouterState state) =>
      const CreateTaskScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: DisplayWhiteText(text: "Add new task"),
      ),
    );
  }
}
