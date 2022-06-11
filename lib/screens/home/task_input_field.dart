import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TaskInputTextField extends StatelessWidget {
  final TextEditingController controller;
  final Function()? onEditingComplete;
  const TaskInputTextField(
      {Key? key, required this.controller, required this.onEditingComplete})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: true,
      decoration: const InputDecoration(
        hintText: 'Add a task...',
        counterText: "",
      ),
      style: Theme.of(context).textTheme.displayMedium,
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9 !,.]'))
      ],
      textInputAction: TextInputAction.done,
      textCapitalization: TextCapitalization.sentences,
      controller: controller,
      onEditingComplete: onEditingComplete,
      maxLength: 100,
    );
  }
}
