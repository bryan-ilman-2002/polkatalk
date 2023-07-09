import 'package:flutter/material.dart';

class LogOutButton extends StatefulWidget {
  const LogOutButton({super.key});

  @override
  State<LogOutButton> createState() => _LogOutButtonState();
}

class _LogOutButtonState extends State<LogOutButton> {
  bool _buttonIsFocused = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 160,
      child: Listener(
        onPointerDown: (PointerDownEvent _) {
          setState(() {
            _buttonIsFocused = true;
          });
        },
        onPointerUp: (PointerUpEvent _) {
          setState(() {
            _buttonIsFocused = false;
          });
        },
        onPointerCancel: (PointerCancelEvent _) {
          setState(() {
            _buttonIsFocused = false;
          });
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(vertical: 16),
          decoration: BoxDecoration(
            color: _buttonIsFocused
                ? const Color.fromARGB(255, 255, 226, 224)
                : Colors.white,
            borderRadius: BorderRadius.circular(32),
          ),
          child: const Center(
            child: Text(
              'Log out',
              style: TextStyle(
                fontSize: 16,
                color: Colors.red,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
