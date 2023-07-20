import 'package:flutter/material.dart';

class VerticalThinLine extends StatelessWidget {
  final double height;
  final Color lineColor;

  const VerticalThinLine({
    super.key,
    this.height = 40,
    required this.lineColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.2,
      height: height,
      color: lineColor,
    );
  }
}
