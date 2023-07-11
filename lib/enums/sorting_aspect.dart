enum SortingAspect {
  dateASC,
  ratingASC,
  priceASC,
  dateDES,
  ratingDES,
  priceDES,
}

extension SortingAspectExtension on SortingAspect {
  String get string {
    switch (this) {
      case SortingAspect.dateASC:
        return 'date ▲';
      case SortingAspect.ratingASC:
        return 'rating ▲';
      case SortingAspect.priceASC:
        return 'price ▲';
      case SortingAspect.dateDES:
        return 'date ▼';
      case SortingAspect.ratingDES:
        return 'rating ▼';
      case SortingAspect.priceDES:
        return 'price ▼';
      default:
        return '';
    }
  }
}
