import 'package:flutter/material.dart';
import 'package:polkatalk/functions/getters/app_colors.dart';
import 'package:polkatalk/widgets/lines/horizontal_thin_line.dart';

class FilterBox extends StatelessWidget {
  final String title;
  final Widget child;
  final bool thisIsLast;

  const FilterBox({
    super.key,
    required this.title,
    required this.child,
    this.thisIsLast = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 32,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 18,
                      color: heavyGray,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              child,
            ],
          ),
        ),
        thisIsLast
            ? const SizedBox()
            : const HorizontalThinLine(
                horizontalMargin: 20,
              ),
      ],
    );
  }
}
