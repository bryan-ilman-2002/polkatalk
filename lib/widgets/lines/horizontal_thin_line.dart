import 'package:flutter/material.dart';

class HorizontalThinLine extends StatelessWidget {
  final double width;
  final double horizontalMargin;
  final double verticalMargin;
  final double height;
  final Color lineColor;

  const HorizontalThinLine({
    super.key,
    this.width = double.infinity,
    this.horizontalMargin = 8,
    this.verticalMargin = 0,
    this.height = 0.2,
    this.lineColor = const Color.fromRGBO(
        64, 64, 64, 4), // this is heavyGray from app_colors.dart
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: horizontalMargin,
        vertical: verticalMargin,
      ),
      width: width,
      height: height,
      color: lineColor,
    );
  }
}
