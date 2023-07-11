import 'package:flutter/material.dart';

class SettingButton extends StatefulWidget {
  final IconData icon;
  final String label;

  const SettingButton({
    super.key,
    required this.icon,
    required this.label,
  });

  @override
  State<SettingButton> createState() => _SettingButtonState();
}

class _SettingButtonState extends State<SettingButton> {
  MaterialColor get rowColor {
    return widget.icon == Icons.delete_outline_rounded
        ? Colors.red
        : Colors.grey;
  }

  @override
  Widget build(BuildContext context) {
    Widget content = Padding(
      padding: const EdgeInsets.all(24),
      child: Row(
        children: [
          Icon(
            widget.icon,
            color: rowColor,
            size: 30,
          ),
          const SizedBox(
            width: 14,
          ),
          Expanded(
            child: Text(
              widget.label,
              style: TextStyle(
                color: rowColor,
                fontSize: 16,
              ),
            ),
          ),
          Icon(
            Icons.keyboard_arrow_right_rounded,
            color: rowColor,
            size: 30,
          ),
        ],
      ),
    );

    return Material(
      color: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: widget.icon == Icons.delete_outline_rounded
          ? InkWell(
              onTap: () {
                setState(() {});
              },
              splashColor: const Color.fromARGB(255, 255, 226, 224),
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
              child: content,
            )
          : InkWell(
              onTap: () {
                setState(() {});
              },
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
              child: content,
            ),
    );
  }
}
