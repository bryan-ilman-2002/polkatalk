enum Rating {
  three,
  threePointFive,
  four,
  fourPointFive,
}

extension RatingExtension on Rating {
  double get number {
    switch (this) {
      case Rating.three:
        return 3.0;
      case Rating.threePointFive:
        return 3.5;
      case Rating.four:
        return 4.0;
      case Rating.fourPointFive:
        return 4.5;
      default:
        return 0.0;
    }
  }

  String get string {
    switch (this) {
      case Rating.three:
        return '3.0';
      case Rating.threePointFive:
        return '3.5';
      case Rating.four:
        return '4.0';
      case Rating.fourPointFive:
        return '4.5';
      default:
        return '0.0';
    }
  }
}
