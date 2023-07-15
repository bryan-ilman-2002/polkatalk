enum DateRange {
  startDate,
  endDate,
}

extension DateRangeExtension on DateRange {
  String get string {
    switch (this) {
      case DateRange.startDate:
        return 'Start Date';
      case DateRange.endDate:
        return 'End Date';
      default:
        return '';
    }
  }
}
