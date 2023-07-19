import 'package:flutter/material.dart';
import 'package:polkatalk/enums/session_status.dart';
import 'package:polkatalk/functions/format_number.dart';
import 'package:polkatalk/functions/extract_texts_from_strings.dart';
import 'package:polkatalk/functions/getters/app_colors.dart';
import 'package:polkatalk/widgets/modern_card.dart';
import 'package:polkatalk/widgets/text/txt_with_bg.dart';

class SessionCard extends StatefulWidget {
  final String name;
  final List<String> interests;
  final SessionStatus currentSessionStatus;
  final String currency;
  final double totalCost;
  final String startDate;
  final String? endDate;

  const SessionCard({
    super.key,
    required this.name,
    required this.interests,
    required this.currentSessionStatus,
    required this.currency,
    required this.totalCost,
    required this.startDate,
    this.endDate,
  });

  @override
  State<SessionCard> createState() => _SessionCardState();
}

class _SessionCardState extends State<SessionCard> {
  @override
  Widget build(BuildContext context) {
    return ModernCard(
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
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
              ],
            ),
          ),
          Expanded(
            flex: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.name,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: heavyGray,
                  ),
                ),
                const SizedBox(height: 4),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: extractTextsFromStrings(
                    strings: widget.interests,
                    maxStringsToExtract: 2,
                    enableRow: false,
                  ),
                ),
                const SizedBox(height: 8),
                TextWithBackground(
                    text: widget.currentSessionStatus.string,
                    backgroundColor:
                        widget.currentSessionStatus == SessionStatus.scheduled
                            ? Colors.amber
                            : Colors.green),
              ],
            ),
          ),
          Expanded(
            flex: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'start:',
                ),
                const SizedBox(height: 2),
                Text(
                  widget.startDate,
                ),
                const SizedBox(height: 8),
                const Text(
                  'end:',
                ),
                const SizedBox(height: 2),
                Text(
                  widget.endDate ?? '—',
                ),
                const SizedBox(height: 8),
                Text(
                  '${widget.currency} ${formatNumberWithLocalizedSeparators(widget.totalCost)}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
