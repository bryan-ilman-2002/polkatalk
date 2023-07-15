import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:polkatalk/enums/price_range.dart';

class PriceRangeFilterStateNotifier
    extends StateNotifier<Map<PriceRange, TextEditingController>> {
  PriceRangeFilterStateNotifier()
      : super({
          PriceRange.minimum: TextEditingController(),
          PriceRange.maximum: TextEditingController()
        }) {
    state[PriceRange.minimum]!.addListener(updateMinPrice);
    state[PriceRange.maximum]!.addListener(updateMaxPrice);
  }

  @override
  void dispose() {
    state[PriceRange.minimum]!.dispose();
    state[PriceRange.maximum]!.dispose();
    super.dispose();
  }

  void updateMinPrice() {
    final text =
        state[PriceRange.minimum]!.text.replaceAll(RegExp(r'[^0-9.]'), '');
    final double parsedValue = double.tryParse(text) ?? 0;

    final formattedValue = parsedValue == 0
        ? ''
        : NumberFormat.decimalPattern().format(parsedValue);

    state[PriceRange.minimum]!.value =
        state[PriceRange.minimum]!.value.copyWith(
              text: formattedValue,
              selection: TextSelection.collapsed(offset: formattedValue.length),
            );
  }

  void updateMaxPrice() {
    final text =
        state[PriceRange.maximum]!.text.replaceAll(RegExp(r'[^0-9.]'), '');
    final double parsedValue = double.tryParse(text) ?? 0;

    final formattedValue = parsedValue == 0
        ? ''
        : NumberFormat.decimalPattern().format(parsedValue);

    state[PriceRange.maximum]!.value =
        state[PriceRange.maximum]!.value.copyWith(
              text: formattedValue,
              selection: TextSelection.collapsed(offset: formattedValue.length),
            );
  }

  void resetPriceRange() {
    state[PriceRange.minimum]!.clear();
    state[PriceRange.maximum]!.clear();
  }
}

final priceRangeFilterStateNotifierProvider = StateNotifierProvider<
    PriceRangeFilterStateNotifier, Map<PriceRange, TextEditingController>>(
  (ref) => PriceRangeFilterStateNotifier(),
);

final priceRangeFilterState = Provider((ref) {
  return ref.watch(priceRangeFilterStateNotifierProvider);
});

final resetPriceRangeFilterState = Provider((ref) {
  return ref
      .read(priceRangeFilterStateNotifierProvider.notifier)
      .resetPriceRange;
});
