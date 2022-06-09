import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './providers/task_provider.dart';

import './assets/theme/dark_theme.dart';
import './assets/theme/light_theme.dart';
import './screens/home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskProvider(),
      child: MaterialApp(
        title: 'To Do',
        theme: lightTheme(),
        darkTheme: darkTheme(),
        themeMode: ThemeMode.system,
        home: const HomeScreen(),
      ),
    );
  }
}
