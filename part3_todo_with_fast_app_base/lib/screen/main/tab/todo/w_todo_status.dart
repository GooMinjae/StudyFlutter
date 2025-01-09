import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/data/memory/todo_status.dart';
import 'package:fast_app_base/data/memory/vo_todo.dart';
import 'package:flutter/material.dart';

import 'w_fire.dart';

class TodoStatusWidget extends StatelessWidget {
  final Todo todo;
  const TodoStatusWidget(this.todo, {super.key});

  @override
  Widget build(BuildContext context) {
    return Tap(
      onTap: () {
        context.todoHolder.changeTodoStatus(todo);
      },
      child: SizedBox(
        width: 50,
        height: 50,
        // child: Checkbox(
        //   value: true,
        //   onChanged: null,
        //   fillColor: WidgetStateProperty.all(context.appColors.checkBoxColor),
        // ),
        child: switch (todo.status) {
          TodoStatus.complete => Checkbox(
              value: true,
              onChanged: null,
              fillColor:
                  WidgetStateProperty.all(context.appColors.checkBoxColor),
            ),
          TodoStatus.incomplete => const Checkbox(
              value: false,
              onChanged: null,
            ),
          TodoStatus.ongoing => const Fire()
        },
      ),
    );
  }
}
