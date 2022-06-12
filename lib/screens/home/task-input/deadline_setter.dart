import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DeadlineSetter extends StatefulWidget {
  const DeadlineSetter({Key? key}) : super(key: key);

  @override
  State<DeadlineSetter> createState() => _DeadlineSetterState();
}

class _DeadlineSetterState extends State<DeadlineSetter> {
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();

  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  @override
  void dispose() {
    _dateController.dispose();
    _timeController.dispose();
    super.dispose();
  }

  void pickDate() async {
    await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2099),
    ).then((value) => {
          if (value != null)
            {
              setState(() {
                _dateController.text = DateFormat('dd-MMM-yyyy').format(value);
              }),
            }
        });
  }

  void pickTime() async {
    await showTimePicker(
      context: context,
      initialTime: const TimeOfDay(hour: 00, minute: 00),
    ).then((value) {
      if (value != null) {
        setState(() {
          _timeController.text =
              MaterialLocalizations.of(context).formatTimeOfDay(value);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        TimeInputField(
          controller: _dateController,
          title: 'Date',
          hintText: 'Pick Date',
          onTap: pickDate,
        ),
        const SizedBox(width: 30),
        TimeInputField(
          controller: _timeController,
          title: 'Time',
          hintText: 'Pick Time',
          onTap: pickTime,
        ),
      ],
    );
  }
}

class TimeInputField extends StatelessWidget {
  final String title;
  final String hintText;
  final TextEditingController controller;
  final void Function()? onTap;
  const TimeInputField({
    Key? key,
    required this.title,
    required this.hintText,
    required this.controller,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 20, color: Theme.of(context).hintColor),
        ),
        SizedBox(
          width: 150,
          child: TextField(
            controller: controller,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              suffixIconColor: Theme.of(context).hintColor,
              hintText: hintText,
              filled: true,
            ),
            readOnly: true,
            onTap: onTap,
          ),
        ),
      ],
    );
  }
}
