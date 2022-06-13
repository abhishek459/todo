import 'package:flutter/cupertino.dart';
import 'package:to_do/utils/db_helper.dart';

class TaskModel with ChangeNotifier {
  final String taskTitle;
  final DateTime timeStamp;
  final DateTime? deadline;
  final DateTime? completedOn;
  bool isCompleted;

  TaskModel({
    required this.taskTitle,
    required this.timeStamp,
    this.deadline,
    this.completedOn,
    this.isCompleted = false,
  });

  void toggleTaskStatus() {
    isCompleted = true;
    notifyListeners();
    DBHelper.markTaskAsComplete(timeStamp.toIso8601String());
  }
}
