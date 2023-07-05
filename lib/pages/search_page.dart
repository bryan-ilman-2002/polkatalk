import 'package:flutter/material.dart';
import 'package:polkatalk/widgets/agent_card.dart';
import 'package:polkatalk/widgets/bg_reveal_button.dart';

import '../widgets/bottom_navbar.dart';
import '../widgets/filter_btn_notification_btn.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late ScrollController _scrollController;
  bool _showScrollButton = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.offset > 0) {
      setState(() {
        _showScrollButton = true;
      });
    } else {
      setState(() {
        _showScrollButton = false;
      });
    }
  }

  void _scrollToTop() {
    _scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 320),
      curve: Curves.easeInOut,
    );
  }

  List<Widget> pageButtons = [
    const Expanded(
      child: FilterButtonAndNotificationButton(),
    ),
    const BackgroundRevealButton()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const CustomBottomAppBar(navItems: [
        [Icons.search_outlined, 'Search'],
        [Icons.favorite_outline, 'Favorites'],
        [Icons.calendar_today_outlined, 'Sessions'],
        [Icons.inbox_outlined, 'Inbox'],
        [Icons.person_outline, 'Profile'],
      ]),
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: ListView.builder(
            controller: _scrollController,
            itemCount: 15,
            itemBuilder: (BuildContext context, int index) {
              return index == 0
                  ? Row(children: pageButtons)
                  : const AgentCard(
                      name: 'Larry Page',
                      profession: 'Economist',
                      rating: 4.8,
                    );
            },
          ),
        ),
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
