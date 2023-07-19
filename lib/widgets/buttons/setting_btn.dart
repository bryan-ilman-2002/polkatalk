import 'package:flutter/material.dart';

class SettingButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color? splashColor;
  final Color? buttonColor;
  final Color? iconColor;
  final Color? textColor;
  final double borderRadius;

  const SettingButton({
    super.key,
    required this.icon,
    required this.label,
    this.splashColor,
    this.buttonColor,
    this.iconColor,
    this.textColor,
    this.borderRadius = 8,
  });

  @override
  Widget build(BuildContext context) {
    Widget content = Padding(
      padding: const EdgeInsets.all(24),
      child: Row(
        children: [
          Icon(
            icon,
            color: iconColor,
            size: 30,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              label,
              style: TextStyle(
                fontSize: 16,
                color: textColor,
              ),
            ),
          ),
          Icon(
            Icons.keyboard_arrow_right_rounded,
            color: iconColor,
            size: 30,
          ),
        ],
      ),
    );

    return Material(
      color: buttonColor ?? Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(borderRadius),
        ),
      ),
      child: InkWell(
        onTap: () {},
        splashColor: splashColor,
        borderRadius: BorderRadius.all(
          Radius.circular(borderRadius),
        ),
        child: content,
      ),
    );
  }
}
