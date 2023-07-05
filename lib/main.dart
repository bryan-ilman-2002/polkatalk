import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'pages/search_page.dart';

void main() {
  runApp(const PolkaTalk());
}

class PolkaTalk extends StatelessWidget {
  const PolkaTalk({super.key});

  final TextTheme mukta = const TextTheme(
    bodyMedium: TextStyle(
      fontFamily: 'Mukta',
      fontSize: 14,
      fontWeight: FontWeight.normal,
      fontStyle: FontStyle.normal,
    ),
  );

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));

    return MaterialApp(
      title: 'PolkaTalk',
      theme: ThemeData(
        splashFactory: InkRipple.splashFactory,
        textTheme: mukta,
      ),
      home: const SearchPage(),
    );
  }
}
