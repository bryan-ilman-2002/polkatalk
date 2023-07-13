import 'package:flutter/material.dart';
import 'package:polkatalk/widgets/tag.dart';

class TagBoard extends StatefulWidget {
  final List<String> prints;
  final WrapAlignment horizontalAlignment;
  final WrapAlignment verticalAlignment;
  final double horizontalSpacing;
  final double verticalSpacing;

  const TagBoard({
    super.key,
    required this.prints,
    this.horizontalAlignment = WrapAlignment.center,
    this.verticalAlignment = WrapAlignment.center,
    this.horizontalSpacing = 8,
    this.verticalSpacing = 8,
  });

  @override
  State<TagBoard> createState() => _TagBoardState();
}

class _TagBoardState extends State<TagBoard> {
  @override
  Widget build(BuildContext context) {
    List<Tag> children = [];

    for (int index = 0; index < widget.prints.length; index++) {
      children.add(
        Tag(
          print: widget.prints[index],
        ),
      );
    }

    return Wrap(
      alignment: widget.horizontalAlignment,
      runAlignment: widget.verticalAlignment,
      spacing: widget.horizontalSpacing,
      runSpacing: widget.verticalSpacing,
      children: children,
    );
  }
}
