import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do/utils/date_formatter.dart';

import '../../models/task_model.dart';
import '../../providers/task_provider.dart';

class TasksList extends StatelessWidget {
  const TasksList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<TaskModel> listOfTasks = Provider.of<TaskProvider>(context).getTasks;
    return ListView.builder(
      itemCount: listOfTasks.length,
      itemBuilder: (context, index) => ChangeNotifierProvider.value(
        value: listOfTasks[index],
        child: const TaskItem(),
      ),
    );
  }
}

class TaskItem extends StatelessWidget {
  const TaskItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final taskItem = Provider.of<TaskModel>(context, listen: false);
    return ListTile(
      title: Consumer<TaskModel>(
        builder: (context, value, _) => Text(
          taskItem.taskTitle,
          style: textStyle(taskItem.isCompleted),
        ),
      ),
      subtitle: Text(
        dateFormatter(taskItem.timeStamp),
      ),
      trailing: Consumer<TaskModel>(
        builder: (context, value, child) => (taskItem.isCompleted)
            ? const CircleAvatar(
                backgroundColor: Colors.green,
                child: Icon(
                  Icons.check,
                  color: Colors.white,
                ),
              )
            : CircleAvatar(
                backgroundColor: Colors.transparent,
                child: IconButton(
                  icon: const Icon(
                    Icons.check,
                    color: Colors.green,
                  ),
                  onPressed: taskItem.toggleTaskStatus,
                  splashRadius: 25,
                ),
              ),
      ),
    );
  }
}

TextStyle textStyle(bool taskStatus) {
  if (!taskStatus) {
    return const TextStyle(
      fontFamily: 'NotoSans',
      fontSize: 20,
    );
  } else {
    return const TextStyle(
      fontFamily: 'NotoSans',
      fontSize: 20,
      decoration: TextDecoration.lineThrough,
      fontWeight: FontWeight.w300,
    );
  }
}
