import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:polkatalk/widgets/page_swapper.dart';

void main() {
  runApp(const ProviderScope(child: PolkaTalk()));
}

class PolkaTalk extends StatelessWidget {
  const PolkaTalk({super.key});

  final TextTheme mukta = const TextTheme(
    bodyMedium: TextStyle(
      fontFamily: 'Mukta',
      fontSize: 14,
      fontWeight: FontWeight.normal,
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
      home: const PageSwapper(),
    );
  }
}
