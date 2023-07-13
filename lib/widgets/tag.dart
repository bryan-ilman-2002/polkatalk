import 'package:flutter/material.dart';

class Tag extends StatefulWidget {
  final String print;
  final Color normalTextColor;
  final Color normalBackgroundColor;
  final Color normalBorderColor;
  final Color focusedTextColor;
  final Color focusedBackgroundColor;
  final Color focusedBorderColor;

  const Tag({
    super.key,
    this.print = 'tag',
    this.normalTextColor = Colors.grey,
    this.normalBackgroundColor = Colors.white,
    this.normalBorderColor = Colors.grey,
    this.focusedTextColor = Colors.black,
    this.focusedBackgroundColor = Colors.white,
    this.focusedBorderColor = Colors.black,
  });

  @override
  State<Tag> createState() => _TagState();
}

class _TagState extends State<Tag> {
  bool _buttonIsFocused = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _buttonIsFocused = !_buttonIsFocused;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: _buttonIsFocused
              ? widget.focusedBackgroundColor
              : widget.normalBackgroundColor,
          border: Border.all(
              color: _buttonIsFocused
                  ? widget.focusedBorderColor
                  : widget.normalBorderColor,
              width: 2.0),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Wrap(
          alignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Icon(
              Icons.circle,
              size: 10,
              color: _buttonIsFocused
                  ? widget.focusedTextColor
                  : widget.normalTextColor,
            ),
            const SizedBox(
              width: 4,
            ),
            Text(
              widget.print,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: _buttonIsFocused
                    ? widget.focusedTextColor
                    : widget.normalTextColor,
              ),
            ),
            const SizedBox(
              width: 4,
            ),
          ],
        ),
      ),
    );
  }
}
