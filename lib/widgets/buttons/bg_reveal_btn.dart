import 'package:flutter/material.dart';
import 'package:polkatalk/functions/getters/light_shadow.dart';

class BackgroundRevealButton extends StatefulWidget {
  final Function()? callbackFunction;

  const BackgroundRevealButton({
    super.key,
    this.callbackFunction,
  });

  @override
  State<BackgroundRevealButton> createState() => _BackgroundRevealButtonState();
}

class _BackgroundRevealButtonState extends State<BackgroundRevealButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(128),
        boxShadow: [
          lightShadow,
        ],
      ),
      child: Material(
        color: Colors.white,
        shape: const CircleBorder(eccentricity: 0),
        child: InkWell(
          onTap: () {
            setState(() {});
          },
          borderRadius: BorderRadius.circular(128),
          child: Icon(
            Icons.photo_rounded,
            size: 30,
            color: Colors.grey[400],
          ),
        ),
      ),
    );
  }
}
