import 'package:flutter/material.dart';

BoxShadow get blueShadow {
  return BoxShadow(
    color: const Color.fromARGB(255, 64, 150, 255).withOpacity(0.64),
    blurRadius: 16,
    spreadRadius: 4,
    offset: const Offset(0, 2),
  );
}
