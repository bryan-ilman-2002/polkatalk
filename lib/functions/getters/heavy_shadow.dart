import 'package:flutter/material.dart';

BoxShadow get heavyShadow {
  return BoxShadow(
    color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.16),
    blurRadius: 8,
    offset: const Offset(0, 4),
  );
}

BoxShadow get giantShadow {
  return BoxShadow(
    color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.2),
    blurRadius: 2,
    offset: const Offset(0, 2),
  );
}
