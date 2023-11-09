import "package:equatable/equatable.dart";

class Task extends Equatable {
  final int? id;
  final String title;
  final bool completed;
  final int userId;

  const Task(
      {required this.id,
      required this.title,
      required this.completed,
      required this.userId});

  @override
  List<Object> get props {
    return [
      id!,
      userId,
      title,
      completed,
    ];
  }
}
