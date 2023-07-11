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
    return SafeArea(
      child: Container(
        color: Colors.white,
        child: ListView.builder(
          controller: widget.scrollController,
          itemCount: 15,
          itemBuilder: (BuildContext context, int index) {
            return index == 0
                ? const SwipeToRemoveText()
                : Dismissible(
                    key: ValueKey(index),
                    child: const Padding(
                      padding: EdgeInsets.all(8),
                      child: ProfileCard(
                        name: 'Larry Page',
                        profession: 'Economist',
                        rating: 4.8,
                        currency: 'USD',
                        price: 4200,
                      ),
                    ),
                  );
          },
        ),
      ),
    );
  }
}
