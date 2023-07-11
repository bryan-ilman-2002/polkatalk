import 'package:intl/intl.dart';

String get currentDateExtended {
  DateTime now = DateTime.now();
  DateFormat formatter = DateFormat('dd/MM/yy HH:mm');
  return formatter.format(now);
}

String get currentDateShrunk {
  DateTime now = DateTime.now();
  String? locale = Intl.defaultLocale;
  DateFormat formatter =
      locale != null ? DateFormat.yMMMMd(locale) : DateFormat.yMMMMd('en_US');
  return formatter.format(now);
}
