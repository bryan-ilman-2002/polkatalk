import 'package:flutter/material.dart';

class ColoredButton extends StatefulWidget {
  final String text;
  final FontWeight textWeight;
  final Color normalButtonColor;
  final Color pressedButtonColor;
  final Color borderColor;
  final Color textColor;

  const ColoredButton(
      {super.key,
      this.text = 'Click',
      this.textWeight = FontWeight.normal,
      this.normalButtonColor = Colors.white,
      this.pressedButtonColor = const Color.fromARGB(255, 230, 230, 230),
      this.borderColor = Colors.transparent,
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
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: widget.borderColor, width: 2.0),
          ),
          child: Center(
            child: Text(
              widget.text,
              style: TextStyle(
                fontSize: 16,
                fontWeight: widget.textWeight,
                color: widget.textColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
