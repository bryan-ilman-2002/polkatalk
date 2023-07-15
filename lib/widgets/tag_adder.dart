import 'package:flutter/material.dart';
import 'package:polkatalk/widgets/buttons/colored_btn.dart';
import 'package:polkatalk/widgets/tag_adder_dropdown.dart';
import 'package:polkatalk/widgets/tag_board.dart';

class TagAdder extends StatelessWidget {
  final Function callbackFunction;
  final TextEditingController? clerk;
  final List<Map<String, dynamic>> entries;
  final List<String>? prints;
  final String hint;
  final IconData? trailingIcon;

  const TagAdder({
    super.key,
    required this.callbackFunction,
    required this.clerk,
    required this.entries,
    this.prints,
    this.hint = '',
    this.trailingIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TagAdderDropdown(
              clerk: clerk,
              entries: entries,
              hint: hint,
              trailingIcon: trailingIcon,
            ),
            ColoredButton(
              width: 55,
              height: 55,
              callbackFunction: callbackFunction,
              text: '+',
              textSize: 24,
              textWeight: FontWeight.bold,
              textColor: Colors.white,
              buttonColor: Colors.black,
              splashColor: const Color.fromARGB(255, 112, 112, 112),
              customBorderRadius: const BorderRadius.only(
                topRight: Radius.circular(8),
                bottomRight: Radius.circular(8),
              ),
              borderColor: Colors.black,
            ),
          ],
        ),
        const SizedBox(
          height: 32,
        ),
        TagBoard(
          prints: prints,
        ),
      ],
    );
  }
}
