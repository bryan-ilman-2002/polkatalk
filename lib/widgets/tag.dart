import 'package:flutter/material.dart';
import 'package:polkatalk/functions/getters/app_colors.dart';
import 'package:polkatalk/functions/getters/heavy_shadow.dart';

class Tag extends StatelessWidget {
  final String print;

  const Tag({
    super.key,
    required this.print,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          heavyShadow,
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Icon(
              Icons.circle,
              size: 8,
              color: primaryAppColor,
            ),
          ),
          const SizedBox(
            width: 4,
          ),
          Text(
            print,
          ),
          const SizedBox(
            width: 4,
          ),
        ],
      ),
    );
  }
}
