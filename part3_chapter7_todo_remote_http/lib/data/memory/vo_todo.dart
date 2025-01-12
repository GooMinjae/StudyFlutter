import 'package:fast_app_base/data/local/collection/todo_db_model.dart';
import 'package:fast_app_base/data/memory/todo_status.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'vo_todo.freezed.dart';
part 'vo_todo.g.dart'; // generate

@unfreezed
class Todo with _$Todo {
  Todo._();

  factory Todo({
    required final int id,
    // ignore: invalid_annotation_target
    // ** @JsonKey **
    @JsonKey(name: 'created_time') required final DateTime createdTime,
    DateTime? modifyTime,
    required String title,
    required DateTime dueDate,
    @Default(TodoStatus.unknown) TodoStatus status, // default
  }) = _Todo;

  factory Todo.fromJson(Map<String, Object?> json) =>
      _$TodoFromJson(json); // TodoFromJaon -- **factory**

  TodoDbModel get dbModel =>
      TodoDbModel(id, createdTime, modifyTime, title, dueDate, status);
}
