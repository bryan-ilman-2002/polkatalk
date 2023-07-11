import 'package:flutter/material.dart';

class SettingButton extends StatefulWidget {
  final IconData icon;
  final String name;

  const SettingButton({
    super.key,
    required this.icon,
    required this.name,
  });

  @override
  State<SettingButton> createState() => _SettingButtonState();
}

class _SettingButtonState extends State<SettingButton> {
  bool _buttonIsFocused = false;

  MaterialColor get rowColor {
    return widget.icon == Icons.delete_outline_rounded
        ? Colors.red
        : Colors.grey;
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (PointerDownEvent _) {
        setState(() {
          _buttonIsFocused = true;
        });
      },
      onPointerUp: (PointerUpEvent _) {
        setState(() {
          _buttonIsFocused = false;
        });
      },
      onPointerCancel: (PointerCancelEvent _) {
        setState(() {
          _buttonIsFocused = false;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
            color: _buttonIsFocused
                ? const Color.fromARGB(255, 230, 230, 230)
                : Colors.white,
            borderRadius: BorderRadius.circular(10)),
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
                widget.name,
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
      ),
    );
  }
}
