import 'package:flutter/material.dart';
import 'package:polkatalk/pages/favorites_page.dart';
import 'package:polkatalk/pages/chats_page.dart';
import 'package:polkatalk/pages/profile_page.dart';
import 'package:polkatalk/pages/search_page.dart';
import 'package:polkatalk/pages/sessions_page.dart';

List<Widget> initPages(Function(bool, ScrollController) scrollListener) {
  return <Widget>[
    SearchPage(
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
    ProfilePage(
      scrollController: _createScrollController(scrollListener),
    ),
  ];
}

ScrollController _createScrollController(
    Function(bool, ScrollController) scrollListener) {
  final scrollController = ScrollController();
  scrollController.addListener(
      () => scrollListener(scrollController.offset > 0, scrollController));
  return scrollController;
}
