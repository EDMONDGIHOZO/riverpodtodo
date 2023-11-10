import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:riverpodtodo/app/main_app.dart';
import 'package:riverpodtodo/data/dataBoxes/task_box.dart';
import 'package:riverpodtodo/data/datasource/task.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(TaskAdapter());
  tasksBox = await Hive.openBox<Task>('tasksBox');
  runApp(const ProviderScope(child: MainApp()));
}
