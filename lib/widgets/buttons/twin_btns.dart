import 'package:flutter/material.dart';
import 'package:polkatalk/enums/direction.dart';
import 'package:polkatalk/functions/getters/light_shadow.dart';
import 'package:polkatalk/widgets/lines/vertical_thin_line.dart';

class TwinButtons extends StatefulWidget {
  final double height;
  final Color buttonColor;
  final double borderRadius;
  final double dividerHeight;
  final Color? dividerColor;
  final Color? splashColor;
  final Function leftButtonCallbackFunction;
  final Function rightButtonCallbackFunction;
  final IconData leftIcon;
  final IconData rightIcon;
  final String? leftText;
  final String? rightText;
  final double? iconSize;
  final Color? iconColor;
  final double? textSize;
  final FontWeight? textWeight;
  final Color? textColor;

  const TwinButtons({
    super.key,
    this.height = 60,
    this.buttonColor = Colors.white,
    this.borderRadius = 128,
    this.dividerHeight = 40,
    this.dividerColor,
    this.splashColor,
    required this.leftButtonCallbackFunction,
    required this.rightButtonCallbackFunction,
    required this.leftIcon,
    required this.rightIcon,
    this.iconSize,
    this.iconColor,
    this.leftText,
    this.rightText,
    this.textSize,
    this.textWeight,
    this.textColor,
  });

  @override
  State<TwinButtons> createState() => _TwinButtonsState();
}

class _TwinButtonsState extends State<TwinButtons> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(widget.borderRadius),
        ),
        boxShadow: [
          lightShadow,
        ],
      ),
      child: Row(
        children: [
          _buttonBuilder(Direction.left),
          Stack(
            alignment: Alignment.center,
            children: [
              VerticalThinLine(
                lineColor: widget.buttonColor,
                height: widget.height,
              ),
              VerticalThinLine(
                lineColor: widget.dividerColor ??
                    const Color.fromRGBO(180, 180, 180,
                        4), // this is lightGray from app_colors.dart,
                height: widget.dividerHeight,
              ),
            ],
          ),
          _buttonBuilder(Direction.right),
        ],
      ),
    );
  }

  Widget _buttonBuilder(Direction value) {
    bool eitherLeftOrRight() => value == Direction.left;

    ShapeBorder getBorderRadius() {
      return eitherLeftOrRight()
          ? RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(widget.borderRadius),
                bottomLeft: Radius.circular(widget.borderRadius),
              ),
            )
          : RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(widget.borderRadius),
                bottomRight: Radius.circular(widget.borderRadius),
              ),
            );
    }

    return Expanded(
      child: SizedBox(
        height: widget.height,
        child: Material(
          color: widget.buttonColor,
          shape: getBorderRadius(),
          child: InkWell(
            onTap: () {
              eitherLeftOrRight()
                  ? widget.leftButtonCallbackFunction()
                  : widget.rightButtonCallbackFunction();
            },
            splashColor: widget.splashColor,
            customBorder: getBorderRadius(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  eitherLeftOrRight() ? widget.leftIcon : widget.rightIcon,
                  size: widget.iconSize,
                  color: widget.iconColor,
                ),
                const SizedBox(width: 4),
                Text(
                  eitherLeftOrRight()
                      ? widget.leftText ?? ''
                      : widget.rightText ?? '',
                  style: TextStyle(
                    fontSize: widget.textSize,
                    fontWeight: widget.textWeight,
                    color: widget.textColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
