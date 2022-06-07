import 'package:flutter/cupertino.dart';
import 'package:to_do/models/task_model.dart';

class TaskProvider extends ChangeNotifier {
  final List<TaskModel> _tasks = [];

  List<TaskModel> get getTasks => _tasks;

  void addTask(TaskModel task) {
    _tasks.add(task);
    notifyListeners();
  }
}
