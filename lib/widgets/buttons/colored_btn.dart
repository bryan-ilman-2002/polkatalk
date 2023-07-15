import 'package:flutter/material.dart';

class ColoredButton extends StatelessWidget {
  final double? width;
  final double? height;
  final double? horizontalPadding;
  final double? verticalPadding;
  final Function? callbackFunction;
  final String text;
  final double textSize;
  final FontWeight? textWeight;
  final Color? textColor;
  final Color buttonColor;
  final Color? splashColor;
  final double basicBorderRadius;
  final BorderRadius? customBorderRadius;
  final Color borderColor;

  const ColoredButton({
    super.key,
    this.width,
    this.height,
    this.horizontalPadding,
    this.verticalPadding,
    this.callbackFunction,
    required this.text,
    this.textSize = 16,
    this.textWeight,
    this.textColor,
    this.buttonColor = Colors.white,
    this.splashColor,
    this.basicBorderRadius = 8,
    this.customBorderRadius,
    this.borderColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.transparent),
        borderRadius: customBorderRadius ??
            BorderRadius.all(
              Radius.circular(basicBorderRadius),
            ),
      ),
      child: Material(
        color: buttonColor,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: borderColor,
          ),
          borderRadius: customBorderRadius ??
              BorderRadius.all(
                Radius.circular(basicBorderRadius),
              ),
        ),
        child: InkWell(
          onTap: () {
            if (callbackFunction != null) {
              callbackFunction!();
            }
          },
          splashColor: splashColor,
          borderRadius: customBorderRadius ??
              BorderRadius.all(
                Radius.circular(basicBorderRadius),
              ),
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding ?? 0,
                vertical: verticalPadding ?? 0),
            child: Center(
              child: Text(
                text,
                style: TextStyle(
                  fontSize: textSize,
                  fontWeight: textWeight,
                  color: textColor,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
