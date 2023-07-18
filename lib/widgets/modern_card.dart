import 'package:flutter/material.dart';
import 'package:polkatalk/functions/getters/light_shadow.dart';
import 'package:polkatalk/pages/profile_page.dart';

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
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const ProfilePage(),
                ),
              );
            },
            borderRadius: const BorderRadius.all(
              Radius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 18,
              ),
              child: widget.child,
            ),
          ),
        ),
      ),
    );
  }
}
