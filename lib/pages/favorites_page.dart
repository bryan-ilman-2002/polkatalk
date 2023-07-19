import 'package:flutter/material.dart';
import 'package:polkatalk/widgets/cards/profile_card.dart';
import 'package:polkatalk/widgets/text/swipe_to_remove_txt.dart';

class FavoritesPage extends StatefulWidget {
  final ScrollController scrollController;

  const FavoritesPage({super.key, required this.scrollController});

  @override
  State<FavoritesPage> createState() => _FavoritesPage();
}

class _FavoritesPage extends State<FavoritesPage> {
  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];

    children.add(const SwipeToRemoveText());

    for (int index = 0; index < 15; index++) {
      children.add(Dismissible(
        key: ValueKey(index),
        child: const Padding(
          padding: EdgeInsets.all(8),
          child: ProfileCard(
            name: 'Larry Page',
            interests: [
              'Gaming',
              'Golfing',
              'Swimming',
              'Mathematics',
            ],
            rating: 4.8,
            location: 'Moscow, Russia',
          ),
        ),
      ));
    }

    return SafeArea(
      child: Container(
        color: Colors.white,
        child: ListView.builder(
          controller: widget.scrollController,
          itemCount: children.length,
          itemBuilder: (BuildContext context, int index) => children[index],
        ),
      ),
    );
  }
}
