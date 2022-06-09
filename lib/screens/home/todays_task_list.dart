import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/task_model.dart';
import '../../providers/task_provider.dart';
import '../../utils/date_methods.dart';

class TasksList extends StatelessWidget {
  const TasksList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<TaskModel> listOfTasks =
        Provider.of<TaskProvider>(context).getTasks.reversed.toList();
    return FutureBuilder(
      future: Provider.of<TaskProvider>(context, listen: false)
          .fetchAndSetTodaysTasks(),
      builder: (context, snapshot) => (snapshot.connectionState ==
              ConnectionState.waiting)
          ? ListView.builder(
              physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              itemCount: listOfTasks.length,
              itemBuilder: (context, index) => ChangeNotifierProvider.value(
                key: ValueKey(listOfTasks[index].timeStamp.toIso8601String()),
                value: listOfTasks[index],
                child: const TaskItem(),
              ),
            )
          : const Center(child: CircularProgressIndicator()),
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
        builder: (context, value, _) => TaskTitle(taskItem: taskItem),
      ),
      subtitle: Text(
        DateMethods.dateFormatter(taskItem.timeStamp),
      ),
      trailing: Consumer<TaskModel>(
          builder: (context, value, child) => TrailingIcon(taskItem: taskItem)),
    );
  }
}

class TaskTitle extends StatelessWidget {
  final TaskModel taskItem;
  const TaskTitle({Key? key, required this.taskItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (!taskItem.isCompleted) {
      return Text(
        taskItem.taskTitle,
        style: const TextStyle(
          fontFamily: 'NotoSans',
          fontSize: 20,
        ),
      );
    } else {
      return Text(
        taskItem.taskTitle,
        style: const TextStyle(
          fontFamily: 'NotoSans',
          fontSize: 20,
          decoration: TextDecoration.lineThrough,
          fontWeight: FontWeight.w300,
        ),
      );
    }
  }
}

class TrailingIcon extends StatelessWidget {
  final TaskModel taskItem;
  const TrailingIcon({Key? key, required this.taskItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Image taskCompleteIcon = Image.asset('lib/assets/icons/check.png');
    if (taskItem.isCompleted) {
      return SizedBox(
        height: 40,
        child: taskCompleteIcon,
      );
    } else {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            borderRadius: BorderRadius.circular(20),
            onTap: taskItem.toggleTaskStatus,
            child: const Icon(
              Icons.check,
              color: Colors.green,
              size: 35,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          InkWell(
            borderRadius: BorderRadius.circular(20),
            onTap: () =>
                deleteTask(context, taskItem.timeStamp.toIso8601String()),
            child: const Icon(
              Icons.delete,
              color: Colors.red,
              size: 35,
            ),
          ),
        ],
      );
    }
  }

  void deleteTask(BuildContext context, String taskId) {
    Provider.of<TaskProvider>(context, listen: false).deleteTask(taskId);
  }
}