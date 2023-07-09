import 'package:flutter/material.dart';

class ColoredButton extends StatefulWidget {
  final Color normalButtonColor;
  final Color pressedButtonColor;
  final Color textColor;

  const ColoredButton(
      {super.key,
      this.normalButtonColor = Colors.white,
      this.pressedButtonColor = const Color.fromARGB(255, 230, 230, 230),
      this.textColor = Colors.black});

  @override
  State<ColoredButton> createState() => _ColoredButtonState();
}

class _ColoredButtonState extends State<ColoredButton> {
  bool _buttonIsFocused = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 160,
      child: Listener(
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
          padding: const EdgeInsets.symmetric(vertical: 16),
          decoration: BoxDecoration(
            color: _buttonIsFocused
                ? widget.pressedButtonColor
                : widget.normalButtonColor,
            borderRadius: BorderRadius.circular(32),
          ),
          child: const Center(
            child: Text(
              'Log out',
              style: TextStyle(
                fontSize: 16,
                color: Colors.red,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
