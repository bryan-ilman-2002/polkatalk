import 'package:flutter/material.dart';

List<Text> extractTextsFromStrings({
  required List<String> strings,
  required int maxStringsToExtract,
  bool enableRow = true,
}) {
  if (enableRow) {
    String children = '';

    for (int index = 0;
        index < strings.length && index < maxStringsToExtract;) {
      children +=
          '${strings[index]}${++index < strings.length ? index == maxStringsToExtract ? ', ...' : ', ' : ''}';
    }

    return [
      Text(
        children,
      ),
    ];
  } else {
    List<Text> children = [];

    for (int index = 0;
        index < strings.length && index < maxStringsToExtract;) {
      children.add(
        Text(
          '${strings[index]}${++index < strings.length ? index == maxStringsToExtract ? ', ...' : ', ' : ''}',
        ),
      );
    }

    return children;
  }
}
