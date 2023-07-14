import 'package:flutter/material.dart';

class PriceInput extends StatefulWidget {
  final TextEditingController clerk;
  final String currency;
  final String label;

  const PriceInput({
    super.key,
    required this.clerk,
    required this.currency,
    required this.label,
  });

  @override
  State<PriceInput> createState() => _PriceInputState();
}

class _PriceInputState extends State<PriceInput> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          ),
        ),
      ),
      child: TextField(
        controller: widget.clerk,
        style: const TextStyle(
          fontSize: 16,
        ),
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          label: Text(
            widget.label,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
          ),
          prefix: Padding(
            padding: const EdgeInsets.only(
              right: 4,
            ),
            child: Text(
              widget.currency,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
