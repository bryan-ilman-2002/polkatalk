import 'package:flutter/material.dart';

class TagAdderDropdown extends StatefulWidget {
  final TextEditingController clerk;
  final List<Map<String, dynamic>> entries;
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
  State<TagAdderDropdown> createState() => _TagAdderDropdownState();
}

class _TagAdderDropdownState extends State<TagAdderDropdown> {
  @override
  Widget build(BuildContext context) {
    final List<DropdownMenuEntry> dropdownEntries = <DropdownMenuEntry>[];

    for (final map in widget.entries) {
      map.forEach((key, value) {
        dropdownEntries.add(
          DropdownMenuEntry(
            style: const ButtonStyle(
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
    }

    return DropdownMenu(
      controller: widget.clerk,
      hintText: widget.hint,
      textStyle: const TextStyle(),
      enableFilter: true,
      requestFocusOnTap: true,
      inputDecorationTheme: const InputDecorationTheme(
        constraints: BoxConstraints(
            maxHeight: 55 -
                2 /* 2 is the total width thickness from top border and bottom border */),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
          ),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8),
            bottomLeft: Radius.circular(8),
          ),
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
      ),
      dropdownMenuEntries: dropdownEntries,
      menuHeight: 300,
      trailingIcon: Icon(
        widget.trailingIcon,
        color: Colors.black,
      ),
      onSelected: (value) {
        setState(() {});
      },
    );
  }
}
