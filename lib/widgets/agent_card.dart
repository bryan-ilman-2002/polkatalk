import 'package:flutter/material.dart';

import '../attributes/light_shadow.dart';

class AgentCard extends StatefulWidget {
  final String name;
  final String profession;

  final double rating;

  const AgentCard(
      {super.key,
      required this.name,
      required this.profession,
      required this.rating});

  @override
  State<AgentCard> createState() => _AgentCardState();
}

class _AgentCardState extends State<AgentCard> {
  Color _getRatingColor(double value) {
    // Define the start and end colors for interpolation
    Color startColor = Colors.red;
    Color middleColor = Colors.yellow;
    Color endColor = Colors.green;

    // Normalize the value between 0.0 and 1.0
    double normalizedValue = (value - 0.0) / (5.0 - 0.0);

    // Calculate the stop points for color interpolation
    double firstStop =
        0.5; // Stop point for transitioning from startColor to middleColor
    double secondStop =
        1.0; // Stop point for transitioning from middleColor to endColor

    if (normalizedValue <= firstStop) {
      // Interpolate between startColor and middleColor
      return Color.lerp(startColor, middleColor, normalizedValue / firstStop) ??
          Colors.transparent;
    } else {
      // Interpolate between middleColor and endColor
      return Color.lerp(middleColor, endColor,
              (normalizedValue - firstStop) / (secondStop - firstStop)) ??
          Colors.transparent;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 0,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              getLightShadow(),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
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
                    Text(
                      widget.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      widget.profession,
                      style: const TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: _getRatingColor(widget.rating),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        widget.rating.toString(),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
