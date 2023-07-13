import 'package:flutter/material.dart';

class PriceInput extends StatefulWidget {
  final TextEditingController clerk;
  final String label;

  const PriceInput({
    super.key,
    required this.clerk,
    this.label = '',
  });

  @override
  State<PriceInput> createState() => _PriceInputState();
}

class _PriceInputState extends State<PriceInput> {
  bool isFocused = false;

  Color get color {
    return isFocused ? Colors.black : Colors.grey;
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
        decoration: InputDecoration(
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
        ),
      ),
    );
  }
}
