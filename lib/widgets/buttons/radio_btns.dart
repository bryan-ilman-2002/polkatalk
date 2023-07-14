import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RadioButtons extends ConsumerStatefulWidget {
  final int? groupValue;
  final Function(int) callbackFunction;
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
    required this.groupValue,
    required this.callbackFunction,
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
  ConsumerState<RadioButtons> createState() => _RadioButtonsState();
}

class _RadioButtonsState extends ConsumerState<RadioButtons> {
  @override
  Widget build(BuildContext context) {
    List<GestureDetector> children = [];

    for (int index = 0; index < widget.labels.length; index++) {
      children.add(
        GestureDetector(
          onTap: () {
            setState(() {
              widget.callbackFunction(index);
            });
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Radio<int>(
                value: index,
                groupValue: widget.groupValue,
                activeColor: widget.activeColor,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                onChanged: (int? value) {
                  setState(() {
                    widget.callbackFunction(value!);
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
