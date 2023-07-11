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
    return SafeArea(
      child: Container(
        color: Colors.white,
        child: ListView.builder(
          controller: widget.scrollController,
          itemCount: 15,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(8),
              child: SessionCard(
                name: 'Larry Page',
                profession: 'Economist',
                varSessionStatus: SessionStatus.completed,
                authenticated: true,
                startDate: currentDateExtended,
                currency: 'USD',
                totalCost: 6400,
              ),
            );
          },
        ),
      ),
    );
  }
}
