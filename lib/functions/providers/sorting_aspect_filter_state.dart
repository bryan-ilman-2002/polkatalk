import 'package:flutter_riverpod/flutter_riverpod.dart';

class SortingAspectFilterStateNotifier extends StateNotifier<int?> {
  SortingAspectFilterStateNotifier() : super(null);

  void setSortingAspect(int index) {
    state = index;
  }

  void resetSortingAspect() {
    state = null;
  }
}

final sortingAspectFilterStateNotifierProvider =
    StateNotifierProvider<SortingAspectFilterStateNotifier, int?>(
  (ref) => SortingAspectFilterStateNotifier(),
);

final sortingAspectFilterState = Provider((ref) {
  return ref.watch(sortingAspectFilterStateNotifierProvider);
});

final setSortingAspectFilterState = Provider((ref) {
  return ref
      .read(sortingAspectFilterStateNotifierProvider.notifier)
      .setSortingAspect;
});

final resetSortingAspectFilterState = Provider((ref) {
  return ref
      .read(sortingAspectFilterStateNotifierProvider.notifier)
      .resetSortingAspect;
});
