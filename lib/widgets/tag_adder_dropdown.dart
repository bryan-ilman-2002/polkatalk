import 'package:flutter/material.dart';

class TagAdderDropdown extends StatelessWidget {
  final TextEditingController? clerk;
  final Map<String, dynamic> entries;
  final String hint;
  final IconData? trailingIcon;

  const TagAdderDropdown({
    super.key,
    required this.clerk,
    required this.entries,
    this.hint = '',
    this.trailingIcon,
  });

  @override
  Widget build(BuildContext context) {
    final List<DropdownMenuEntry> dropdownEntries = <DropdownMenuEntry>[];

    entries.forEach((key, value) {
      dropdownEntries.add(
        DropdownMenuEntry(
          style: const ButtonStyle(
            minimumSize: MaterialStatePropertyAll(Size(268, 55)),
            fixedSize: MaterialStatePropertyAll(Size(268, 55)),
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
      hintText: hint,
      textStyle: const TextStyle(),
      enableFilter: true,
      requestFocusOnTap: true,
      inputDecorationTheme: const InputDecorationTheme(
        constraints: BoxConstraints(
          maxWidth: 268,
          maxHeight: 55 -
              2 /* 2 is the total width thickness from top border and bottom border */,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8),
            bottomLeft: Radius.circular(8),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
          ),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8),
            bottomLeft: Radius.circular(8),
          ),
        ),
      ),
      dropdownMenuEntries: dropdownEntries,
      menuHeight: 300,
      trailingIcon: Icon(
        trailingIcon,
        color: Colors.black,
      ),
    );
  }
}
