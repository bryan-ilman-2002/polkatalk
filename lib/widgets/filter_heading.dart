import 'package:flutter/material.dart';
import 'package:polkatalk/widgets/buttons/colored_btn.dart';

class FilterHeading extends StatelessWidget {
  final String title;
  final Function? resetMechanism;

  const FilterHeading({
    super.key,
    required this.title,
    this.resetMechanism,
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
          verticalPadding: 10,
          callbackFunction: resetMechanism,
          text: 'Reset',
          basicBorderRadius: 8,
          borderColor: Colors.black,
        ),
      ],
    );
  }
}
