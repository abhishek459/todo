import 'package:flutter/material.dart';

import './deadline_setter.dart';
import './services/task_input_methods.dart';
import './task_text_field.dart';

class TaskInputForm extends StatefulWidget {
  const TaskInputForm({Key? key}) : super(key: key);

  @override
  State<TaskInputForm> createState() => _TaskInputFormState();
}

class _TaskInputFormState extends State<TaskInputForm> {
  final TextEditingController _taskController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  @override
  void dispose() {
    _taskController.dispose();
    _dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const Widget verticalPadding = VerticalPadding();
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      padding: EdgeInsets.only(
        left: 20,
        right: 20,
        top: 20,
        bottom: 20 + MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          TaskInputField(
            hintText: 'Type a task here...',
            controller: _taskController,
          ),
          verticalPadding,
          const Align(
            alignment: Alignment.center,
            child: Text(
              'Add a deadline (Optional)',
              style: TextStyle(fontSize: 22),
            ),
          ),
          verticalPadding,
          const DeadlineSetter(),
          verticalPadding,
          Align(
            alignment: Alignment.center,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(40, 40),
                shape: const CircleBorder(),
              ),
              onPressed: () => {
                TaskMethods.addTask(context, _taskController),
                finishingUp(),
              },
              child: const Icon(Icons.check),
            ),
          )
        ],
      ),
    );
  }

  void finishingUp() {
    _taskController.clear();
    FocusScope.of(context).unfocus();
    Navigator.of(context).pop();
  }
}

class VerticalPadding extends StatelessWidget {
  const VerticalPadding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(height: 10);
  }
}
