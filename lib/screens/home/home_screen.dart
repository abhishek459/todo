import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'todays_task_list.dart';
import './task_input_field.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(DateFormat('EEE, MMM d').format(DateTime.now())),
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.home),
                text: 'Home',
              ),
              Tab(
                icon: Icon(Icons.history),
                text: 'History',
              ),
            ],
          ),
        ),
        body: const Padding(
          padding: EdgeInsets.all(8.0),
          child: TabBarView(
            physics:
                BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            children: [
              TodaysTasks(),
              HistoryOfTasks(),
            ],
          ),
        ),
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
        Flexible(child: TasksList()),
        TaskInputTextField(),
      ],
    );
  }
}

class HistoryOfTasks extends StatelessWidget {
  const HistoryOfTasks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('History of Tasks',
          style: TextStyle(
            color: Theme.of(context).hintColor,
          )),
    );
  }
}
