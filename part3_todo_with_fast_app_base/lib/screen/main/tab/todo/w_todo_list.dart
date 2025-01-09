import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/screen/main/tab/todo/w_todo_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TodoList extends StatelessWidget with TodoDataProvider {
  TodoList({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => todoData.todoList.isEmpty
        ? '할일을 작성해보세요.'.text.size(30).bold.makeCentered()
        : Column(
            children: todoData.todoList.map((e) => TodoItem(e)).toList(),
          ));
  }
}

// GetView 사용 - 지양
// class TodoList extends GetView<TodoDataHolder> {
//   TodoList({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Obx(() => controller.todoList.isEmpty
//         ? '할일을 작성해보세요.'.text.size(30).bold.makeCentered()
//         : Column(
//             children: controller.todoList.map((e) => TodoItem(e)).toList(),
//           ));
//   }
// }

// class TodoList extends StatelessWidget {
//   TodoList({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<TodoDataHolder>(builder: (todoData) {
//       return todoData.todoList.isEmpty
//           ? '할일을 작성해보세요.'.text.size(30).bold.makeCentered()
//           : Column(
//               children: todoData.todoList.map((e) => TodoItem(e)).toList(),
//             );
//     });
//   }
// }
