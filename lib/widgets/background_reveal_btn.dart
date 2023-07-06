import 'package:flutter/material.dart';
import 'package:polkatalk/getters/light_shadow.dart';

class BackgroundRevealButton extends StatefulWidget {
  const BackgroundRevealButton({super.key});

  @override
  State<BackgroundRevealButton> createState() => _BackgroundRevealButtonState();
}

class _BackgroundRevealButtonState extends State<BackgroundRevealButton> {
  bool _bgButtonIsActive = false;

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (PointerDownEvent _) {
        setState(() {
          _bgButtonIsActive = true;
        });
      },
      onPointerUp: (PointerUpEvent _) {
        setState(() {
          _bgButtonIsActive = false;
        });
      },
      onPointerCancel: (PointerCancelEvent _) {
        setState(() {
          _bgButtonIsActive = false;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: const EdgeInsets.only(right: 8),
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: _bgButtonIsActive
              ? const Color.fromARGB(255, 230, 230, 230)
              : Colors.white,
          boxShadow: [
            lightShadow,
          ],
        ),
        child: const Icon(
          Icons.photo_outlined,
          color: Colors.grey,
          size: 30,
        ),
      ),
    );
  }
}
