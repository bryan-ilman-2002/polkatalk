import 'package:flutter/material.dart';

class ColoredButton extends StatefulWidget {
  final double? width;
  final double? height;
  final double? horizontalPadding;
  final double? verticalPadding;
  final Function callbackFunction;
  final String text;
  final double textSize;
  final FontWeight textWeight;
  final Color textColor;
  final Color buttonColor;
  final Color? splashColor;
  final double borderRadius;
  final Color borderColor;

  const ColoredButton({
    super.key,
    this.width,
    this.height,
    this.horizontalPadding,
    this.verticalPadding,
    required this.callbackFunction,
    required this.text,
    this.textSize = 16,
    this.textWeight = FontWeight.normal,
    this.textColor = Colors.black,
    this.buttonColor = Colors.white,
    this.splashColor,
    this.borderRadius = 8,
    this.borderColor = Colors.black,
  });

  @override
  State<ColoredButton> createState() => _ColoredButtonState();
}

class _ColoredButtonState extends State<ColoredButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        border: Border.all(color: widget.borderColor, width: 2.0),
        borderRadius: BorderRadius.circular(widget.borderRadius),
      ),
      child: Material(
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
          splashColor: widget.splashColor,
          borderRadius: BorderRadius.all(
            Radius.circular(widget.borderRadius),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: widget.horizontalPadding ?? 0,
                vertical: widget.verticalPadding ?? 0),
            child: Center(
              child: Text(
                widget.text,
                style: TextStyle(
                  fontSize: widget.textSize,
                  fontWeight: widget.textWeight,
                  color: widget.textColor,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
