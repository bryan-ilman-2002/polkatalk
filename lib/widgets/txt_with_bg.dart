import 'package:flutter/material.dart';

class TextWithBackground extends StatelessWidget {
  final String text;
  final Color varColor;

  const TextWithBackground(
      {super.key, required this.text, required this.varColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: varColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}
