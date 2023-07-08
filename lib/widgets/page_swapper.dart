import 'package:flutter/material.dart';
import 'package:polkatalk/functions/init_pages.dart';
import 'package:polkatalk/widgets/bottom_navbar.dart';

class PageSwapper extends StatefulWidget {
  const PageSwapper({super.key});

  @override
  State<PageSwapper> createState() => _PageSwapper();
}

class _PageSwapper extends State<PageSwapper> {
  bool _showScrollButton = false;
  late ScrollController _scrollController;

  void _scrollListener(bool condition, ScrollController varScrollController) {
    condition
        ? setState(() {
            _showScrollButton = true;
            _scrollController = varScrollController;
          })
        : setState(() {
            _showScrollButton = false;
            _scrollController = varScrollController;
          });
  }

  void _scrollToTop() {
    _scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 320),
      curve: Curves.easeInOut,
    );
  }

  int _selectedIndex = 0;

  void _onTab(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<Widget> pages = [];

  @override
  Widget build(BuildContext context) {
    pages = pages.isEmpty ? initPages(_scrollListener) : pages;

    return Scaffold(
      bottomNavigationBar: CustomBottomAppBar(
        navItems: const [
          [Icons.search_outlined, 'Search'],
          [Icons.favorite_outline, 'Favorites'],
          [Icons.calendar_today_outlined, 'Sessions'],
          [Icons.chat_outlined, 'Chats'],
          [Icons.person_outline, 'Profile'],
        ],
        selectedIndex: _selectedIndex,
        onTap: _onTab,
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: pages,
      ),
      floatingActionButton: _showScrollButton
          ? FloatingActionButton(
              onPressed: _scrollToTop,
              elevation: 1.6,
              backgroundColor: Colors.grey[50],
              mini: true,
              child: const Icon(
                Icons.arrow_upward,
                color: Colors.grey,
                size: 24,
              ),
            )
          : null,
    );
  }
}
