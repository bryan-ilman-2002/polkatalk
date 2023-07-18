import 'package:flutter/material.dart';
import 'package:polkatalk/functions/getters/app_colors.dart';
import 'package:polkatalk/functions/getters/green_shadow.dart';
import 'package:polkatalk/widgets/buttons/colored_btn.dart';
import 'package:polkatalk/widgets/tag_adder_dropdown.dart';
import 'package:polkatalk/widgets/tag_board.dart';

class TagAdder extends StatelessWidget {
  final Function callbackFunction;
  final TextEditingController clerk;
  final Map<String, dynamic> entries;
  final List<String>? prints;
  final String? hint;
  final IconData? leadingIcon;

  const TagAdder({
    super.key,
    required this.callbackFunction,
    required this.clerk,
    required this.entries,
    this.prints,
    this.hint,
    this.leadingIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 320,
          child: Row(
            children: [
              Expanded(
                child: TagAdderDropdown(
                  clerk: clerk,
                  entries: entries,
                  hint: hint,
                  leadingIcon: leadingIcon,
                ),
              ),
              ColoredButton(
                width: 48,
                height: 48,
                callbackFunction: callbackFunction,
                buttonColor: primaryAppColor,
                splashColor: secondaryAppColor,
                customBorderRadius:
                    const BorderRadius.all(Radius.circular(128)),
                borderColor: Colors.white,
                buttonShadow: greenShadow,
                child: const Icon(
                  Icons.add,
                  size: 24,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        TagBoard(
          prints: prints,
        ),
      ],
    );
  }
}
