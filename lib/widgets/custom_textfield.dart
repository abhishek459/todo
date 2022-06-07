import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:to_do/models/task_model.dart';
import 'package:to_do/providers/task_provider.dart';

class TaskInputTextField extends StatefulWidget {
  const TaskInputTextField({Key? key}) : super(key: key);

  @override
  State<TaskInputTextField> createState() => _TaskInputTextFieldState();
}

class _TaskInputTextFieldState extends State<TaskInputTextField> {
  final TextEditingController _taskController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    void addTask() {
      FocusScope.of(context).unfocus();
      TaskModel taskData =
          TaskModel(taskTitle: _taskController.text, timeStamp: DateTime.now());
      Provider.of<TaskProvider>(context, listen: false).addTask(taskData);
    }

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
          hintText: 'Add a task!',
          suffixIcon: IconButton(
            icon: const Icon(
              Icons.check_circle,
              color: Colors.green,
            ),
            onPressed: addTask,
          ),
        ),
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9]'))
        ],
        textInputAction: TextInputAction.done,
        controller: _taskController,
        onEditingComplete: addTask,
      ),
    );
  }
}
