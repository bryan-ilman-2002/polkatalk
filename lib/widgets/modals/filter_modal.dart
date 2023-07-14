import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:polkatalk/enums/communication_method.dart';
import 'package:polkatalk/enums/language.dart';
import 'package:polkatalk/enums/rating.dart';
import 'package:polkatalk/enums/session_type.dart';
import 'package:polkatalk/enums/sorting_aspect.dart';
import 'package:polkatalk/functions/getters/lang_names_in_native_format.dart';
import 'package:polkatalk/functions/getters/rating_color.dart';
import 'package:polkatalk/widgets/buttons/colored_btn.dart';
import 'package:polkatalk/widgets/buttons/radio_btns.dart';
import 'package:polkatalk/widgets/filter_box.dart';
import 'package:polkatalk/widgets/filter_heading.dart';
import 'package:polkatalk/widgets/lines/horizontal_thin_line.dart';
import 'package:polkatalk/widgets/price_input.dart';
import 'package:polkatalk/widgets/search_field.dart';
import 'package:polkatalk/widgets/tag.dart';
import 'package:polkatalk/widgets/tag_board.dart';
import 'package:polkatalk/widgets/tag_adder_dropdown.dart';
import 'package:polkatalk/widgets/text/txt_with_bg.dart';

class FilterModal extends StatefulWidget {
  const FilterModal({super.key});

  @override
  State<FilterModal> createState() => _FilterModalState();
}

class _FilterModalState extends State<FilterModal> {
  int? _sessionType;

  final TextEditingController _topic = TextEditingController();

  DateTime? startDate;
  DateTime? endDate;

  Future<TimeOfDay?> _selectTime(BuildContext context) async {
    return showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
  }

