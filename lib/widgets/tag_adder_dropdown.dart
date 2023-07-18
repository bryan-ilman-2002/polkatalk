import 'package:flutter/material.dart';
import 'package:polkatalk/functions/getters/app_colors.dart';

class TagAdderDropdown extends StatelessWidget {
  final TextEditingController clerk;
  final Map<String, dynamic> entries;
  final bool enableInput;
  final String? hint;
  final IconData? leadingIcon;

  const TagAdderDropdown({
    super.key,
    required this.clerk,
    required this.entries,
    this.enableInput = false,
    this.hint,
    this.leadingIcon,
  });

  @override
  Widget build(BuildContext context) {
    final List<DropdownMenuEntry> dropdownEntries = <DropdownMenuEntry>[];

    const UnderlineInputBorder transparentButton = UnderlineInputBorder(
      borderSide: BorderSide(
        color: Colors.transparent,
      ),
    );

    entries.forEach((key, value) {
      dropdownEntries.add(
        DropdownMenuEntry(
          style: const ButtonStyle(
            fixedSize: MaterialStatePropertyAll(
              Size(320, 48),
            ),
            textStyle: MaterialStatePropertyAll(
              TextStyle(
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          value: value,
          label: key,
        ),
      );
    });

    return DropdownMenu(
      controller: clerk,
      hintText: hint ?? 'type here',
      textStyle: const TextStyle(),
      enableFilter: enableInput,
      requestFocusOnTap: enableInput,
      inputDecorationTheme: const InputDecorationTheme(
        constraints: BoxConstraints(
          minWidth: 320,
          maxWidth: 320,
        ),
        enabledBorder: transparentButton,
        focusedBorder: transparentButton,
      ),
      dropdownMenuEntries: dropdownEntries,
      menuHeight: 240,
      leadingIcon: Icon(
        leadingIcon,
        color: iconColor,
      ),
      trailingIcon: const SizedBox(), // this removes default trailing icon
    );
  }
}
