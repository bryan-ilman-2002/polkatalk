import 'package:flutter/material.dart';
import 'package:polkatalk/enums/session_status.dart';
import 'package:polkatalk/functions/getters/current_date.dart';
import 'package:polkatalk/widgets/cards/session_card.dart';

class SessionsPage extends StatefulWidget {
  final ScrollController scrollController;

  const SessionsPage({super.key, required this.scrollController});

  @override
  State<SessionsPage> createState() => _SessionsPage();
}

class _SessionsPage extends State<SessionsPage> {
  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];

    for (int index = 0; index < 15; index++) {
      children.add(Padding(
        padding: const EdgeInsets.all(8),
        child: SessionCard(
          name: 'Larry Page',
          interests: const [
            'Gaming',
            'Reading',
          ],
          currentSessionStatus: SessionStatus.completed,
          startDate: currentDateExtended,
          currency: 'USD',
          totalCost: 6400,
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
