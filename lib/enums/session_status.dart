enum SessionStatus {
  scheduled,
  completed,
}

extension SessionStatusExtension on SessionStatus {
  String get string {
    switch (this) {
      case SessionStatus.scheduled:
        return 'scheduled';
      case SessionStatus.completed:
        return 'completed';
      default:
        return '';
    }
  }
}
