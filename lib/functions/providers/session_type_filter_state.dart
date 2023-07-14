import 'package:flutter_riverpod/flutter_riverpod.dart';

class SessionTypeFilterStateNotifier extends StateNotifier<int?> {
  SessionTypeFilterStateNotifier() : super(null);

  void setSessionType(int index) {
    state = index;
  }

  void resetSessionType() {
    state = null;
  }
}

final sessionTypeFilterStateNotifierProvider =
    StateNotifierProvider<SessionTypeFilterStateNotifier, int?>(
  (ref) => SessionTypeFilterStateNotifier(),
);

final sessionTypeFilterState = Provider((ref) {
  return ref.watch(sessionTypeFilterStateNotifierProvider);
});

final setSessionTypeFilterState = Provider((ref) {
  return ref
      .read(sessionTypeFilterStateNotifierProvider.notifier)
      .setSessionType;
});

final resetSessionTypeFilterState = Provider((ref) {
  return ref
      .read(sessionTypeFilterStateNotifierProvider.notifier)
      .resetSessionType;
});
