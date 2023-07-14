import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:polkatalk/functions/show_date_time_picker.dart';
import 'package:polkatalk/widgets/buttons/colored_btn.dart';
import 'package:polkatalk/widgets/lines/horizontal_thin_line.dart';

class DateRangeSelector extends StatefulWidget {
  final Function startDateCallbackFunction;
  final Function endDateCallbackFunction;

  const DateRangeSelector({
    super.key,
    required this.startDateCallbackFunction,
    required this.endDateCallbackFunction,
  });

  @override
  State<DateRangeSelector> createState() => _DateRangeSelectorState();
}

class _DateRangeSelectorState extends State<DateRangeSelector> {
  DateTime? startDateTime;
  DateTime? endDateTime;

  Future<void> _selectStartDateTime(BuildContext context) async {
    final DateTime? selectedDateTime = await selectDateTime(context);

    if (selectedDateTime != null) {
      setState(() {
        if (endDateTime != null && selectedDateTime.isAfter(endDateTime!)) {
          endDateTime = null;
        }

        startDateTime = selectedDateTime;
        widget.startDateCallbackFunction(selectedDateTime);
      });
    }
  }

  Future<void> _selectEndDateTime(BuildContext context) async {
    final DateTime? selectedDateTime = await selectDateTime(context);

    if (selectedDateTime != null) {
      setState(() {
        if (startDateTime != null &&
            selectedDateTime.isBefore(startDateTime!)) {
          startDateTime = null;
        }

        endDateTime = selectedDateTime;
        widget.endDateCallbackFunction(selectedDateTime);
      });
    }
  }

  final dateFormat = DateFormat.yMMMMd().add_Hm();

  ColoredButton buildDateTimeSelector(Function callbackFunction, String label) {
    return ColoredButton(
      width: 320,
      verticalPadding: 24,
      callbackFunction: () {
        callbackFunction(context);
      },
      text: startDateTime == null
          ? label
          : '$label ~ ${dateFormat.format(startDateTime!)}',
      textColor: Colors.white,
      buttonColor: Colors.black,
      splashColor: const Color.fromARGB(255, 112, 112, 112),
      borderColor: Colors.black,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        buildDateTimeSelector(_selectStartDateTime, 'Start'),
        const HorizontalThinLine(
          verticalMargin: 6,
          lineColor: Colors.white,
        ),
        buildDateTimeSelector(_selectEndDateTime, 'End'),
      ],
    );
  }
}
