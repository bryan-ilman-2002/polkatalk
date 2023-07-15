import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:polkatalk/enums/price_range.dart';
import 'package:polkatalk/functions/providers/price_range_filter_state.dart';
import 'package:polkatalk/widgets/price_input.dart';

class PriceRangeInput extends ConsumerWidget {
  final String currency;

  const PriceRangeInput({
    super.key,
    required this.currency,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        Expanded(
          child: PriceInput(
            clerk: ref.watch(
                priceRangeFilterStateNotifierProvider)[PriceRange.minimum]!,
            currency: currency,
            label: 'minimum',
          ),
        ),
        const SizedBox(
          width: 12,
        ),
        Expanded(
          child: PriceInput(
            clerk: ref.watch(
                priceRangeFilterStateNotifierProvider)[PriceRange.maximum]!,
            currency: currency,
            label: 'maximum',
          ),
        ),
      ],
    );
  }
}
