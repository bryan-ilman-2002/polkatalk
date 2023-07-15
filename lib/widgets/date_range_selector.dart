import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:polkatalk/enums/date_range.dart';
import 'package:polkatalk/functions/providers/date_range_filter_state.dart';
import 'package:polkatalk/widgets/buttons/colored_btn.dart';

class DateRangeSelector extends ConsumerStatefulWidget {
  const DateRangeSelector({super.key});

  @override
  ConsumerState<DateRangeSelector> createState() => _DateRangeSelectorState();
}

class _DateRangeSelectorState extends ConsumerState<DateRangeSelector> {
  final dateFormat = DateFormat.yMMMMd().add_Hm();

  @override
  Widget build(BuildContext context) {
    Map<DateRange, DateTime?> selectedDateRange =
        ref.watch(dateRangeFilterState);

    ColoredButton buildDateTimeSelector(
      Function callbackFunction,
      DateRange label,
    ) {
      return ColoredButton(
        width: 320,
        verticalPadding: 24,
        callbackFunction: () async {
          await callbackFunction(context);
          setState(() {});
        },
        text: label == DateRange.startDate
            ? selectedDateRange[DateRange.startDate] == null
                ? label.string
                : '${label.string} ~ ${dateFormat.format(selectedDateRange[DateRange.startDate]!)}'
            : selectedDateRange[DateRange.endDate] == null
                ? label.string
                : '${label.string} ~ ${dateFormat.format(selectedDateRange[DateRange.endDate]!)}',
        textColor: Colors.white,
        buttonColor: Colors.black,
        splashColor: const Color.fromARGB(255, 112, 112, 112),
        borderColor: Colors.black,
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        buildDateTimeSelector(
          ref.watch(setStartDateFilterState),
          DateRange.startDate,
        ),
        const SizedBox(
          height: 12,
        ),
        buildDateTimeSelector(
          ref.watch(setEndDateFilterState),
          DateRange.endDate,
        ),
      ],
    );
  }
}
