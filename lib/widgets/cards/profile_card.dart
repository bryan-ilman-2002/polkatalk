import 'package:flutter/material.dart';
import 'package:polkatalk/functions/getters/app_colors.dart';
import 'package:polkatalk/functions/getters/rating_color.dart';
import 'package:polkatalk/functions/extract_texts_from_strings.dart';
import 'package:polkatalk/widgets/modern_card.dart';
import 'package:polkatalk/widgets/text/txt_with_bg.dart';

class ProfileCard extends StatelessWidget {
  final String name;
  final List<String> interests;
  final double rating;
  final String location;

  const ProfileCard({
    super.key,
    required this.name,
    required this.interests,
    required this.rating,
    required this.location,
  });

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
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: heavyGray,
                  ),
                ),
                const SizedBox(height: 4),
                extractTextsFromStrings(
                  strings: interests,
                  maxStringsToExtract: 4,
                )[0],
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextWithBackground(
                      backgroundColor: getRatingColor(rating),
                      text: rating.toString(),
                    ),
                    const SizedBox(width: 12),
                    Icon(
                      Icons.location_pin,
                      size: 20,
                      color: moderateGray,
                    ),
                    const SizedBox(width: 2),
                    Expanded(
                      child: Text(
                        location,
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
