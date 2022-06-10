import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../widgets/custom_scaffold.dart';
import '../tasks/all_tasks_list.dart';
import './todays_task_list.dart';
import './task_input_field.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController();

  int _activePage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  List<String> appBarTitles = [
    DateFormat('EEE, MMM d').format(DateTime.now()),
    'Summary'
  ];

  List<Widget> tabs = const [
    TodaysTasks(),
    AllTasksList(),
  ];

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      appBarTitle: appBarTitles[_activePage],
      body: tabs[_activePage],
      bottomNavigationBar: BottomNavigationBar(
        selectedIconTheme: const IconThemeData(size: 35),
        selectedFontSize: 0,
        currentIndex: _activePage,
        onTap: (index) {
          setState(() {
            _activePage = index;
          });
        },
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
              icon: const Icon(Icons.task),
              label: 'Today',
              backgroundColor: Theme.of(context).hintColor),
          BottomNavigationBarItem(
            icon: const Icon(Icons.history),
            label: 'History',
            backgroundColor: Theme.of(context).hintColor,
          ),
        ],
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
