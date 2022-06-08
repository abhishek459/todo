import 'package:flutter/cupertino.dart';

class TaskModel with ChangeNotifier {
  final String taskTitle;
  final DateTime timeStamp;
  bool isCompleted;

  TaskModel({
    required this.taskTitle,
    required this.timeStamp,
    this.isCompleted = false,
  });

  void toggleTaskStatus() {
    isCompleted = true;
    notifyListeners();
  }
}
