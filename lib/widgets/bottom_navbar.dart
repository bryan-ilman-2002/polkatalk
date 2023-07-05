import 'package:flutter/material.dart';

class CustomBottomAppBar extends StatefulWidget {
  final List<List<dynamic>> navItems;

  const CustomBottomAppBar({super.key, required this.navItems});

  @override
  State<CustomBottomAppBar> createState() => _CustomBottomAppBarState();
}

class _CustomBottomAppBarState extends State<CustomBottomAppBar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
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
          setState(() {
            _selectedIndex = index;
          });
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 320),
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            border: _getNavBarItemBorder(index),
          ),
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
    return _selectedIndex == index ? FontWeight.bold : FontWeight.normal;
  }

  Color _getNavBarItemColor(int index) {
    return _selectedIndex == index ? Colors.black : Colors.grey;
  }

  Border _getNavBarItemBorder(int index) {
    return _selectedIndex == index
        ? Border.all(color: Colors.black, width: 2.0)
        : Border.all(color: Colors.transparent, width: 0.0);
  }
}