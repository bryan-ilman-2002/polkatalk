import 'package:flutter/material.dart';

class SettingButton extends StatefulWidget {
  final IconData icon;
  final String name;

  const SettingButton({
    super.key,
    required this.icon,
    required this.name,
  });

  @override
  State<SettingButton> createState() => _SettingButtonState();
}

class _SettingButtonState extends State<SettingButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            children: [
              Icon(
                widget.icon,
                color: Colors.grey,
                size: 30,
              ),
              const SizedBox(
                width: 14,
              ),
              Expanded(
                child: Text(
                  widget.name,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                ),
              ),
              const Icon(
                Icons.keyboard_arrow_right_rounded,
                color: Colors.grey,
                size: 30,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
