import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';

class Calendar extends StatefulWidget {
  const Calendar({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  List<DateTime?> _selectedDates = [DateTime.now()];
  List<DateTime?>? selectADate;
  bool showCalendar = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: showCalendar ? _buildDatePickerWidget() : _buildSelectDateButton(),
      ),
    );
  }

  void _handleDateSelection(List<DateTime?> selectedDates) {
    setState(() {
      selectADate = _selectedDates;
      _selectedDates = selectedDates;
      showCalendar = false; // Hide the calendar after a date is selected
    });
  }

  Widget _buildSelectDateButton() {
    return GestureDetector(
      onTap: () {
        setState(() {
          showCalendar = true;
        });
      },
      child: selectADate == null ?
      Text(
          "Select your date of birth",
        style: TextStyle(
            fontSize: 20.0
        ),
      ) : Text(
          "${_buildSelectedDates()}",
        style: TextStyle(
          fontSize: 20.0
        ),
      ),
    );
  }

  Widget _buildDatePickerWidget() {
    return Column(
      children: [
        CalendarDatePicker2(
          config: CalendarDatePicker2Config(
            // Configure your calendar here
          ),
          value: _selectedDates,
          onValueChanged: _handleDateSelection,
        ),
      ],
    );
  }

  String _buildSelectedDates() {
    return _selectedDates.map((date) => date?.toString().substring(0, 10) ?? 'null').join(', ');
  }
}
