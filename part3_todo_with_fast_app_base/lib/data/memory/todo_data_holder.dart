import 'package:fast_app_base/data/memory/todo_status.dart';
import 'package:fast_app_base/screen/dialog/d_confirm.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../screen/main/write/d_write_todo.dart';
import 'vo_todo.dart';

class TodoDataHolder extends GetxController {
  final RxList<Todo> todoList = <Todo>[].obs;

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
    todoList.refresh();
    // // GetBuilder<> controller 사용시 update(); 필요
    // update();
  }

  void addTodo() async {
    final result = await WriteTodoDialog().show();

    if (result != null) {
      // TodoDataHolder.of(context) -> context.todoHolder
      todoList.add(Todo(
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
      todoList.refresh();
      // update();
    }
  }

  void removeTodo(Todo todo) async {
    todoList.remove(todo);
    todoList.refresh();
    // update();
  }
}

mixin class TodoDataProvider {
  late final TodoDataHolder todoData = Get.find();
}
