import 'package:flutter/material.dart';

import 'vo_todo.dart';

class TodoDataNotifier extends ValueNotifier<List<Todo>> {
  TodoDataNotifier() : super([]);

  void addTodo(Todo todo) {
    value.add(todo); // value: List
    notifyListeners();
  }

  void notify() {
    notifyListeners();
  }
}
