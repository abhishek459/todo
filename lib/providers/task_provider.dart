import 'package:flutter/cupertino.dart';
import 'package:to_do/utils/db_helper.dart';

import '../models/task_model.dart';

class TaskProvider with ChangeNotifier {
  List<TaskModel> _tasks = [];

  List<TaskModel> get getTasks => _tasks;

  Future<void> fetchAndSetTasks() async {
    final List<Map<String, dynamic>> dataList = await DBHelper.fetchTasks();
    _tasks = dataList
        .map((element) => TaskModel(
              taskTitle: element['title'] as String,
              timeStamp: DateTime.parse(element['id'] as String),
              isCompleted: (element['completed'] == 1) ? true : false,
            ))
        .toList();
    notifyListeners();
  }

  void addTask(TaskModel task) {
    _tasks.add(task);
    notifyListeners();
    final Map<String, Object> sqlData = {
      'id': task.timeStamp.toIso8601String(),
      'title': task.taskTitle,
      'completed': (task.isCompleted) ? 1 : 0,
    };
    DBHelper.insertTask(sqlData);
  }
}
