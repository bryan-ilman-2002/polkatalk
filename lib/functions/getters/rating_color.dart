import 'package:flutter/material.dart';

Color getRatingColor(double value) {
  // Define the start and end colors for interpolation
  Color startColor = Colors.red;
  Color middleColor = Colors.amber;
  Color endColor = Colors.green;

  // Normalize the value between 0.0 and 1.0
  double normalizedValue = (value - 0.0) / (5.0 - 0.0);

  // Calculate the stop points for color interpolation
  double firstStop =
      0.5; // Stop point for transitioning from startColor to middleColor
  double secondStop =
      1.0; // Stop point for transitioning from middleColor to endColor

  if (normalizedValue <= firstStop) {
    // Interpolate between startColor and middleColor
    return Color.lerp(startColor, middleColor, normalizedValue / firstStop) ??
        Colors.transparent;
  } else {
    // Interpolate between middleColor and endColor
    return Color.lerp(middleColor, endColor,
            (normalizedValue - firstStop) / (secondStop - firstStop)) ??
        Colors.transparent;
  }
}
