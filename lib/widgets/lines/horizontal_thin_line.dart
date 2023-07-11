import 'package:flutter/material.dart';

class HorizontalThinLine extends StatelessWidget {
  final EdgeInsetsGeometry verticalMargin;

  const HorizontalThinLine({
    super.key,
    this.verticalMargin = const EdgeInsets.symmetric(horizontal: 8),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: verticalMargin,
      height: 0.2,
      width: double.infinity,
      color: Colors.black,
    );
  }
}
