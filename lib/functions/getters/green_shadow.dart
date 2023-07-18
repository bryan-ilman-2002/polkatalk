import 'package:flutter/material.dart';

BoxShadow get greenShadow {
  return BoxShadow(
    color: const Color.fromARGB(255, 96, 255, 64).withOpacity(0.48),
    blurRadius: 16,
    spreadRadius: 4,
    offset: const Offset(0, 2),
  );
}
