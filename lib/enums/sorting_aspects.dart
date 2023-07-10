enum SortingAspects {
  dateASC,
  ratingASC,
  priceASC,
  dateDES,
  ratingDES,
  priceDES,
}

extension SortingAspectsExtension on SortingAspects {
  String get string {
    switch (this) {
      case SortingAspects.dateASC:
        return 'date ▲';
      case SortingAspects.ratingASC:
        return 'rating ▲';
      case SortingAspects.priceASC:
        return 'price ▲';
      case SortingAspects.dateDES:
        return 'date ▼';
      case SortingAspects.ratingDES:
        return 'rating ▼';
      case SortingAspects.priceDES:
        return 'price ▼';
      default:
        return '';
    }
  }
}
