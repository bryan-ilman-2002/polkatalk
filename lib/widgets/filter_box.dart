import 'package:flutter/material.dart';
import 'package:polkatalk/functions/getters/app_colors.dart';

class FilterBox extends StatelessWidget {
  final String title;
  final Widget child;

  const FilterBox({
    super.key,
    required this.title,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
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
    );
  }
}
