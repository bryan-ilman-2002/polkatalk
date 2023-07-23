import 'package:flutter/material.dart';
import 'package:polkatalk/functions/getters/app_colors.dart';

class TagAdderDropdown extends StatelessWidget {
  final TextEditingController clerk;
  final Map<String, dynamic> entries;
  final bool? enableInput;
  final String? hint;
  final IconData? leadingIcon;

  const TagAdderDropdown({
    super.key,
    required this.clerk,
    required this.entries,
    this.enableInput,
    this.hint,
    this.leadingIcon,
  });

  @override
  Widget build(BuildContext context) {
    final List<DropdownMenuEntry> dropdownEntries = <DropdownMenuEntry>[];

    const TextStyle hintTextStyle = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.normal,
      color: Color.fromRGBO(
          120, 120, 120, 4), // this is moderateGray from app_colors.dart
    );

    const UnderlineInputBorder transparentButton = UnderlineInputBorder(
      borderSide: BorderSide(
        color: Colors.transparent,
      ),
    );

    entries.forEach((key, value) {
      dropdownEntries.add(
        DropdownMenuEntry(
          style: ButtonStyle(
            textStyle: const MaterialStatePropertyAll(
              TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
            ),
            foregroundColor: MaterialStatePropertyAll(
              moderateGray,
            ),
            fixedSize: const MaterialStatePropertyAll(
              Size(320, 48),
            ),
          ),
          value: value,
          label: key,
        ),
      );
    });

    return DropdownMenu(
      controller: clerk,
      textStyle: TextStyle(
        fontSize: 16,
        color: moderateGray,
      ),
      hintText: hint ?? 'type here',
      enableFilter: enableInput ?? false,
      requestFocusOnTap: enableInput,
      inputDecorationTheme: const InputDecorationTheme(
        constraints: BoxConstraints(
          minWidth: 320,
          maxWidth: 320,
        ),
        hintStyle: hintTextStyle,
        labelStyle: hintTextStyle,
        enabledBorder: transparentButton,
        focusedBorder: transparentButton,
      ),
      dropdownMenuEntries: dropdownEntries,
      menuHeight: 240,
      leadingIcon: Icon(
        leadingIcon,
        color: moderateGray,
      ),
      trailingIcon: const SizedBox(), // this removes default trailing icon
    );
  }
}
