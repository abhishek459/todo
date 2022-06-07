import 'package:flutter/material.dart';

import './tasks_listview.dart';
import './task_input_field.dart';

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
