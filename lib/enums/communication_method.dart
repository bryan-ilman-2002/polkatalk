enum CommunicationMethod {
  chat,
  all,
}

extension CommunicationMethodExtension on CommunicationMethod {
  String get string {
    switch (this) {
      case CommunicationMethod.chat:
        return 'chat only';
      case CommunicationMethod.all:
        return 'video, audio, and chat';
      default:
        return '';
    }
  }
}
