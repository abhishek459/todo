import 'package:flutter/material.dart';

class MyScaffold extends StatelessWidget {
  final String appBarTitle;
  final Widget body;
  const MyScaffold({
    Key? key,
    required this.appBarTitle,
    required this.body,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle),
        centerTitle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: body,
      ),
    );
  }
}
