import 'package:flutter/material.dart';

class HorizontalThinLine extends StatelessWidget {
  final EdgeInsetsGeometry margin;

  const HorizontalThinLine({
    super.key,
    this.margin = const EdgeInsets.symmetric(horizontal: 8),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      height: 0.2,
      width: double.infinity,
      color: Colors.black,
    );
  }
}
