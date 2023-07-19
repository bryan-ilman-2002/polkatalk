import 'package:flutter/material.dart';
import 'package:polkatalk/enums/session_type.dart';
import 'package:polkatalk/functions/extract_texts_from_strings.dart';
import 'package:polkatalk/widgets/modern_card.dart';

class ChatCard extends StatefulWidget {
  final SessionType sessionType;
  final String name;
  final List<String> professions;
  final String lastMessage;
  final String? lastMessageDate;
  final bool lastMessageIsYours;
  final bool failedToSendLastMessage;
  final bool theySawLastMessage;
  final int receivedUnreadMessagesCount;

  const ChatCard({
    super.key,
    required this.sessionType,
    required this.name,
    required this.professions,
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
    return ModernCard(
      child: Row(
        children: [
          Container(
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
          const SizedBox(width: 14),
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(
                right: 8,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.sessionType.string,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.name,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
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
                  const SizedBox(height: 4),
                  extractTextsFromStrings(
                    strings: widget.professions,
                    maxStringsToExtract: 4,
                  )[0],
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
                                color: widget.receivedUnreadMessagesCount != 0
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
          ),
        ],
      ),
    );
  }
}
