import 'package:flutter/material.dart';

List<Text> extractTextsFromStrings(
    List<String> strings, bool enableRow, maxStringsToExtract) {
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
        style: const TextStyle(
          overflow: TextOverflow.ellipsis,
          color: Colors.grey,
        ),
      ),
    ];
  } else {
    List<Text> children = [];

    for (int index = 0;
        index < strings.length && index < maxStringsToExtract;) {
      children.add(
        Text(
          '${strings[index]}${++index < strings.length ? index == maxStringsToExtract ? ', ...' : ', ' : ''}',
          style: const TextStyle(
            overflow: TextOverflow.ellipsis,
            color: Colors.grey,
          ),
        ),
      );
    }

    return children;
  }
}
