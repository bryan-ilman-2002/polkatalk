import 'package:flutter/material.dart';

class SettingButton extends StatefulWidget {
  final IconData icon;
  final String label;
  final Color buttonColor;
  final Color contentColor;
  final Color? splashColor;
  final double borderRadius;

  const SettingButton({
    super.key,
    required this.icon,
    required this.label,
    this.buttonColor = Colors.white,
    this.contentColor = Colors.grey,
    this.splashColor,
    this.borderRadius = 8,
  });

  @override
  State<SettingButton> createState() => _SettingButtonState();
}

class _SettingButtonState extends State<SettingButton> {
  @override
  Widget build(BuildContext context) {
    Widget content = Padding(
      padding: const EdgeInsets.all(24),
      child: Row(
        children: [
          Icon(
            widget.icon,
            color: widget.contentColor,
            size: 30,
          ),
          const SizedBox(
            width: 14,
          ),
          Expanded(
            child: Text(
              widget.label,
              style: TextStyle(
                color: widget.contentColor,
              ),
            ),
          ),
          Icon(
            Icons.keyboard_arrow_right_rounded,
            color: widget.contentColor,
            size: 30,
          ),
        ],
      ),
    );

    return Material(
      color: widget.buttonColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(widget.borderRadius),
        ),
      ),
      child: InkWell(
        onTap: () {
          setState(() {});
        },
        borderRadius: BorderRadius.all(
          Radius.circular(widget.borderRadius),
        ),
        child: content,
      ),
    );
  }
}
