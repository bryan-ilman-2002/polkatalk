import 'package:flutter/material.dart';
import 'package:polkatalk/pages/favorites_page.dart';
import 'package:polkatalk/pages/chats_page.dart';
import 'package:polkatalk/pages/settings_page.dart';
import 'package:polkatalk/pages/explore_page.dart';
import 'package:polkatalk/pages/sessions_page.dart';

List<Widget> initPages(Function(bool, ScrollController) scrollListener) {
  return <Widget>[
    ExplorePage(
      scrollController: _createScrollController(scrollListener),
    ),
    FavoritesPage(
      scrollController: _createScrollController(scrollListener),
    ),
    SessionsPage(
      scrollController: _createScrollController(scrollListener),
    ),
    ChatsPage(
      scrollController: _createScrollController(scrollListener),
    ),
    SettingsPage(
      scrollController: _createScrollController(scrollListener),
    ),
  ];
}

ScrollController _createScrollController(
    Function(bool, ScrollController) scrollListener) {
  final scrollController = ScrollController();
  scrollController.addListener(
    () => scrollListener(scrollController.offset > 0, scrollController),
  );
  return scrollController;
}
