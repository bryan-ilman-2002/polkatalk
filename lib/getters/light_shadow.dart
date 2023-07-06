import 'package:flutter/material.dart';

BoxShadow get lightShadow {
  return BoxShadow(
    color: Colors.grey.withOpacity(0.16),
    blurRadius: 10,
    spreadRadius: 2,
    offset: const Offset(0, 4),
  );
}
