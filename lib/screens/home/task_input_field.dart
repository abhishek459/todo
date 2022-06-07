import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../models/task_model.dart';
import '../../providers/task_provider.dart';

class TaskInputTextField extends StatefulWidget {
  const TaskInputTextField({Key? key}) : super(key: key);

  @override
  State<TaskInputTextField> createState() => _TaskInputTextFieldState();
}

class _TaskInputTextFieldState extends State<TaskInputTextField> {
  final TextEditingController _taskController = TextEditingController();

  @override
  void dispose() {
    _taskController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    void addTask() {
      if (_taskController.text.isEmpty) {
        finishingUp();
        return;
      }
      TaskModel taskData =
          TaskModel(taskTitle: _taskController.text, timeStamp: DateTime.now());
      Provider.of<TaskProvider>(context, listen: false).addTask(taskData);
      finishingUp();
    }

    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        hintText: 'Add a task!',
        suffixIcon: IconButton(
          icon: const Icon(Icons.add),
          onPressed: addTask,
        ),
      ),
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9 ]'))
      ],
      textInputAction: TextInputAction.done,
      textCapitalization: TextCapitalization.sentences,
      controller: _taskController,
      onEditingComplete: addTask,
      maxLength: 100,
    );
  }

  void finishingUp() {
    _taskController.clear();
    FocusScope.of(context).unfocus();
  }
}
