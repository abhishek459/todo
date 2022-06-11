import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/task_model.dart';
import '../../providers/task_provider.dart';
import './task_input_field.dart';

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
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      padding: EdgeInsets.only(
        left: 20,
        right: 20,
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
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(40, 40),
                shape: const CircleBorder(),
              ),
              onPressed: addTask,
              child: const Icon(Icons.check))
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
