enum Opinion {
  good,
  neutral,
  bad,
}

extension OpinionExtension on Opinion {
  String get string {
    switch (this) {
      case Opinion.good:
        return 'good';
      case Opinion.neutral:
        return 'neutral';
      case Opinion.bad:
        return 'bad';
      default:
        return '';
    }
  }
}
