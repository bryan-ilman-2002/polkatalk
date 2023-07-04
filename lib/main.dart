import 'package:flutter/material.dart';

import 'pages/search_page.dart';

void main() {
  runApp(const PolkaTalk());
}

class PolkaTalk extends StatelessWidget {
  const PolkaTalk({super.key});

  final TextTheme basicMukta = const TextTheme(
    bodyMedium: TextStyle(
      fontFamily: 'Mukta',
      fontSize: 14,
      fontWeight: FontWeight.normal,
      fontStyle: FontStyle.normal,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PolkaTalk',
      theme: ThemeData(
        splashFactory: InkRipple.splashFactory,
        primarySwatch: Colors.grey,
        textTheme: basicMukta,
      ),
      home: const SearchPage(),
    );
  }
}
