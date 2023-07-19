import 'package:flutter/material.dart';
import 'package:polkatalk/functions/extract_texts_from_strings.dart';
import 'package:polkatalk/functions/getters/app_colors.dart';
import 'package:polkatalk/widgets/modern_card.dart';

class ChatCard extends StatefulWidget {
  final String name;
  final List<String> interests;
  final String lastMessage;
  final String lastMessageDate;
  final bool lastMessageIsYours;
  final bool failedToSendLastMessage;
  final bool theySawLastMessage;
  final int receivedUnreadMessagesCount;

  const ChatCard({
    super.key,
    required this.name,
    required this.interests,
    this.lastMessage = '',
    this.lastMessageDate = '',
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
                border: Border.all(
                  color: moderateGray,
                )),
            // Replace with your photo widget
            child: Center(
              child: Icon(
                Icons.no_photography_rounded,
                size: 24,
                color: lightGray,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.name,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: heavyGray,
                      ),
                    ),
                    Text(
                      widget.lastMessageDate,
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                extractTextsFromStrings(
                  strings: widget.interests,
                  maxStringsToExtract: 4,
                )[0],
                const SizedBox(height: 16),
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
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
