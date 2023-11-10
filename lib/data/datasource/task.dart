import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'task.g.dart';

@HiveType(typeId: 1)
class Task {
  Task(
      {required this.title,
      required this.startDate,
      required this.startTime,
      this.completed,
      this.note});
  @HiveField(0)
  String title;

  @HiveField(1, defaultValue: false)
  bool? completed;

  @HiveField(2)
  String? note;

  @HiveField(3)
  String startDate;

  @HiveField(4)
  String startTime;
}
