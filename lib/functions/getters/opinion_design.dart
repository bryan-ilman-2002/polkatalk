import 'package:flutter/material.dart';
import 'package:polkatalk/functions/getters/app_colors.dart';

IconData getOpinionIcon(String opinion) {
  switch (opinion.toString().toLowerCase().trim()) {
    case 'good':
      return Icons.thumb_up_rounded;
    case 'neutral':
      return Icons.horizontal_rule_rounded;
    case 'bad':
      return Icons.thumb_down_rounded;
    default:
      return Icons.circle;
  }
}

Color getOpinionColor(String opinion) {
  switch (opinion.toString().toLowerCase().trim()) {
    case 'good':
      return Colors.green;
    case 'neutral':
      return Colors.amber;
    case 'bad':
      return Colors.red;
    default:
      return moderateGray;
  }
}

Color getOpinionShadow(String opinion) {
  switch (opinion.toString().toLowerCase().trim()) {
    case 'good':
      return greenForRating;
    case 'neutral':
      return yellowForRating;
    case 'bad':
      return redForRating;
    default:
      return moderateGray;
  }
}
