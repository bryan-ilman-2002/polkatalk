import 'package:flutter/material.dart';
import 'package:polkatalk/functions/getters/light_shadow.dart';

class ChatCard extends StatefulWidget {
  final String name;
  final String profession;
  final String lastMessage;
  final String? lastMessageDate;
  final bool lastMessageIsYours;
  final bool failedToSendLastMessage;
  final bool theySawLastMessage;
  final int receivedUnreadMessagesCount;

  const ChatCard({
    super.key,
    required this.name,
    required this.profession,
    this.lastMessage = '',
    this.lastMessageDate,
    this.lastMessageIsYours = false,
    this.failedToSendLastMessage = false,
    this.theySawLastMessage = false,
    this.receivedUnreadMessagesCount = 0,
  });

  @override
  State<ChatCard> createState() => _ChatCardState();
}

class _ChatCardState extends State<ChatCard> {
  Icon get icon {
    return Icon(
      widget.failedToSendLastMessage
          ? Icons.error_outline
          : Icons.mark_chat_read_outlined,
      color: widget.failedToSendLastMessage
          ? Colors.red
          : widget.theySawLastMessage
              ? Colors.blue
              : Colors.grey,
      size: 20,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            lightShadow,
          ],
        ),
        child: Material(
          color: Colors.white,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(16),
            ),
          ),
          child: InkWell(
            onTap: () {
              setState(() {});
            },
            borderRadius: const BorderRadius.all(
              Radius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey[200],
                      ),
                      // Replace with your photo widget
                      child: const Center(
                        child: Icon(Icons.photo, color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                widget.name,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              Text(
                                widget.lastMessageDate ?? '',
                                style: const TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          widget.profession,
                          style: const TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            widget.lastMessageIsYours ? icon : const SizedBox(),
                            widget.lastMessageIsYours
                                ? const SizedBox(width: 4)
                                : const SizedBox(),
                            Expanded(
                              child: Text(
                                widget.lastMessage,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            const SizedBox(width: 4),
                            Container(
                              width: 24,
                              height: 24,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: widget.receivedUnreadMessagesCount != 0
                                    ? Colors.green
                                    : Colors.transparent,
                              ),
                              child: Center(
                                child: Text(
                                  widget.receivedUnreadMessagesCount.toString(),
                                  style: TextStyle(
                                      color:
                                          widget.receivedUnreadMessagesCount !=
                                                  0
                                              ? Colors.white
                                              : Colors.transparent),
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
