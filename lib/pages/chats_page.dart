import 'package:flutter/material.dart';
import 'package:polkatalk/widgets/chat_card.dart';

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
            return const ChatCard(
              name: 'Larry Page',
              profession: 'Economist',
              // lastMessage: 'hellohellohellohellohellohellohellohello',
              // lastMessageIsYours: false,
              // failedToSendLastMessage: false,
              // theySawLastMessage: false,
              // receivedUnreadMessagesCount: 0,
            );
          },
        ),
      ),
    );
  }
}
