import 'package:flutter/material.dart';
import 'package:polkatalk/functions/getters/app_colors.dart';

class CustomBottomAppBar extends StatefulWidget {
  final List<List<dynamic>> navItems;
  final int selectedIndex;
  final Function(int) onTap;

  const CustomBottomAppBar({
    super.key,
    required this.navItems,
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  State<CustomBottomAppBar> createState() => _CustomBottomAppBarState();
}

class _CustomBottomAppBarState extends State<CustomBottomAppBar> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        children: widget.navItems.asMap().entries.map((entry) {
          final icon = entry.value[0] as IconData;
          final label = entry.value[1] as String;
          return _navItemBuilder(icon, label, entry.key);
        }).toList(),
      ),
    );
  }

  Widget _navItemBuilder(IconData icon, String label, int index) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          widget.onTap(index);
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 320),
          height: 60,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 24,
                color: _getNavBarItemColor(index),
              ),
              const SizedBox(height: 4),
              AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 320),
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: _getNavBarTextWeight(index),
                  color: _getNavBarItemColor(index),
                ),
                child: Text(
                  label,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  FontWeight _getNavBarTextWeight(int index) {
    return widget.selectedIndex == index ? FontWeight.bold : FontWeight.normal;
  }

  Color _getNavBarItemColor(int index) {
    return widget.selectedIndex == index ? heavyGray : lightGray;
  }
}
