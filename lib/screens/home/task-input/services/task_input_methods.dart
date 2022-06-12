import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../../../models/task_model.dart';
import '../../../../providers/task_provider.dart';

class TaskMethods {
  static void addTask(
      BuildContext context, TextEditingController taskController) {
    if (taskController.text.isEmpty) {
      return;
    }
    TaskModel taskData =
        TaskModel(taskTitle: taskController.text, timeStamp: DateTime.now());
    Provider.of<TaskProvider>(context, listen: false).addTask(taskData);
  }
}
