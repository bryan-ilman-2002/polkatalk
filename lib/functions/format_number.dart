import 'package:intl/intl.dart';

String formatNumberWithLocalizedSeparators(double number) {
  final formatter = NumberFormat("#,###", Intl.defaultLocale);
  return formatter.format(number);
}
