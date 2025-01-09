import 'todo_status.dart';

class Todo {
  Todo(
      {required this.id,
      required this.title,
      required this.dueTime,
      this.status = TodoStatus.incomplete})
      : createdTime = DateTime.now();

  int id;
  String title;
  final DateTime createdTime;
  DateTime? modityTime;
  DateTime dueTime;
  TodoStatus status;
}
