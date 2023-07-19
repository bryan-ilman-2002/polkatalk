import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:polkatalk/enums/date_range.dart';
import 'package:polkatalk/functions/getters/app_colors.dart';
import 'package:polkatalk/functions/getters/heavy_shadow.dart';
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
        buttonColor: Colors.white,
        basicBorderRadius: 12,
        borderColor: Colors.transparent,
        buttonShadow: heavyShadow,
        child: Text(
          label == DateRange.startDate
              ? selectedDateRange[DateRange.startDate] == null
                  ? label.string
                  : '${label.string} ~ ${dateFormat.format(selectedDateRange[DateRange.startDate]!)}'
              : selectedDateRange[DateRange.endDate] == null
                  ? label.string
                  : '${label.string} ~ ${dateFormat.format(selectedDateRange[DateRange.endDate]!)}',
          style: TextStyle(
            color: moderateGray,
          ),
        ),
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
          height: 16,
        ),
        buildDateTimeSelector(
          ref.watch(setEndDateFilterState),
          DateRange.endDate,
        ),
      ],
    );
  }
}
