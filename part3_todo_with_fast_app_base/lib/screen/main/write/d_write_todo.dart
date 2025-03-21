import 'package:after_layout/after_layout.dart';
import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/dart/extension/datetime_extension.dart';
import 'package:fast_app_base/common/util/app_keyboard_util.dart';
import 'package:fast_app_base/common/widget/bottom_dialog_scaffold.dart';
import 'package:fast_app_base/common/widget/w_round_button.dart';
import 'package:fast_app_base/common/widget/w_rounded_container.dart';
import 'package:fast_app_base/screen/main/write/vo_write_todo_result.dart';
import 'package:flutter/material.dart';
import 'package:nav/dialog/dialog.dart';

import '../../../data/memory/vo_todo.dart';

class WriteTodoDialog extends DialogWidget<WriteTodoResult> {
  final Todo? todoForEdit;
  WriteTodoDialog({this.todoForEdit, super.key});

  @override
  DialogState<WriteTodoDialog> createState() => _WriteTodoDialogState();
}

class _WriteTodoDialogState extends DialogState<WriteTodoDialog>
    with AfterLayoutMixin {
  DateTime _selectedDate = DateTime.now();
  final textController = TextEditingController();
  final node = FocusNode(); // 키보드 보여짐 유무를 알 수 있는 변수?

  @override
  void initState() {
    // TODO: implement initState
    if (widget.todoForEdit != null) {
      _selectedDate = widget.todoForEdit!.dueTime;
      textController.text = widget.todoForEdit!.title;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BottomDialogScaffold(
      body: RoundedContainer(
        color: context.backgroundColor,
        child: Column(
          children: [
            Row(
              children: [
                '할일을 작성해주세요.'.text.bold.size(18).make(),
                const Spacer(),
                _selectedDate.formattedDate.text.make(),
                IconButton(
                    onPressed: _selectDate,
                    icon: const Icon(Icons.calendar_month))
              ],
            ),
            const Height(20),
            Row(
              children: [
                Expanded(
                    child: TextField(
                  focusNode: node,
                  controller: textController,
                )),
                RoundButton(
                    text: isEditMode ? '완료' : '추가',
                    onTap: () {
                      widget.hide(
                          WriteTodoResult(_selectedDate, textController.text));
                    })
              ],
            )
          ],
        ),
      ),
    );
  }

  bool get isEditMode => widget.todoForEdit != null;

  void _selectDate() async {
    final date = await showDatePicker(
        context: context,
        initialDate: _selectedDate,
        firstDate: DateTime.now().subtract(const Duration(days: 365)),
        lastDate: DateTime.now().add(const Duration(days: 365 * 10)));
    if (date != null) {
      setState(() {
        _selectedDate = date;
      });
    }
  }

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) {
    // 바로 키보드 열림
    // TODO: implement afterFirstLayout
    // throw UnimplementedError();
    AppKeyboardUtil.show(context, node);
  }
}
