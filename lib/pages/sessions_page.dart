import 'package:flutter/material.dart';
import 'package:polkatalk/enums/session_status.dart';
import 'package:polkatalk/widgets/session_card.dart';

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
            return const SessionCard(
              name: 'Larry Page',
              profession: 'Economist',
              varSessionStatus: SessionStatus.completed,
              authenticated: true,
              currency: 'USD',
              totalCost: 4200,
            );
          },
        ),
      ),
    );
  }
}
