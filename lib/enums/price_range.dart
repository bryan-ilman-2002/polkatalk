enum PriceRange {
  minimum,
  maximum,
}

extension PriceRangeExtension on PriceRange {
  String get string {
    switch (this) {
      case PriceRange.minimum:
        return 'minimum';
      case PriceRange.maximum:
        return 'maximum';
      default:
        return '';
    }
  }
}
