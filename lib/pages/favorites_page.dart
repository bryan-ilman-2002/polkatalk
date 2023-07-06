import 'package:flutter/material.dart';
import 'package:polkatalk/widgets/agent_card.dart';

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
            return const AgentCard(
              name: 'Larry Page',
              profession: 'Economist',
              rating: 4.8,
            );
          },
        ),
      ),
    );
  }
}
