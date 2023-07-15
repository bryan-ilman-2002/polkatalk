import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:polkatalk/functions/getters/lang_names_in_native_format.dart';

class ControllerForFilteringLanguages
    extends StateNotifier<TextEditingController> {
  ControllerForFilteringLanguages() : super(TextEditingController());

  @override
  void dispose() {
    state.dispose();
    super.dispose();
  }

  String validateSelection() {
    final String lowercaseInput = state.text.toLowerCase();
    final String matchingKey = languageNamesInNativeFormat.keys.firstWhere(
        (key) => key.toLowerCase() == lowercaseInput,
        orElse: () => '');

    return matchingKey;
  }

  void resetController() {
    state.clear();
  }
}

final controllerForFilteringLanguagesProxy = StateNotifierProvider<
    ControllerForFilteringLanguages, TextEditingController>(
  (ref) => ControllerForFilteringLanguages(),
);

final controllerForFilteringLanguages = Provider((ref) {
  return ref.watch(controllerForFilteringLanguagesProxy);
});

final validateLanguageSelection = Provider((ref) {
  return ref
      .read(controllerForFilteringLanguagesProxy.notifier)
      .validateSelection;
});

final resetControllerForFilteringLanguages = Provider((ref) {
  return ref
      .read(controllerForFilteringLanguagesProxy.notifier)
      .resetController;
});

class ListOfSelectedLanguages extends StateNotifier<List<String>> {
  ListOfSelectedLanguages() : super([]);

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

final listOfSelectedLanguagesProxy =
    StateNotifierProvider<ListOfSelectedLanguages, List<String>>(
  (ref) => ListOfSelectedLanguages(),
);

final listOfSelectedLanguages = Provider((ref) {
  return ref.watch(listOfSelectedLanguagesProxy);
});

final createLanguageTag = Provider((ref) {
  return ref.read(listOfSelectedLanguagesProxy.notifier).createTag;
});

final resetListOfSelectedLanguages = Provider((ref) {
  return ref.read(listOfSelectedLanguagesProxy.notifier).resetList;
});
