import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:polkatalk/functions/getters/app_colors.dart';
import 'package:polkatalk/widgets/page_swapper.dart';

void main() {
  runApp(
    ProviderScope(
      child: PolkaTalk(),
    ),
  );
}

class PolkaTalk extends StatelessWidget {
  PolkaTalk({super.key});

  final TextTheme mukta = TextTheme(
    bodyMedium: TextStyle(
      overflow: TextOverflow.ellipsis,
      fontFamily: 'Mukta',
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: moderateGray,
    ),
  );

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );

    return MaterialApp(
      title: 'PolkaTalk',
      theme: ThemeData(
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: primaryAppColor,
        ),
        textTheme: mukta,
        iconTheme: IconThemeData(
          size: 30,
          color: lightGray,
        ),
        splashFactory: InkRipple.splashFactory,
      ),
      home: const PageSwapper(),
    );
  }
}
