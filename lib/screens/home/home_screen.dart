import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import './todays_task_list.dart';
import './task_input_field.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(DateFormat('EEE, MMM d').format(DateTime.now())),
      ),
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: TodaysTasks(),
      ),
    );
  }
}

class TodaysTasks extends StatelessWidget {
  const TodaysTasks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Flexible(child: TodaysTasksList()),
        TaskInputTextField(),
      ],
    );
  }
}
