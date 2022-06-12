import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TestPickerWidget extends StatefulWidget {
  const TestPickerWidget({Key? key}) : super(key: key);

  @override
  MyDatePicker createState() => MyDatePicker();
}

class MyDatePicker extends State<TestPickerWidget> {
  DateTime? _selectedDate;
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.4,
      child: TextField(
        focusNode: AlwaysDisabledFocusNode(),
        controller: _textEditingController,
        onTap: () {
          _selectDate(context);
        },
      ),
    );
  }

  _selectDate(BuildContext context) async {
    DateTime? newSelectedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2040),
    );

    if (newSelectedDate != null) {
      _selectedDate = newSelectedDate;
      _textEditingController
        ..text = DateFormat.yMMMd().format(_selectedDate!)
        ..selection = TextSelection.fromPosition(
          TextPosition(
              offset: _textEditingController.text.length,
              affinity: TextAffinity.upstream),
        );
    }
  }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}
