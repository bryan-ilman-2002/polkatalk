import 'package:flutter/material.dart';

class TextWithBackground extends StatelessWidget {
  final String text;
  final double textSize;
  final FontWeight textWeight;
  final Color textColor;
  final Color backgroundColor;
  final EdgeInsetsGeometry padding;
  final double borderRadius;

  const TextWithBackground({
    super.key,
    required this.text,
    this.textSize = 14,
    this.textWeight = FontWeight.bold,
    this.textColor = Colors.white,
    this.backgroundColor = Colors.green,
    this.padding = const EdgeInsets.all(6),
    this.borderRadius = 10,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: textSize,
          fontWeight: textWeight,
          color: textColor,
        ),
      ),
    );
  }
}
