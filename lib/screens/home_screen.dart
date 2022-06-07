import 'package:flutter/material.dart';
import 'package:to_do/widgets/custom_textfield.dart';

import '../views/tasks_list.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To Do'),
      ),
      body: Stack(
        children: const [
          TasksList(),
          Positioned(
            left: 10,
            right: 10,
            bottom: 10,
            child: TaskInputTextField(),
          ),
        ],
      ),
    );
  }
}
