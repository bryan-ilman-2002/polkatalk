enum SessionType {
  standard,
  charity,
  acquaintanceship,
}

extension SessionTypeExtension on SessionType {
  String get string {
    switch (this) {
      case SessionType.standard:
        return 'standard';
      case SessionType.charity:
        return 'charity';
      case SessionType.acquaintanceship:
        return 'acquaintanceship';
      default:
        return '';
    }
  }
}
