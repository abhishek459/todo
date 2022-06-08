import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:to_do/widgets/custom_scaffold.dart';

import './tasks_listview.dart';
import './task_input_field.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      appBarTitle: DateFormat('EEE, d MMM').format(DateTime.now()),
      body: Stack(
        children: const [
          TasksList(),
          Positioned(
            left: 0,
            right: 0,
            bottom: 10,
            child: TaskInputTextField(),
          ),
        ],
      ),
    );
  }
}
