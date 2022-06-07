import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import '../../models/task_model.dart';
import '../../providers/task_provider.dart';

class TasksList extends StatelessWidget {
  const TasksList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<TaskModel> listOfTasks = Provider.of<TaskProvider>(context).getTasks;
    return ListView.builder(
      itemCount: listOfTasks.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: (listOfTasks[index].isCompleted)
              ? const CompletedTaskIcon()
              : const IncompleteTaskIcon(),
          title: Text(
            listOfTasks[index].taskTitle,
            style: const TextStyle(
              decoration: TextDecoration.lineThrough,
              color: Colors.black54,
            ),
          ),
          subtitle: Text(
            DateFormat('d-MMM-yyyy hh:mm a')
                .format(listOfTasks[index].timeStamp),
          ),
          trailing: (listOfTasks[index].isCompleted)
              ? null
              : IconButton(
                  icon: const Icon(
                    Icons.check_circle,
                    color: Colors.green,
                  ),
                  onPressed: () {},
                  splashRadius: 25,
                ),
        );
      },
    );
  }
}

class IncompleteTaskIcon extends StatelessWidget {
  const IncompleteTaskIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      backgroundColor: Colors.orange,
      child: Icon(
        Icons.timer,
        color: Colors.white,
      ),
    );
  }
}

class CompletedTaskIcon extends StatelessWidget {
  const CompletedTaskIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      backgroundColor: Colors.green,
      child: Icon(
        Icons.check,
        color: Colors.white,
      ),
    );
  }
}
