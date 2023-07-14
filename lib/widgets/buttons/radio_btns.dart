import 'package:flutter/material.dart';

class RadioButtons extends StatefulWidget {
  final List labels;
  final double textSize;
  final Axis direction;
  final WrapAlignment mainAlignment;
  final WrapAlignment crossAlignment;
  final double mainSpacing;
  final double crossSpacing;
  final Color activeColor;

  const RadioButtons({
    super.key,
    required this.labels,
    this.textSize = 16,
    this.direction = Axis.vertical,
    this.mainAlignment = WrapAlignment.center,
    this.crossAlignment = WrapAlignment.center,
    this.mainSpacing = 8,
    this.crossSpacing = 8,
    this.activeColor = Colors.black,
  });

  @override
  State<RadioButtons> createState() => _RadioButtonsState();
}

class _RadioButtonsState extends State<RadioButtons> {
  int? selectedValue;

  @override
  Widget build(BuildContext context) {
    List<GestureDetector> children = [];

    for (int index = 0; index < widget.labels.length; index++) {
      children.add(
        GestureDetector(
          onTap: () {
            setState(() {
              selectedValue = index;
            });
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Radio<int>(
                value: index,
                groupValue: selectedValue,
                activeColor: widget.activeColor,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                onChanged: (int? value) {
                  setState(() {
                    selectedValue = value!;
                  });
                },
              ),
              widget.labels[index] is String
                  ? Text(
                      widget.labels[index],
                      style: TextStyle(
                        fontSize: widget.textSize,
                      ),
                    )
                  : widget.labels[index],
            ],
          ),
        ),
      );
    }

    return Wrap(
      direction: widget.direction,
      alignment: widget.mainAlignment,
      runAlignment: widget.crossAlignment,
      spacing: widget.mainSpacing,
      runSpacing: widget.crossSpacing,
      children: children,
    );
  }
}
