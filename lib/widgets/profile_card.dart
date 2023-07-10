import 'package:flutter/material.dart';
import 'package:polkatalk/functions/getters/light_shadow.dart';
import 'package:polkatalk/functions/getters/rating_color.dart';
import 'package:polkatalk/widgets/txt_with_bg.dart';

class ProfileCard extends StatefulWidget {
  final String name;
  final String profession;

  final double rating;

  const ProfileCard({
    super.key,
    required this.name,
    required this.profession,
    required this.rating,
  });

  @override
  State<ProfileCard> createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {
  bool _cardIsFocused = false;

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (PointerDownEvent _) {
        setState(() {
          _cardIsFocused = true;
        });
      },
      onPointerUp: (PointerUpEvent _) {
        setState(() {
          _cardIsFocused = false;
        });
        () {}; // callback function
      },
      onPointerCancel: (PointerCancelEvent _) {
        setState(() {
          _cardIsFocused = false;
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          elevation: 0,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.symmetric(vertical: 16),
            decoration: BoxDecoration(
              color: _cardIsFocused
                  ? const Color.fromARGB(255, 230, 230, 230)
                  : Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                lightShadow,
              ],
            ),
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
                      TextWithBackground(
                        text: widget.rating.toString(),
                        backgroundColor: getRatingColor(widget.rating),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
