import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:polkatalk/functions/getters/app_colors.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarContainer extends ConsumerStatefulWidget {
  const CalendarContainer({super.key});

  @override
  ConsumerState<CalendarContainer> createState() => _CalendarContainerState();
}

class _CalendarContainerState extends ConsumerState<CalendarContainer> {
  final CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime? _selectedStartDate;
  DateTime? _selectedEndDate;

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      calendarFormat: _calendarFormat,
      headerStyle: const HeaderStyle(
        leftChevronIcon: Icon(
          Icons.chevron_left,
        ),
        rightChevronIcon: Icon(
          Icons.chevron_right,
        ),
        titleTextStyle: TextStyle(
          fontSize: 16,
        ),
        formatButtonVisible: false,
      ),
      focusedDay: DateTime.now(),
      daysOfWeekStyle: const DaysOfWeekStyle(
        weekdayStyle: TextStyle(),
        weekendStyle: TextStyle(
          color: Colors.red,
        ),
      ),
      calendarStyle: CalendarStyle(
        defaultTextStyle: const TextStyle(),
        weekendTextStyle: const TextStyle(),
        disabledTextStyle: TextStyle(
          color: lightGray,
        ),
      ),
      firstDay: DateTime.now(),
      lastDay: DateTime.now().add(
        const Duration(
          days: 30,
        ),
      ),
      selectedDayPredicate: (day) =>
          day == _selectedStartDate || day == _selectedEndDate,
      calendarBuilders: CalendarBuilders(
        todayBuilder: (context, day, focusedDay) {
          return Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: tinyGray,
            ),
            child: Text(
              day.day.toString(),
              style: TextStyle(
                color: moderateGray,
              ),
            ),
          );
        },
        selectedBuilder: (context, date, events) {
          return Stack(
            alignment: Alignment.center,
            children: [
              Container(
                margin: date == _selectedStartDate
                    ? const EdgeInsets.only(left: 2)
                    : const EdgeInsets.only(right: 2),
                decoration: BoxDecoration(
                  color: lightBlue,
                  borderRadius: date == _selectedStartDate
                      ? const BorderRadius.only(
                          topLeft: Radius.circular(128),
                          bottomLeft: Radius.circular(128),
                        )
                      : const BorderRadius.only(
                          topRight: Radius.circular(128),
                          bottomRight: Radius.circular(128),
                        ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: moderateBlue,
                ),
                child: Text(
                  date.day.toString(),
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ],
          );
        },
        rangeHighlightBuilder: (context, date, events) {
          if (_selectedStartDate == null || _selectedEndDate == null) {
            return Container();
          }

          if (date.isAfter(_selectedStartDate!) &&
              date.isBefore(_selectedEndDate!)) {
            return Container(
              decoration: BoxDecoration(
                color: lightBlue,
              ),
            );
          }

          return Container();
        },
      ),
      onDaySelected: (selectedDay, focusedDay) {
        setState(() {
          if (_selectedStartDate == null && _selectedEndDate == null) {
            _selectedStartDate = selectedDay;
            _selectedEndDate = selectedDay;
          } else if (selectedDay.isBefore(_selectedEndDate!)) {
            _selectedStartDate = selectedDay;
          } else if (selectedDay.isAfter(_selectedStartDate!)) {
            _selectedEndDate = selectedDay;
          }
        });
      },
    );
  }
}
