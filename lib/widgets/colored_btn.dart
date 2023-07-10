import 'package:flutter/material.dart';

class ColoredButton extends StatefulWidget {
  final double width;
  final double height;
  final Function onPressed;
  final String text;
  final FontWeight fontWeight;
  final Color normalButtonColor;
  final Color pressedButtonColor;
  final double borderRadius;
  final Color borderColor;
  final Color textColor;

  const ColoredButton({
    super.key,
    this.width = 160,
    this.height = 16,
    this.onPressed = print,
    this.text = 'Click',
    this.fontWeight = FontWeight.normal,
    this.normalButtonColor = Colors.white,
    this.pressedButtonColor = const Color.fromARGB(255, 230, 230, 230),
    this.borderRadius = 8,
    this.borderColor = Colors.transparent,
    this.textColor = Colors.black,
  });

  @override
  State<ColoredButton> createState() => _ColoredButtonState();
}

class _ColoredButtonState extends State<ColoredButton> {
  bool _buttonIsFocused = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
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
          widget.onPressed == print
              ? widget.onPressed(const Text('clicked'))
              : widget.onPressed();
        },
        onPointerCancel: (PointerCancelEvent _) {
          setState(() {
            _buttonIsFocused = false;
          });
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: EdgeInsets.symmetric(vertical: widget.height),
          decoration: BoxDecoration(
            color: _buttonIsFocused
                ? widget.pressedButtonColor
                : widget.normalButtonColor,
            border: Border.all(color: widget.borderColor, width: 2.0),
            borderRadius: BorderRadius.circular(widget.borderRadius),
          ),
          child: Center(
            child: Text(
              widget.text,
              style: TextStyle(
                fontSize: 16,
                fontWeight: widget.fontWeight,
                color: widget.textColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
