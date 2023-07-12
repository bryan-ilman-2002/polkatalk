import 'package:flutter/material.dart';
import 'package:polkatalk/widgets/buttons/colored_btn.dart';

class FilterHeading extends StatelessWidget {
  final String title;
  final Function resetMechanism;

  const FilterHeading({
    super.key,
    required this.title,
    required this.resetMechanism,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 22,
          ),
        ),
        ColoredButton(
          width: 72,
          verticalPadding: 8,
          callbackFunction: resetMechanism,
          text: 'reset',
          textWeight: FontWeight.bold,
          borderRadius: 128,
          borderColor: Colors.black,
        )
      ],
    );
  }
}
