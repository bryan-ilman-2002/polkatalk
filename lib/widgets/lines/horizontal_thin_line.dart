import 'package:flutter/material.dart';

class HorizontalThinLine extends StatelessWidget {
  final double horizontalMargin;
  final double verticalMargin;
  final Color lineColor;

  const HorizontalThinLine({
    super.key,
    this.horizontalMargin = 8,
    this.verticalMargin = 0,
    this.lineColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: horizontalMargin,
        vertical: verticalMargin,
      ),
      width: double.infinity,
      height: 0.2,
      color: lineColor,
    );
  }
}
