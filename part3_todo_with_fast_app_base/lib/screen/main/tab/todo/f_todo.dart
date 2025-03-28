// import 'package:fast_app_base/app.dart';
import 'package:fast_app_base/common/common.dart';
import 'package:flutter/material.dart';

import 'w_todo_list.dart';

class TodoFragment extends StatefulWidget {
  const TodoFragment({super.key});

  @override
  State<TodoFragment> createState() => _TodoFragmentState();
}

class _TodoFragmentState extends State<TodoFragment> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: context.appColors.seedColor.getMaterialColorValues[200],
      color: context.appColors.seedColor.getSwatchByBrightness(100),
      child: Column(
        children: [
          Row(
            children: [
              IconButton(
                  onPressed: () => Scaffold.of(context).openDrawer(),
                  icon: const Icon(Icons.menu)),
              const EmptyExpanded()
            ],
          ),
          Expanded(child: TodoList().pSymmetric(h: 15)),
        ],
      ),
    );
  }
}
