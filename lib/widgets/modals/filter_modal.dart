import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:polkatalk/enums/communication_method.dart';
import 'package:polkatalk/enums/rating.dart';
import 'package:polkatalk/functions/getters/app_colors.dart';
import 'package:polkatalk/functions/getters/heavy_shadow.dart';
import 'package:polkatalk/functions/getters/lang_names_in_native_format.dart';
import 'package:polkatalk/functions/getters/professions.dart';
import 'package:polkatalk/functions/getters/rating_color.dart';
import 'package:polkatalk/functions/providers/communication_method_filter_state.dart';
import 'package:polkatalk/functions/providers/date_range_filter_state.dart';
import 'package:polkatalk/functions/providers/languages_filter_state.dart';
import 'package:polkatalk/functions/providers/professions_filter_state.dart';
import 'package:polkatalk/functions/providers/rating_filter_state.dart';
import 'package:polkatalk/widgets/buttons/colored_btn.dart';
import 'package:polkatalk/widgets/buttons/radio_btns.dart';
import 'package:polkatalk/widgets/custom_scroll_behavior.dart';
import 'package:polkatalk/widgets/filter_box.dart';
import 'package:polkatalk/widgets/lines/horizontal_thin_line.dart';
import 'package:polkatalk/widgets/date_range_selector.dart';
import 'package:polkatalk/widgets/tag_adder.dart';
import 'package:polkatalk/widgets/text/txt_with_bg.dart';

class FilterModal extends ConsumerWidget {
  final bool trustEarned;

  const FilterModal({
    super.key,
    this.trustEarned = false,
  });

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
                  child: Icon(
                    Icons.close_rounded,
                    size: 24,
                    color: moderateGray,
                  ),
                ),
              ),
              Text(
                'Filters',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: heavyGray,
                ),
              ),
            ],
          ),
          const HorizontalThinLine(
            horizontalMargin: 0,
          ),
          Expanded(
            child: ScrollConfiguration(
              behavior: CustomScrollBehavior(),
              child: ListView(
                children: [
                  // interests
                  FilterBox(
                    title: 'Interests',
                    child: TagAdder(
                      callbackFunction: () {
                        String matchingKey =
                            ref.watch(validateProfessionSelection)();
                        ref.watch(createProfessionTag)(matchingKey);
                      },
                      clerk: ref.watch(controllerForFilteringProfessions),
                      entries: professions,
                      enableInput: true,
                      prints: ref.watch(listOfSelectedProfessions),
                      hint: 'Preferred Interest',
                      leadingIcon: Icons.search_rounded,
                    ),
                  ),
                  // date range
                  const FilterBox(
                    title: 'Date Range',
                    child: DateRangeSelector(),
                  ),
                  // languages
                  FilterBox(
                    title: 'Languages',
                    child: TagAdder(
                      callbackFunction: () {
                        String matchingKey =
                            ref.watch(validateLanguageSelection)();
                        ref.watch(createLanguageTag)(matchingKey);
                      },
                      clerk: ref.watch(controllerForFilteringLanguages),
                      entries: languageNamesInNativeFormat,
                      prints: ref.watch(listOfSelectedLanguages),
                      hint: 'Preferred Language',
                      leadingIcon: Icons.keyboard_arrow_down_rounded,
                    ),
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
                  // locations
                  trustEarned
                      ? const FilterBox(
                          title: 'Locations',
                          child: SizedBox(),
                        )
                      : const SizedBox(),
                  // rating
                  FilterBox(
                    title: 'Rating',
                    thisIsLast: true,
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
                ],
              ),
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
                  buttonColor: Colors.white,
                  basicBorderRadius: 12,
                  borderColor: Colors.transparent,
                  child: Text(
                    'Reset',
                    style: TextStyle(
                      color: heavyGray,
                    ),
                  ),
                ),
                ColoredButton(
                  width: 160,
                  verticalPadding: 16,
                  callbackFunction: ref.watch(resetDateRangeFilterState),
                  buttonColor: heavyGray,
                  basicBorderRadius: 12,
                  borderColor: Colors.transparent,
                  buttonShadow: heavyShadow,
                  child: const Text(
                    'Apply',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
