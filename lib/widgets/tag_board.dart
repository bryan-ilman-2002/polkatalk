import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:polkatalk/widgets/tag.dart';

class TagBoard extends ConsumerStatefulWidget {
  final List? prints;
  final bool containsOpinion;
  final WrapAlignment horizontalAlignment;
  final WrapAlignment verticalAlignment;
  final double horizontalSpacing;
  final double verticalSpacing;

  const TagBoard({
    super.key,
    this.prints,
    this.containsOpinion = false,
    this.horizontalAlignment = WrapAlignment.center,
    this.verticalAlignment = WrapAlignment.center,
    this.horizontalSpacing = 16,
    this.verticalSpacing = 16,
  });

  @override
  ConsumerState<TagBoard> createState() => _TagBoardState();
}

class _TagBoardState extends ConsumerState<TagBoard> {
  @override
  Widget build(BuildContext context) {
    List<Tag> children = [];

    if (widget.prints != null) {
      for (int index = 0; index < widget.prints!.length; index++) {
        children.add(
          Tag(
            print: widget.prints![index],
            containsOpinion: widget.containsOpinion,
          ),
        );
      }
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
