import 'package:flutter_riverpod/flutter_riverpod.dart';

class RatingFilterStateNotifier extends StateNotifier<int?> {
  RatingFilterStateNotifier() : super(null);

  void setRating(int index) {
    state = index;
  }

  void resetRating() {
    state = null;
  }
}

final ratingFilterStateNotifierProvider =
    StateNotifierProvider<RatingFilterStateNotifier, int?>(
  (ref) => RatingFilterStateNotifier(),
);

final ratingFilterState = Provider((ref) {
  return ref.watch(ratingFilterStateNotifierProvider);
});

final setRatingFilterState = Provider((ref) {
  return ref.read(ratingFilterStateNotifierProvider.notifier).setRating;
});

final resetRatingFilterState = Provider((ref) {
  return ref.read(ratingFilterStateNotifierProvider.notifier).resetRating;
});
