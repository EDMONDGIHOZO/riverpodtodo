import "package:equatable/equatable.dart";

class Task extends Equatable {
  final int? id;
  final String title;
  final String? note;
  final DateTime? startDate;
  final DateTime? startTime;
  final bool completed;
  final int userId;

  const Task(
      {required this.id,
      required this.title,
      this.note,
      required this.completed,
      this.startDate,
      this.startTime,
      required this.userId});

  @override
  List<Object> get props {
    return [id!, userId, title, completed, startDate!, startTime!, note!];
  }
}
