import 'package:flutter/material.dart';

class SearchField extends StatefulWidget {
  final TextEditingController clerk;
  final String label;
  final TextInputType variety;

  const SearchField({
    super.key,
    required this.clerk,
    this.label = '',
    this.variety = TextInputType.text,
  });

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  bool isFocused = false;

  Color get color {
    return isFocused ? Colors.black : Colors.grey;
  }

  InputDecoration get style {
    return widget.variety == TextInputType.text
        ? InputDecoration(
            labelText: widget.label,
            labelStyle: TextStyle(
              color: color,
              fontSize: 18,
              fontWeight: FontWeight.normal,
            ),
            prefixIcon: Icon(
              Icons.search,
              color: color,
              size: 30,
            ),
          )
        : InputDecoration(
            labelText: widget.label,
            labelStyle: TextStyle(
              color: color,
              fontSize: 18,
              fontWeight: FontWeight.normal,
            ),
            prefix: Padding(
              padding: const EdgeInsets.only(
                right: 4,
              ),
              child: Text(
                'USD',
                style: TextStyle(
                  color: color,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: isFocused ? Colors.transparent : Colors.grey,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black,
              width: 2,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          ),
        ),
      ),
      child: TextField(
        controller: widget.clerk,
        onTap: () {
          setState(() {
            isFocused = true;
          });
        },
        onSubmitted: (_) {
          setState(() {
            isFocused = false;
          });
        },
        style: TextStyle(
          color: color,
          fontSize: 18,
        ),
        cursorColor: Colors.black,
        keyboardType: widget.variety,
        decoration: style,
      ),
    );
  }
}
