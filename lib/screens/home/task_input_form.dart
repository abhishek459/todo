import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/task_model.dart';
import '../../providers/task_provider.dart';
import 'task_input_field.dart';

class TaskInputForm extends StatefulWidget {
  const TaskInputForm({Key? key}) : super(key: key);

  @override
  State<TaskInputForm> createState() => _TaskInputFormState();
}

class _TaskInputFormState extends State<TaskInputForm> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 10,
        right: 10,
        top: 20,
        bottom: 20 + MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TaskInputTextField(
            controller: _controller,
            onEditingComplete: addTask,
          ),
          const SizedBox(height: 10),
          ElevatedButton(onPressed: () {}, child: const Text('Save'))
        ],
      ),
    );
  }

  void addTask() {
    if (_controller.text.isEmpty) {
      finishingUp();
      return;
    }
    TaskModel taskData =
        TaskModel(taskTitle: _controller.text, timeStamp: DateTime.now());
    Provider.of<TaskProvider>(context, listen: false).addTask(taskData);
    finishingUp();
  }

  void finishingUp() {
    _controller.clear();
    FocusScope.of(context).unfocus();
    Navigator.of(context).pop();
  }
}
