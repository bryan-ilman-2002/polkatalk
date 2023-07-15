import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:polkatalk/enums/date_range.dart';
import 'package:polkatalk/functions/show_date_time_picker.dart';

class DateRangeFilterStateNotifier
    extends StateNotifier<Map<DateRange, DateTime?>> {
  DateRangeFilterStateNotifier()
      : super({DateRange.startDate: null, DateRange.endDate: null});

  Future<void> selectStartDate(BuildContext context) async {
    final DateTime? selectedDate = await selectDateTime(context);

    if (selectedDate != null) {
      if (state[DateRange.endDate] != null &&
          selectedDate.isAfter(state[DateRange.endDate]!)) {
        state[DateRange.endDate] = null;
      }

      state[DateRange.startDate] = selectedDate;
    }
  }

  Future<void> selectEndDate(BuildContext context) async {
    final DateTime? selectedDate = await selectDateTime(context);

    if (selectedDate != null) {
      if (state[DateRange.startDate] != null &&
          selectedDate.isBefore(state[DateRange.startDate]!)) {
        state[DateRange.startDate] = null;
      }

      state[DateRange.endDate] = selectedDate;
    }
  }

  void resetDateRange() {
    state = {
      DateRange.startDate: null,
      DateRange.endDate: null,
    };
  }
}

final dateRangeFilterStateNotifierProvider = StateNotifierProvider<
    DateRangeFilterStateNotifier, Map<DateRange, DateTime?>>(
  (ref) => DateRangeFilterStateNotifier(),
);

final dateRangeFilterState = Provider((ref) {
  return ref.watch(dateRangeFilterStateNotifierProvider);
});

final setStartDateFilterState = Provider((ref) {
  return ref
      .read(dateRangeFilterStateNotifierProvider.notifier)
      .selectStartDate;
});

final setEndDateFilterState = Provider((ref) {
  return ref.read(dateRangeFilterStateNotifierProvider.notifier).selectEndDate;
});

final resetDateRangeFilterState = Provider((ref) {
  return ref.read(dateRangeFilterStateNotifierProvider.notifier).resetDateRange;
});
