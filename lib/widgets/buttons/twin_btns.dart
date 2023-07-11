import 'package:flutter/material.dart';
import 'package:polkatalk/enums/direction.dart';
import 'package:polkatalk/functions/getters/light_shadow.dart';
import 'package:polkatalk/widgets/lines/vertical_thin_line.dart';

class TwinButtons extends StatefulWidget {
  final double height;
  final Color buttonColor;
  final double borderRadius;
  final IconData leftIcon;
  final IconData rightIcon;
  final double iconSize;
  final Color iconColor;
  final String leftText;
  final String rightText;
  final double textSize;
  final Color textColor;

  const TwinButtons({
    super.key,
    this.height = 60,
    this.buttonColor = Colors.white,
    this.borderRadius = 128,
    required this.leftIcon,
    required this.rightIcon,
    this.iconSize = 30,
    this.iconColor = Colors.grey,
    required this.leftText,
    required this.rightText,
    this.textSize = 14,
    this.textColor = Colors.grey,
  });

  @override
  State<TwinButtons> createState() => _TwinButtonsState();
}

class _TwinButtonsState extends State<TwinButtons> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buttonBuilder(Direction.left),
        const VerticalThinLine(),
        _buttonBuilder(Direction.right),
      ],
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
      child: Container(
        height: widget.height,
        decoration: BoxDecoration(
          borderRadius: eitherLeftOrRight()
              ? BorderRadius.only(
                  topLeft: Radius.circular(widget.borderRadius),
                  bottomLeft: Radius.circular(widget.borderRadius),
                )
              : BorderRadius.only(
                  topRight: Radius.circular(widget.borderRadius),
                  bottomRight: Radius.circular(widget.borderRadius),
                ),
          boxShadow: [
            lightShadow,
          ],
        ),
        child: Material(
          color: widget.buttonColor,
          shape: getBorderRadius(),
          child: InkWell(
            onTap: () {
              setState(() {});
            },
            customBorder: getBorderRadius(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  eitherLeftOrRight() ? widget.leftIcon : widget.rightIcon,
                  size: widget.iconSize,
                  color: widget.iconColor,
                ),
                const SizedBox(width: 8),
                Text(
                  eitherLeftOrRight() ? widget.leftText : widget.rightText,
                  style: TextStyle(
                    fontSize: widget.textSize,
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
