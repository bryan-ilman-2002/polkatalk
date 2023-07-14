import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:polkatalk/enums/communication_method.dart';
import 'package:polkatalk/enums/rating.dart';
import 'package:polkatalk/enums/session_type.dart';
import 'package:polkatalk/enums/sorting_aspect.dart';
import 'package:polkatalk/functions/getters/lang_names_in_native_format.dart';
import 'package:polkatalk/functions/getters/rating_color.dart';
import 'package:polkatalk/functions/providers/session_type_filter_state.dart';
import 'package:polkatalk/widgets/buttons/colored_btn.dart';
import 'package:polkatalk/widgets/buttons/radio_btns.dart';
import 'package:polkatalk/widgets/filter_box.dart';
import 'package:polkatalk/widgets/lines/horizontal_thin_line.dart';
import 'package:polkatalk/widgets/price_input.dart';
import 'package:polkatalk/widgets/date_range_selector.dart';
import 'package:polkatalk/widgets/tag_adder.dart';
import 'package:polkatalk/widgets/text/txt_with_bg.dart';

class FilterModal extends ConsumerStatefulWidget {
  const FilterModal({super.key});

  @override
  ConsumerState<FilterModal> createState() => _FilterModalState();
}

class _FilterModalState extends ConsumerState<FilterModal> {
  void _resetSessionType() {
    setState(() {
      ref.watch(resetSessionTypeFilterState)();
    });
  }

  // date range

  DateTime? _startDate;
  DateTime? _endDate;

  void _setStartDate(DateTime selectedDate) {
    _startDate = selectedDate;
  }

  void _setEndDate(DateTime selectedDate) {
    _endDate = selectedDate;
  }

  void _resetDate() {
    _startDate = null;
    _endDate = null;
  }

  // communication method

  int? _communicationMethod;

  void _setCommunicationMethod(int index) {
    _communicationMethod = index;
  }

  void _resetCommunicationMethod() {
    _communicationMethod = null;
  }

  // rating

  int? _rating;

  void _setRating(int index) {
    _rating = index;
  }

  void _resetRating() {
    _rating = null;
  }

  // sorting aspect

  int? _sortingAspect;

  void _setSortingAspect(int index) {
    _sortingAspect = index;
  }

  void _resetSortingAspect() {
    _sortingAspect = null;
  }

  final TextEditingController _minController = TextEditingController();
  final TextEditingController _maxController = TextEditingController();
  double? minPrice;
  double? maxPrice;

  @override
  void initState() {
    super.initState();
    _minController.addListener(_updateMinPrice);
    _maxController.addListener(_updateMaxPrice);
  }

  @override
  void dispose() {
    _minController.dispose();
    _maxController.dispose();
    super.dispose();
  }

  void _updateMinPrice() {
    final text = _minController.text.replaceAll(RegExp(r'[^0-9.]'), '');
    final double parsedValue = double.tryParse(text) ?? 0;

    final formattedValue = parsedValue == 0
        ? ''
        : NumberFormat.decimalPattern().format(parsedValue);

    _minController.value = _minController.value.copyWith(
      text: formattedValue,
      selection: TextSelection.collapsed(offset: formattedValue.length),
    );

    setState(() {
      minPrice = parsedValue;
    });
  }

  void _updateMaxPrice() {
    final text = _maxController.text.replaceAll(RegExp(r'[^0-9.]'), '');
    final double parsedValue = double.tryParse(text) ?? 0;

    final formattedValue = parsedValue == 0
        ? ''
        : NumberFormat.decimalPattern().format(parsedValue);

    _maxController.value = _maxController.value.copyWith(
      text: formattedValue,
      selection: TextSelection.collapsed(offset: formattedValue.length),
    );

    setState(() {
      maxPrice = parsedValue;
    });
  }

  void _resetPriceRange() {
    _minController.clear();
    _maxController.clear();

    setState(() {
      maxPrice = null;
      maxPrice = null;
    });
  }

  @override
  Widget build(BuildContext context) {
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
                  resetMechanism: _resetSessionType,
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
                // professions or skills, interests
                FilterBox(
                  title: _rating == 2 ? 'Interests' : 'Professions or Skills',
                  resetMechanism: _resetDate,
                  child: TagAdder(
                    callbackFunction: _resetDate,
                    clerk: _minController,
                    entries: languageNamesInNativeFormat,
                    prints: const ['Doctor'],
                    trailingIcon: Icons.search_rounded,
                  ),
                ),
                const HorizontalThinLine(
                  horizontalMargin: 20,
                ),
                // date range
                FilterBox(
                  title: 'Date Range',
                  resetMechanism: _resetDate,
                  child: DateRangeSelector(
                    startDateCallbackFunction: _setStartDate,
                    endDateCallbackFunction: _setEndDate,
                  ),
                ),
                const HorizontalThinLine(
                  horizontalMargin: 20,
                ),
                // language
                FilterBox(
                  title: 'Languages',
                  resetMechanism: _resetDate,
                  child: TagAdder(
                    callbackFunction: _resetDate,
                    clerk: _minController,
                    entries: languageNamesInNativeFormat,
                    hint: 'add a language',
                  ),
                ),
                const HorizontalThinLine(
                  horizontalMargin: 20,
                ),
                // communication method
                FilterBox(
                  title: 'Communication Method',
                  resetMechanism: _resetCommunicationMethod,
                  child: RadioButtons(
                    callbackFunction: _setCommunicationMethod,
                    labels: CommunicationMethod.values
                        .map((type) => type.string)
                        .toList(),
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
                  resetMechanism: _resetRating,
                  child: RadioButtons(
                    callbackFunction: _setRating,
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
                  ),
                ),
                const HorizontalThinLine(
                  horizontalMargin: 20,
                ),
                // price range
                FilterBox(
                  title: 'Price Range',
                  resetMechanism: _resetDate,
                  child: Row(
                    children: [
                      Expanded(
                        child: PriceInput(
                          clerk: _minController,
                          currency: 'USD',
                          label: 'minimum',
                        ),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Expanded(
                        child: PriceInput(
                          clerk: _maxController,
                          currency: 'USD',
                          label: 'maximum',
                        ),
                      ),
                    ],
                  ),
                ),
                const HorizontalThinLine(
                  horizontalMargin: 20,
                ),
                // sorting aspect
                FilterBox(
                  title: 'Sorting Aspect',
                  resetMechanism: _resetSortingAspect,
                  child: Center(
                    child: SizedBox(
                      width: 320,
                      child: RadioButtons(
                        callbackFunction: _setSortingAspect,
                        labels: SortingAspect.values
                            .map((type) => type.string)
                            .toList(),
                        direction: Axis.horizontal,
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
                  callbackFunction: _resetDate,
                  text: 'Reset All',
                ),
                ColoredButton(
                  width: 160,
                  verticalPadding: 16,
                  callbackFunction: _resetDate,
                  text: 'Apply',
                  textColor: Colors.white,
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
