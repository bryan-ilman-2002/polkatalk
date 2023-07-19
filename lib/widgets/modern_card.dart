import 'package:flutter/material.dart';
import 'package:polkatalk/functions/getters/light_shadow.dart';

class ModernCard extends StatefulWidget {
  final Widget child;

  const ModernCard({
    super.key,
    required this.child,
  });

  @override
  State<ModernCard> createState() => _ModernCardState();
}

class _ModernCardState extends State<ModernCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            lightShadow,
          ],
        ),
        child: Material(
          color: Colors.white,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(16),
            ),
          ),
          child: InkWell(
            onTap: () {},
            borderRadius: const BorderRadius.all(
              Radius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 20,
              ),
              child: widget.child,
            ),
          ),
        ),
      ),
    );
  }
}
