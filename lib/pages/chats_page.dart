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
    return SafeArea(
      child: Container(
        color: Colors.white,
        child: ListView.builder(
          controller: widget.scrollController,
          itemCount: 15,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(8),
              child: ChatCard(
                name: 'Larry Page',
                profession: 'Economist',
                lastMessage: 'hellohellohellohellohellohellohellohello',
                lastMessageDate: currentDateShrunk,
                lastMessageIsYours: false,
                failedToSendLastMessage: false,
                theySawLastMessage: false,
                receivedUnreadMessagesCount: 0,
              ),
            );
          },
        ),
      ),
    );
  }
}
