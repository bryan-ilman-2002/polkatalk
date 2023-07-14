enum SessionType {
  standard,
  charity,
  acquaintanceship,
}

extension SessionTypeExtension on SessionType {
  String get string {
    switch (this) {
      case SessionType.standard:
        return 'Standard';
      case SessionType.charity:
        return 'Charity';
      case SessionType.acquaintanceship:
        return 'Acquaintanceship';
      default:
        return '';
    }
  }
}
