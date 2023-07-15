import 'package:flutter/material.dart';

class PriceInput extends StatelessWidget {
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
        controller: clerk,
        style: const TextStyle(
          fontSize: 16,
        ),
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          label: Text(
            label,
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
              currency,
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
