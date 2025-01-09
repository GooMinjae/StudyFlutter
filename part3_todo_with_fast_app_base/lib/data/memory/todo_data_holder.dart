import 'package:fast_app_base/data/memory/todo_data_notifier.dart';
import 'package:fast_app_base/data/memory/todo_status.dart';
import 'package:fast_app_base/screen/dialog/d_confirm.dart';
import 'package:flutter/cupertino.dart';

import '../../screen/main/write/d_write_todo.dart';
import 'vo_todo.dart';

class TodoDataHolder extends InheritedWidget {
  final TodoDataNotifier notifier;

  const TodoDataHolder(
      {super.key, required super.child, required this.notifier});

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    // TODO: implement updateShouldNotify
    return true;
  }

  static TodoDataHolder _of(BuildContext context) {
    TodoDataHolder inherited =
        (context.dependOnInheritedWidgetOfExactType<TodoDataHolder>())!;
    return inherited;
  }

  void changeTodoStatus(Todo todo) async {
    switch (todo.status) {
      case TodoStatus.incomplete:
        todo.status = TodoStatus.ongoing;
      case TodoStatus.ongoing:
        todo.status = TodoStatus.complete;
      case TodoStatus.complete:
        final result = await ConfirmDialog('초기화 할까요?').show();
        result?.runIfSuccess((data) {
          todo.status = TodoStatus.incomplete;
        });
    }
    notifier.notify();
  }

  void addTodo() async {
    final result = await WriteTodoDialog().show();

    if (result != null) {
      // TodoDataHolder.of(context) -> context.todoHolder
      notifier.addTodo(Todo(
          id: DateTime.now().millisecondsSinceEpoch, // 현재 시간을 ms 단위로 변환
          title: result.text,
          dueTime: result.dateTime));
    }
  }

  void editTodo(Todo todo) async {
    final result = await WriteTodoDialog(todoForEdit: todo).show();
    if (result != null) {
      todo.title = result.text;
      todo.dueTime = result.dateTime;
      notifier.notify();
    }
  }

  void removeTodo(Todo todo) async {
    notifier.value.remove(todo);
    notifier.notify();
  }
}

extension TodoDataHolderContextExtension on BuildContext {
  TodoDataHolder get todoHolder => TodoDataHolder._of(this);
}
