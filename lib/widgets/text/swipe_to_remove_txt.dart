import 'package:flutter/material.dart';

class SwipeToRemoveText extends StatelessWidget {
  const SwipeToRemoveText({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      height: 60,
      decoration: const BoxDecoration(
        color: Colors.transparent,
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Icon(
            Icons.swipe_outlined,
            color: Colors.grey,
            size: 30,
          ),
          SizedBox(width: 8),
          Text(
            'swipe to remove',
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey,
            ),
          )
        ],
      ),
    );
  }
}
