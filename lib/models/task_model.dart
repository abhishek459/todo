class TaskModel {
  final String taskTitle;
  final DateTime timeStamp;
  final bool isCompleted;

  TaskModel({
    required this.taskTitle,
    required this.timeStamp,
    this.isCompleted = false,
  });
}
