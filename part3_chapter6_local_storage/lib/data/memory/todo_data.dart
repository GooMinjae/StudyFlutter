import 'package:fast_app_base/data/memory/todo_status.dart';
import 'package:fast_app_base/data/memory/vo_todo.dart';
import 'package:fast_app_base/data/todo_repository.dart';
import 'package:fast_app_base/screen/dialog/d_confirm.dart';
import 'package:fast_app_base/screen/main/write/d_write_todo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../local/local_db.dart';

class TodoData extends GetxController {
  final RxList<Todo> todoList = <Todo>[].obs;
  //final TodoRepository todoRepository = TodoApi.instance;
  final TodoRepository todoRepository = LocalDB.instance;

  @override
  void onInit() async {
    // local db 사용
    final getTodoResult = await todoRepository.getTodoList();
    getTodoResult.runIfSuccess((data) {
      todoList.addAll(data);
    });

    super.onInit();
  }

  int get newId {
    return DateTime.now().millisecondsSinceEpoch;
  }

  void addTodo(BuildContext context) async {
    final result = await WriteTodoBottomSheet().show();
    result?.runIfSuccess((data) {
      final newTodo = Todo(
        id: newId,
        title: data.title,
        dueDate: data.dueDate,
      );
      todoList.add(newTodo);
      todoRepository.addTodo(newTodo);
    });
  }

  void changeTodoStatus(Todo todo) async {
    switch (todo.status) {
      case TodoStatus.complete:
        final result = await ConfirmDialog('다시 처음 상태로 변경하시겠어요?').show();
        result?.runIfSuccess((data) {
          todo.status = TodoStatus.incomplete;
        });
      case TodoStatus.incomplete:
        todo.status = TodoStatus.ongoing;
      case TodoStatus.ongoing:
        todo.status = TodoStatus.complete;
    }
    updateTodo(todo);
  }

  editTodo(Todo todo) async {
    final result = await WriteTodoBottomSheet(todoForEdit: todo).show();
    result?.runIfSuccess((data) {
      todo.modifyTime = DateTime.now();
      todo.title = data.title;
      todo.dueDate = data.dueDate;
    });
    updateTodo(todo);
  }

  void updateTodo(Todo todo) {
    todoRepository.updateTodo(todo);
    notify(todo);
  }

  void notify(Todo todo) {
    final index = todoList.indexOf(todo);
    todoList[index] = todo;
  }

  void removeTodo(Todo todo) {
    todoList.remove(todo);
    todoRepository.removeTodo(todo.id);
  }
}

mixin class TodoDataProvider {
  late final TodoData todoData = Get.find();
}
