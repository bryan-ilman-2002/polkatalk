import 'package:flutter/material.dart';
import 'package:polkatalk/widgets/colored_btn.dart';
import 'package:polkatalk/widgets/horizontal_thin_line.dart';

class FilterModal extends StatefulWidget {
  const FilterModal({super.key});

  @override
  State<FilterModal> createState() => _FilterModalState();
}

class _FilterModalState extends State<FilterModal> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context); // Close the bottom sheet
                  },
                  child: const Icon(
                    Icons.close_rounded,
                    color: Colors.grey,
                    size: 30,
                  ),
                ),
              ),
              const Text(
                'Filter',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const HorizontalThinLine(
            margin: EdgeInsets.all(0),
          ),
          Expanded(
            child: ListView(
              children: const [
                Column(
                  children: [
                    Row(),
                    Row(),
                    Row(),
                  ],
                )
              ],
            ),
          ),
          const HorizontalThinLine(
            margin: EdgeInsets.all(0),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ColoredButton(
                  text: 'Reset',
                  textWeight: FontWeight.bold,
                  borderColor: Colors.black,
                ),
                ColoredButton(
                  text: 'Apply',
                  textWeight: FontWeight.bold,
                  normalButtonColor: Colors.black,
                  pressedButtonColor: Color.fromARGB(255, 112, 112, 112),
                  borderColor: Colors.black,
                  textColor: Colors.white,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
