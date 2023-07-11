import 'package:flutter/material.dart';

class TagsAdderDropdown extends StatefulWidget {
  final TextEditingController clerk;
  final List<Map<String, dynamic>> entries;
  final double width;
  final double height;
  final String hint;

  const TagsAdderDropdown({
    super.key,
    required this.clerk,
    required this.entries,
    this.width = 205,
    this.height = 55,
    this.hint = '',
  });

  @override
  State<TagsAdderDropdown> createState() => _TagsAdderDropdownState();
}

class _TagsAdderDropdownState extends State<TagsAdderDropdown> {
  @override
  Widget build(BuildContext context) {
    final List<DropdownMenuEntry> dropdownEntries = <DropdownMenuEntry>[];

    for (final map in widget.entries) {
      map.forEach((key, value) {
        dropdownEntries.add(
          DropdownMenuEntry(
            style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(Colors.white),
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
      dropdownMenuEntries: dropdownEntries,
      initialSelection: dropdownEntries.elementAt(0),
      inputDecorationTheme: InputDecorationTheme(
        constraints: BoxConstraints.tight(
          const Size(
            205,
            55,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: widget.clerk.text == '' ? Colors.grey : Colors.black,
          ),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(8),
            bottomLeft: Radius.circular(8),
          ),
        ),
      ),
      menuHeight: 200,
      onSelected: (value) {
        setState(() {});
      },
    );
  }
}
