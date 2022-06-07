import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:to_do/models/task_model.dart';
import 'package:to_do/providers/task_provider.dart';

class TasksList extends StatelessWidget {
  const TasksList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<TaskModel> listOfTasks = Provider.of<TaskProvider>(context).getTasks;
    return ListView.builder(
      itemCount: listOfTasks.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(
            listOfTasks[index].taskTitle,
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
          subtitle: Text(listOfTasks[index].timeStamp.toString()),
        );
      },
    );
  }
}
