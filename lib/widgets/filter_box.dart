import 'package:flutter/material.dart';
import 'package:polkatalk/widgets/filter_heading.dart';

class FilterBox extends StatelessWidget {
  final String title;
  final Function resetMechanism;
  final Widget child;

  const FilterBox({
    super.key,
    required this.title,
    required this.resetMechanism,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
        top: 20,
        bottom: 32,
      ),
      child: Column(
        children: [
          FilterHeading(
            title: title,
            resetMechanism: resetMechanism,
          ),
          const SizedBox(
            height: 32,
          ),
          child,
        ],
      ),
    );
  }
}
