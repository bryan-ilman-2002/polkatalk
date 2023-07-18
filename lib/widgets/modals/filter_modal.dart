import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:polkatalk/enums/communication_method.dart';
import 'package:polkatalk/enums/rating.dart';
import 'package:polkatalk/enums/session_type.dart';
import 'package:polkatalk/enums/sorting_aspect.dart';
import 'package:polkatalk/functions/getters/lang_names_in_native_format.dart';
import 'package:polkatalk/functions/getters/professions.dart';
import 'package:polkatalk/functions/getters/rating_color.dart';
import 'package:polkatalk/functions/providers/communication_method_filter_state.dart';
import 'package:polkatalk/functions/providers/date_range_filter_state.dart';
import 'package:polkatalk/functions/providers/languages_filter_state.dart';
import 'package:polkatalk/functions/providers/price_range_filter_state.dart';
import 'package:polkatalk/functions/providers/professions_filter_state.dart';
import 'package:polkatalk/functions/providers/rating_filter_state.dart';
import 'package:polkatalk/functions/providers/session_type_filter_state.dart';
import 'package:polkatalk/functions/providers/sorting_aspect_filter_state.dart';
import 'package:polkatalk/widgets/buttons/colored_btn.dart';
import 'package:polkatalk/widgets/buttons/radio_btns.dart';
import 'package:polkatalk/widgets/filter_box.dart';
import 'package:polkatalk/widgets/lines/horizontal_thin_line.dart';
import 'package:polkatalk/widgets/date_range_selector.dart';
import 'package:polkatalk/widgets/tag_adder.dart';
import 'package:polkatalk/widgets/text/txt_with_bg.dart';

class FilterModal extends ConsumerWidget {
  const FilterModal({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.close_rounded,
                    color: Colors.grey,
                    size: 30,
                  ),
                ),
              ),
              const Text(
                'Filters',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const HorizontalThinLine(
            horizontalMargin: 0,
          ),
          Expanded(
            child: ListView(
              children: [
                // session type
                FilterBox(
                  title: 'Session Type',
                  child: RadioButtons(
                    callbackFunction: ref.watch(setSessionTypeFilterState),
                    labels:
                        SessionType.values.map((type) => type.string).toList(),
                    groupValue: ref.watch(sessionTypeFilterState),
                  ),
                ),
                const HorizontalThinLine(
                  horizontalMargin: 20,
                ),
                // professions, interests
                FilterBox(
                  title: ref.watch(resetSessionTypeFilterState) == 2
                      ? 'Interests'
                      : 'Professions',
                  // resetMechanism: () {
                  //   ref.watch(resetControllerForFilteringProfessions)();
                  //   ref.watch(resetListOfSelectedProfessions)();
                  // },
                  child: TagAdder(
                    callbackFunction: () {
                      String matchingKey =
                          ref.watch(validateProfessionSelection)();
                      ref.watch(createProfessionTag)(matchingKey);
                    },
                    clerk: ref.watch(controllerForFilteringProfessions),
                    entries: professions,
                    prints: ref.watch(listOfSelectedProfessions),
                    hint: 'Preferred Professions',
                    leadingIcon: Icons.search_rounded,
                  ),
                ),
                const HorizontalThinLine(
                  horizontalMargin: 20,
                ),
                // date range
                FilterBox(
                  title: 'Date Range',
                  child: const DateRangeSelector(),
                ),
                const HorizontalThinLine(
                  horizontalMargin: 20,
                ),
                // language
                FilterBox(
                  title: 'Languages',
                  // resetMechanism: () {
                  //   ref.watch(resetControllerForFilteringLanguages)();
                  //   ref.watch(resetListOfSelectedLanguages)();
                  // },
                  child: TagAdder(
                    callbackFunction: () {
                      String matchingKey =
                          ref.watch(validateLanguageSelection)();
                      ref.watch(createLanguageTag)(matchingKey);
                    },
                    clerk: ref.watch(controllerForFilteringLanguages),
                    entries: languageNamesInNativeFormat,
                    prints: ref.watch(listOfSelectedLanguages),
                    hint: 'Preferred Languages',
                    leadingIcon: Icons.keyboard_arrow_down_rounded,
                  ),
                ),
                const HorizontalThinLine(
                  horizontalMargin: 20,
                ),
                // communication method
                FilterBox(
                  title: 'Communication Method',
                  child: RadioButtons(
                    callbackFunction:
                        ref.watch(setCommunicationMethodFilterState),
                    labels: CommunicationMethod.values
                        .map((type) => type.string)
                        .toList(),
                    groupValue: ref.watch(communicationMethodFilterState),
                  ),
                ),
                const HorizontalThinLine(
                  horizontalMargin: 20,
                ),
                const Column(
                  // city, country
                  children: [
                    Row(),
                    Row(),
                    Row(),
                  ],
                ),
                const HorizontalThinLine(
                  horizontalMargin: 20,
                ),
                // rating
                FilterBox(
                  title: 'Rating',
                  child: RadioButtons(
                    callbackFunction: ref.watch(setRatingFilterState),
                    labels: Rating.values
                        .map(
                          (type) => Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Text('≥'),
                              const SizedBox(
                                width: 4,
                              ),
                              TextWithBackground(
                                text: type.string,
                                backgroundColor: getRatingColor(type.number),
                              ),
                            ],
                          ),
                        )
                        .toList(),
                    direction: Axis.horizontal,
                    mainSpacing: 1.2,
                    groupValue: ref.watch(ratingFilterState),
                  ),
                ),
                const HorizontalThinLine(
                  horizontalMargin: 20,
                ),
                // sorting aspect
                FilterBox(
                  title: 'Sorting Aspect',
                  child: Center(
                    child: SizedBox(
                      width: 320,
                      child: RadioButtons(
                        callbackFunction:
                            ref.watch(setSortingAspectFilterState),
                        labels: SortingAspect.values
                            .map((type) => type.string)
                            .toList(),
                        direction: Axis.horizontal,
                        groupValue: ref.watch(sortingAspectFilterState),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const HorizontalThinLine(
            horizontalMargin: 0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ColoredButton(
                  width: 160,
                  verticalPadding: 16,
                  callbackFunction: ref.watch(resetDateRangeFilterState),
                  child: Text(
                    'Reset All',
                  ),
                ),
                ColoredButton(
                  width: 160,
                  verticalPadding: 16,
                  callbackFunction: ref.watch(resetDateRangeFilterState),
                  child: Text(
                    'Apply',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  buttonColor: Colors.black,
                  splashColor: const Color.fromARGB(255, 112, 112, 112),
                  basicBorderRadius: 8,
                  borderColor: Colors.black,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
