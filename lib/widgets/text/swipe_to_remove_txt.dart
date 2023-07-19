import 'package:flutter/material.dart';
import 'package:polkatalk/functions/getters/app_colors.dart';

class SwipeToRemoveText extends StatelessWidget {
  const SwipeToRemoveText({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Icon(
            Icons.swipe_rounded,
            color: lightGray,
            size: 30,
          ),
          const SizedBox(width: 8),
          Text(
            'swipe to remove',
            style: TextStyle(
              fontSize: 18,
              color: moderateGray,
            ),
          )
        ],
      ),
    );
  }
}
