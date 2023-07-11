enum CommunicationMethod {
  chatOnly,
  all,
}

extension CommunicationMethodExtension on CommunicationMethod {
  String get string {
    switch (this) {
      case CommunicationMethod.chatOnly:
        return 'chat only';
      case CommunicationMethod.all:
        return 'video, audio, and chat';
      default:
        return '';
    }
  }
}
