import 'package:flutter/material.dart';
import 'package:polkatalk/enums/session_status.dart';
import 'package:polkatalk/enums/session_type.dart';
import 'package:polkatalk/functions/format_number.dart';
import 'package:polkatalk/functions/extract_texts_from_strings.dart';
import 'package:polkatalk/widgets/modern_card.dart';
import 'package:polkatalk/widgets/text/txt_with_bg.dart';

class SessionCard extends StatefulWidget {
  final SessionType sessionType;
  final String name;
  final List<String> professions;
  final SessionStatus currentSessionStatus;
  final bool authenticated;
  final String startDate;
  final String? endDate;
  final String currency;
  final double totalCost;

  const SessionCard(
      {super.key,
      required this.sessionType,
      required this.name,
      required this.professions,
      required this.currentSessionStatus,
      required this.authenticated,
      required this.startDate,
      this.endDate,
      required this.currency,
      required this.totalCost});

  @override
  State<SessionCard> createState() => _SessionCardState();
}

class _SessionCardState extends State<SessionCard> {
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
                const SizedBox(height: 4),
                Text(
                  widget.name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: extractTextsFromStrings(
                    strings: widget.professions,
                    maxStringsToExtract: 2,
                    enableRow: false,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    TextWithBackground(
                        text: widget.currentSessionStatus.string,
                        backgroundColor: widget.currentSessionStatus ==
                                SessionStatus.scheduled
                            ? Colors.amber
                            : Colors.green),
                    const SizedBox(width: 8),
                    Icon(
                      Icons.fact_check_outlined,
                      color: widget.authenticated
                          ? Colors.grey
                          : Colors.transparent,
                      size: 20,
                    )
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'start:',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    widget.startDate,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'end:',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    widget.endDate ?? '—',
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    '${widget.currency} ${formatNumberWithLocalizedSeparators(widget.totalCost)}',
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
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
