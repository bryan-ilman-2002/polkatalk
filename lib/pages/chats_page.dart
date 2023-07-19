import 'package:flutter/material.dart';
import 'package:polkatalk/functions/getters/current_date.dart';
import 'package:polkatalk/widgets/cards/chat_card.dart';

class ChatsPage extends StatefulWidget {
  final ScrollController scrollController;

  const ChatsPage({super.key, required this.scrollController});

  @override
  State<ChatsPage> createState() => _ChatsPageState();
}

class _ChatsPageState extends State<ChatsPage> {
  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];

    for (int index = 0; index < 15; index++) {
      children.add(
        Padding(
          padding: const EdgeInsets.all(8),
          child: ChatCard(
            name: 'Larry Page',
            interests: const [
              'Gaming',
              'Reading',
            ],
            lastMessage: 'hello there',
            lastMessageDate: currentDateShrunk,
            lastMessageIsYours: true,
            failedToSendLastMessage: false,
            theySawLastMessage: true,
            receivedUnreadMessagesCount: 8,
          ),
        ),
      );
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
