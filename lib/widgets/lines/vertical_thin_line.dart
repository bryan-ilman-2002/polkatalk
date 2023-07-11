import 'package:flutter/material.dart';

class VerticalThinLine extends StatelessWidget {
  final Color lineColor;
  final double height;

  const VerticalThinLine({
    super.key,
    this.lineColor = Colors.grey,
    this.height = 40,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: 1.2,
      color: lineColor,
    );
  }
}
