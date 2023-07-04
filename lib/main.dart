import 'package:flutter/material.dart';

import 'pages/search_page.dart';

void main() {
  runApp(const PolkaTalk());
}

class PolkaTalk extends StatelessWidget {
  const PolkaTalk({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PolkaTalk',
      theme: ThemeData(
        splashFactory: InkRipple.splashFactory,
        primarySwatch: Colors.grey,
      ),
      home: const SearchPage(),
    );
  }
}
