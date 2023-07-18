import 'package:flutter/material.dart';
import 'package:polkatalk/enums/session_type.dart';
import 'package:polkatalk/functions/format_number.dart';
import 'package:polkatalk/functions/getters/rating_color.dart';
import 'package:polkatalk/functions/extract_texts_from_strings.dart';
import 'package:polkatalk/widgets/modern_card.dart';
import 'package:polkatalk/widgets/text/txt_with_bg.dart';

class ProfileCard extends StatefulWidget {
  final SessionType sessionType;
  final String name;
  final List<String> professions;
  final double rating;
  final String currency;
  final double price;

  const ProfileCard({
    super.key,
    required this.sessionType,
    required this.name,
    required this.professions,
    required this.rating,
    required this.currency,
    required this.price,
  });

  @override
  State<ProfileCard> createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {
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
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[400],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    widget.name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  extractTextsFromStrings(widget.professions, true, 2)[0],
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextWithBackground(
                        text: widget.rating.toString(),
                        backgroundColor: getRatingColor(widget.rating),
                      ),
                      Text(
                        '${widget.currency} ${formatNumberWithLocalizedSeparators(widget.price)}',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
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
