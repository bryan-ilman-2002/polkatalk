import 'package:flutter_riverpod/flutter_riverpod.dart';

class CommunicationMethodFilterStateNotifier extends StateNotifier<int?> {
  CommunicationMethodFilterStateNotifier() : super(null);

  void setCommunicationMethod(int index) {
    state = index;
  }

  void resetCommunicationMethod() {
    state = null;
  }
}

final communicationMethodFilterStateNotifierProvider =
    StateNotifierProvider<CommunicationMethodFilterStateNotifier, int?>(
  (ref) => CommunicationMethodFilterStateNotifier(),
);

final communicationMethodFilterState = Provider((ref) {
  return ref.watch(communicationMethodFilterStateNotifierProvider);
});

final setCommunicationMethodFilterState = Provider((ref) {
  return ref
      .read(communicationMethodFilterStateNotifierProvider.notifier)
      .setCommunicationMethod;
});

final resetCommunicationMethodFilterState = Provider((ref) {
  return ref
      .read(communicationMethodFilterStateNotifierProvider.notifier)
      .resetCommunicationMethod;
});
