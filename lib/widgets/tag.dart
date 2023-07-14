import 'package:flutter/material.dart';

class Tag extends StatelessWidget {
  final String print;
  final Color contentColor;
  final Color fillColor;

  const Tag({
    super.key,
    required this.print,
    this.contentColor = Colors.black,
    this.fillColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: fillColor,
        border: Border.all(
          color: contentColor,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Wrap(
        alignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          Icon(
            Icons.circle,
            size: 7.2,
            color: contentColor,
          ),
          const SizedBox(
            width: 4,
          ),
          Text(
            print,
            style: TextStyle(
              color: contentColor,
            ),
          ),
          const SizedBox(
            width: 4,
          ),
        ],
      ),
    );
  }
}