  Future<void> _selectStartDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 90)),
      locale:
          Locale.fromSubtags(languageCode: Platform.localeName.substring(0, 2)),
    );

    if (picked != null) {
      final TimeOfDay? selectedTime = await _selectTime(context);

      if (selectedTime != null) {
        final DateTime selectedDateTime = DateTime(
          picked.year,
          picked.month,
          picked.day,
          selectedTime.hour,
          selectedTime.minute,
        );

        setState(() {
          if (endDate != null && selectedDateTime.isAfter(endDate!)) {
            endDate = null;
          }
          startDate = selectedDateTime;
        });
      }
    }
  }

  Future<void> _selectEndDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: startDate ?? DateTime.now(),
      firstDate: endDate ?? DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 90)),
      locale:
          Locale.fromSubtags(languageCode: Platform.localeName.substring(0, 2)),
    );

    if (picked != null) {
      final TimeOfDay? selectedTime = await _selectTime(context);

      if (selectedTime != null) {
        final DateTime selectedDateTime = DateTime(
          picked.year,
          picked.month,
          picked.day,
          selectedTime.hour,
          selectedTime.minute,
        );

        setState(() {
          if (startDate != null && selectedDateTime.isBefore(startDate!)) {
            startDate = null;
          }
          endDate = selectedDateTime;
        });
      }
    }
  }

  void _resetDate() {
    setState(() {
      startDate = null;
      endDate = null;
    });
  }

  final TextEditingController langController = TextEditingController();
  Language? selectedLang;

  int? _communicationMethod;

  void _resetCommunicationMethod() {
    setState(() {
      _communicationMethod = null;
    });
  }

  int? _rating;

  void _resetRating() {
    setState(() {
      _rating = null;
    });
  }

  int? _sortingAspect;

  void _resetSortingAspect() {
    setState(() {
      _sortingAspect = null;
    });
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
    final dateFormat = DateFormat.yMd().add_Hm();

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
            verticalMargin: EdgeInsets.all(0),
          ),
          Expanded(
            child: ListView(
              children: [
                // session type
                FilterBox(
                  title: 'Session Type',
                  resetMechanism: _resetDate,
                  child: RadioButtons(
                    labels:
                        SessionType.values.map((type) => type.string).toList(),
                  ),
                ),
                const HorizontalThinLine(
                  verticalMargin: EdgeInsets.symmetric(horizontal: 20),
                ),
                // professions or skills, interests
                FilterBox(
                  title:
                      _sessionType == 2 ? 'Interests' : 'Professions or Skills',
                  resetMechanism: _resetDate,
                  child: child,
                ),

                const HorizontalThinLine(
                  verticalMargin: EdgeInsets.symmetric(horizontal: 20),
                ),
                Column(
                  // date
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: FilterHeading(
                        title: 'Date Range',
                        resetMechanism: _resetDate,
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ColoredButton(
                          width: 260,
                          verticalPadding: 16,
                          callbackFunction: _selectStartDate,
                          text: startDate == null
                              ? 'Start Date'
                              : 'Start Date: ${dateFormat.format(startDate!)}',
                          textColor: Colors.white,
                          buttonColor: Colors.black,
                          splashColor: const Color.fromARGB(255, 112, 112, 112),
                          borderColor: Colors.black,
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        ColoredButton(
                          width: 260,
                          verticalPadding: 16,
                          callbackFunction: _selectEndDate,
                          text: endDate == null
                              ? 'End Date'
                              : 'End Date: ${dateFormat.format(endDate!)}',
                          textColor: Colors.white,
                          buttonColor: Colors.black,
                          splashColor: const Color.fromARGB(255, 112, 112, 112),
                          borderColor: Colors.black,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                  ],
                ),
                const HorizontalThinLine(
                  verticalMargin: EdgeInsets.symmetric(horizontal: 20),
                ),
                Column(
                  // language
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: FilterHeading(
                        title: 'Languages',
                        resetMechanism: _resetDate,
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TagAdderDropdown(
                                clerk: langController,
                                entries: languageNamesInNativeFormat,
                                hint: 'add a language',
                              ),
                              ColoredButton(
                                width: 55,
                                height: 56.8,
                                callbackFunction: _resetDate,
                                text: '+',
                                textSize: 24,
                                textWeight: FontWeight.bold,
                                textColor: Colors.white,
                                buttonColor: Colors.black,
                                splashColor:
                                    const Color.fromARGB(255, 112, 112, 112),
                                customBorderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(8),
                                  bottomRight: Radius.circular(8),
                                ),
                                borderColor: Colors.black,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          const TagBoard(
                            prints: [
                              'English',
                              'Frecnch',
                              'German',
                              'Portuguese',
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                  ],
                ),
                const HorizontalThinLine(
                  verticalMargin: EdgeInsets.symmetric(horizontal: 20),
                ),
                Column(
                  // communication method
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: FilterHeading(
                        title: 'Communication Method',
                        resetMechanism: _resetDate,
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: RadioButtons(
                        labels: CommunicationMethod.values
                            .map((type) => type.string)
                            .toList(),
                      ),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                  ],
                ),
                const HorizontalThinLine(
                  verticalMargin: EdgeInsets.symmetric(horizontal: 20),
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
                  verticalMargin: EdgeInsets.symmetric(horizontal: 20),
                ),
                Column(
                  // rating
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: FilterHeading(
                        title: 'Rating',
                        resetMechanism: _resetDate,
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: RadioButtons(
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
                                    backgroundColor:
                                        getRatingColor(type.number),
                                  ),
                                ],
                              ),
                            )
                            .toList(),
                      ),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                  ],
                ),
                const HorizontalThinLine(
                  verticalMargin: EdgeInsets.symmetric(horizontal: 20),
                ),
                Column(
                  // price range
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: FilterHeading(
                        title: 'Price Range',
                        resetMechanism: _resetDate,
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Expanded(
                            child: PriceInput(
                              clerk: _minController,
                              label: 'minimum',
                            ),
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          Expanded(
                            child: PriceInput(
                              clerk: _maxController,
                              label: 'maximum',
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                  ],
                ),
                const HorizontalThinLine(
                  verticalMargin: EdgeInsets.symmetric(horizontal: 20),
                ),
                Column(
                  // sorting aspect
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: FilterHeading(
                        title: 'Sorting Aspect',
                        resetMechanism: _resetDate,
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: Center(
                        child: SizedBox(
                          width: 320,
                          child: RadioButtons(
                            labels: SortingAspect.values
                                .map((type) => type.string)
                                .toList(),
                            direction: Axis.horizontal,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                  ],
                ),
              ],
            ),
          ),
          const HorizontalThinLine(
            verticalMargin: EdgeInsets.all(0),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // ColoredButton(
                //   text: 'Reset All',
                //   textWeight: FontWeight.bold,
                //   borderRadius: 8,
                //   borderColor: Colors.black,
                // ),
                // ColoredButton(
                //   text: 'Apply',
                //   textWeight: FontWeight.bold,
                //   normalButtonColor: Colors.black,
                //   pressedButtonColor: Color.fromARGB(255, 112, 112, 112),
                //   borderRadius: 8,
                //   borderColor: Colors.black,
                //   textColor: Colors.white,
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
