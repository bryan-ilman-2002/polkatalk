import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:polkatalk/functions/getters/app_colors.dart';
import 'package:polkatalk/widgets/custom_scroll_behavior.dart';
import 'package:polkatalk/widgets/lines/horizontal_thin_line.dart';

class NotificationsModal extends ConsumerWidget {
  const NotificationsModal({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.close_rounded,
                    size: 24,
                    color: moderateGray,
                  ),
                ),
              ),
              Text(
                'Notifications',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: heavyGray,
                ),
              ),
            ],
          ),
          const HorizontalThinLine(
            horizontalMargin: 0,
          ),
          Expanded(
            child: ScrollConfiguration(
              behavior: CustomScrollBehavior(),
              child: ListView(
                children: [],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
