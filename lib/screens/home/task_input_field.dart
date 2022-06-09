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
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).hintColor, width: 2),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Add a task...',
          counterText: "",
          suffixIcon: IconButton(
            icon: const Icon(Icons.check),
            onPressed: addTask,
            splashRadius: 25,
          ),
        ),
        style: Theme.of(context).textTheme.displayMedium,
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9 !,.]'))
        ],
        textInputAction: TextInputAction.done,
        textCapitalization: TextCapitalization.sentences,
        controller: _taskController,
        onEditingComplete: addTask,
        maxLength: 100,
      ),
    );
  }

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

  void finishingUp() {
    _taskController.clear();
    FocusScope.of(context).unfocus();
  }
}
