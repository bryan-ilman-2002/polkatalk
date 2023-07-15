import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:polkatalk/functions/getters/professions.dart';

class ControllerForFilteringProfessions
    extends StateNotifier<TextEditingController> {
  ControllerForFilteringProfessions() : super(TextEditingController());

  @override
  void dispose() {
    state.dispose();
    super.dispose();
  }

  String validateSelection() {
    final String lowercaseInput = state.text.toLowerCase();
    final String matchingKey = professions.keys.firstWhere(
        (key) => key.toLowerCase() == lowercaseInput,
        orElse: () => '');

    return matchingKey;
  }

  void resetController() {
    state.clear();
  }
}

final controllerForFilteringProfessionsProxy = StateNotifierProvider<
    ControllerForFilteringProfessions, TextEditingController>(
  (ref) => ControllerForFilteringProfessions(),
);

final controllerForFilteringProfessions = Provider((ref) {
  return ref.watch(controllerForFilteringProfessionsProxy);
});

final validateProfessionSelection = Provider((ref) {
  return ref
      .read(controllerForFilteringProfessionsProxy.notifier)
      .validateSelection;
});

final resetControllerForFilteringProfessions = Provider((ref) {
  return ref
      .read(controllerForFilteringProfessionsProxy.notifier)
      .resetController;
});

class ListOfSelectedProfessions extends StateNotifier<List<String>> {
  ListOfSelectedProfessions() : super([]);

  void createTag(String matchingKey) {
    if (matchingKey != '' && !state.contains(matchingKey)) {
      if (state.length >= 4) {
        state.removeAt(0);
      }

      state = <String>[...state, matchingKey];
    }
  }

  void resetList() {
    state = <String>[];
  }
}

final listOfSelectedProfessionsProxy =
    StateNotifierProvider<ListOfSelectedProfessions, List<String>>(
  (ref) => ListOfSelectedProfessions(),
);

final listOfSelectedProfessions = Provider((ref) {
  return ref.watch(listOfSelectedProfessionsProxy);
});

final createProfessionTag = Provider((ref) {
  return ref.read(listOfSelectedProfessionsProxy.notifier).createTag;
});

final resetListOfSelectedProfessions = Provider((ref) {
  return ref.read(listOfSelectedProfessionsProxy.notifier).resetList;
});
