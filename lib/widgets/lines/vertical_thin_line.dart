import 'package:flutter/material.dart';

class VerticalThinLine extends StatelessWidget {
  final double height;

  const VerticalThinLine({
    super.key,
    this.height = 40,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: 1.2,
      color: Colors.grey,
    );
  }
}
