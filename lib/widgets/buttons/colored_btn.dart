import 'package:flutter/material.dart';

class ColoredButton extends StatelessWidget {
  final double? width;
  final double? height;
  final double? horizontalPadding;
  final double? verticalPadding;
  final Function? callbackFunction;
  final Color buttonColor;
  final Widget? child;
  final Color? splashColor;
  final double basicBorderRadius;
  final BorderRadius? customBorderRadius;
  final Color borderColor;
  final BoxShadow? buttonShadow;

  const ColoredButton({
    super.key,
    this.width,
    this.height,
    this.horizontalPadding,
    this.verticalPadding,
    this.callbackFunction,
    this.buttonColor = Colors.white,
    this.splashColor,
    this.child,
    this.basicBorderRadius = 8,
    this.customBorderRadius,
    this.borderColor = Colors.black,
    this.buttonShadow,
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
        boxShadow: buttonShadow != null ? [buttonShadow!] : [],
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
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
