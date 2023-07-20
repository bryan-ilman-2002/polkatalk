import 'package:flutter/material.dart';

class TextWithBackground extends StatelessWidget {
  final Color backgroundColor;
  final String text;
  final double? textSize;
  final FontWeight? textWeight;
  final Color? textColor;
  final EdgeInsetsGeometry? padding;
  final BorderRadiusGeometry? borderRadius;
  final BoxShadow? boxShadow;

  const TextWithBackground({
    super.key,
    required this.backgroundColor,
    required this.text,
    this.textSize,
    this.textWeight,
    this.textColor,
    this.padding,
    this.borderRadius,
    this.boxShadow,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: borderRadius ?? BorderRadius.circular(8),
        boxShadow: boxShadow != null ? [boxShadow!] : [],
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: textSize,
          fontWeight: textWeight ?? FontWeight.bold,
          color: textColor ?? Colors.white,
        ),
      ),
    );
  }
}
