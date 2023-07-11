import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:polkatalk/enums/communication_method.dart';
import 'package:polkatalk/enums/language_name.dart';
import 'package:polkatalk/enums/rating.dart';
import 'package:polkatalk/enums/session_type.dart';
import 'package:polkatalk/enums/sorting_aspect.dart';
import 'package:polkatalk/functions/getters/lang_names_in_native_format.dart';
import 'package:polkatalk/functions/getters/rating_color.dart';
import 'package:polkatalk/widgets/buttons/colored_btn.dart';
import 'package:polkatalk/widgets/lines/horizontal_thin_line.dart';
import 'package:polkatalk/widgets/search_field.dart';
import 'package:polkatalk/widgets/tag.dart';
import 'package:polkatalk/widgets/tags_adder_dropdown.dart.dart';
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
  LanguageName? selectedLang;

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
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context); // Close the bottom sheet
                  },
                  child: const Icon(
                    Icons.close_rounded,
                    color: Colors.grey,
                    size: 30,
                  ),
                ),
              ),
              const Text(
                'Filter',
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
                Column(
                  // session type
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Session Type',
                            style: TextStyle(
                              fontSize: 22,
                            ),
                          ),
                          ColoredButton(
                            width: 72,
                            height: 8,
                            text: 'Reset',
                            fontWeight: FontWeight.bold,
                            borderRadius: 8,
                            borderColor: Colors.black,
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _sessionType = 0;
                              });
                            },
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: Radio<int>(
                                    value: 0,
                                    groupValue: _sessionType,
                                    activeColor: Colors.black,
                                    onChanged: (int? value) {
                                      setState(() {
                                        _sessionType = value!;
                                      });
                                    },
                                  ),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  SessionType.standard.string,
                                ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _sessionType = 1;
                              });
                            },
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: Radio<int>(
                                    value: 1,
                                    groupValue: _sessionType,
                                    activeColor: Colors.black,
                                    onChanged: (int? value) {
                                      setState(() {
                                        _sessionType = value!;
                                      });
                                    },
                                  ),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  SessionType.charity.string,
                                ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _sessionType = 2;
                              });
                            },
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: Radio<int>(
                                    value: 2,
                                    groupValue: _sessionType,
                                    activeColor: Colors.black,
                                    onChanged: (int? value) {
                                      setState(() {
                                        _sessionType = value!;
                                      });
                                    },
                                  ),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  SessionType.acquaintanceship.string,
                                ),
                              ],
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
                  // professions or skills, interests
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            _sessionType == 2
                                ? 'Interests'
                                : 'Professions or Skills',
                            style: const TextStyle(
                              fontSize: 22,
                            ),
                          ),
                          const ColoredButton(
                            width: 72,
                            height: 8,
                            text: 'Reset',
                            fontWeight: FontWeight.bold,
                            borderRadius: 8,
                            borderColor: Colors.black,
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: SearchField(
                        clerk: _topic,
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Wrap(
                        alignment: WrapAlignment.center,
                        spacing: 8,
                        runSpacing: 8,
                        children: [
                          Tag(
                            text: 'doctor',
                          ),
                          Tag(
                            text: 'lawyer',
                          ),
                          Tag(
                            text: 'teacher',
                          ),
                          Tag(
                            text: 'software engineer',
                          ),
                          Tag(
                            text: 'linguist',
                          ),
                          Tag(
                            text: 'fire brigade',
                          ),
                          Tag(
                            text: 'influencer',
                          ),
                          Tag(
                            text: 'novelist',
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 32,
                    )
                  ],
                ),
                const HorizontalThinLine(
                  verticalMargin: EdgeInsets.symmetric(horizontal: 20),
                ),
                Column(
                  // date
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            'Date Range',
                            style: TextStyle(
                              fontSize: 22,
                            ),
                          ),
                          ColoredButton(
                            width: 72,
                            height: 8,
                            callbackFunction: _resetDate,
                            text: 'Reset',
                            fontWeight: FontWeight.bold,
                            borderRadius: 8,
                            borderColor: Colors.black,
                          )
                        ],
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
                          callbackFunction: () => _selectStartDate(context),
                          text: startDate == null
                              ? 'Select Start Date'
                              : 'Start Date: ${dateFormat.format(startDate!)}',
                          textColor: Colors.white,
                          normalButtonColor: Colors.black,
                          pressedButtonColor:
                              const Color.fromARGB(255, 112, 112, 112),
                          borderColor: Colors.black,
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        ColoredButton(
                          width: 260,
                          callbackFunction: () => _selectEndDate(context),
                          text: endDate == null
                              ? 'Select End Date'
                              : 'End Date: ${dateFormat.format(endDate!)}',
                          textColor: Colors.white,
                          normalButtonColor: Colors.black,
                          pressedButtonColor:
                              const Color.fromARGB(255, 112, 112, 112),
                          borderColor: Colors.black,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    const Row(),
                  ],
                ),
                const HorizontalThinLine(
                  verticalMargin: EdgeInsets.symmetric(horizontal: 20),
                ),
                Column(
                  // language
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Languages',
                            style: TextStyle(
                              fontSize: 22,
                            ),
                          ),
                          ColoredButton(
                            width: 72,
                            height: 8,
                            text: 'Reset',
                            fontWeight: FontWeight.bold,
                            borderRadius: 8,
                            borderColor: Colors.black,
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      children: [
                        TagsAdderDropdown(
                          clerk: langController,
                          entries: languageNamesInNativeFormat,
                          hint: 'Add a language.',
                        ),
                        ColoredButton(
                          text: '+',
                          width: 55,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          textColor: Colors.white,
                          normalButtonColor: Colors.black,
                          pressedButtonColor:
                              const Color.fromARGB(255, 112, 112, 112),
                          borderColor: Colors.black,
                        ),
                      ],
                    ),
                    const Row(),
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            'Communication Method',
                            style: TextStyle(
                              fontSize: 22,
                            ),
                          ),
                          ColoredButton(
                            width: 72,
                            height: 8,
                            callbackFunction: _resetCommunicationMethod,
                            text: 'Reset',
                            fontWeight: FontWeight.bold,
                            borderRadius: 8,
                            borderColor: Colors.black,
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _communicationMethod = 0;
                              });
                            },
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: Radio<int>(
                                    value: 0,
                                    groupValue: _communicationMethod,
                                    activeColor: Colors.black,
                                    onChanged: (int? value) {
                                      setState(() {
                                        _communicationMethod = value!;
                                      });
                                    },
                                  ),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  CommunicationMethod.chatOnly.string,
                                ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _communicationMethod = 1;
                              });
                            },
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: Radio<int>(
                                    value: 1,
                                    groupValue: _communicationMethod,
                                    activeColor: Colors.black,
                                    onChanged: (int? value) {
                                      setState(() {
                                        _communicationMethod = value!;
                                      });
                                    },
                                  ),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  CommunicationMethod.all.string,
                                ),
                              ],
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            'Rating',
                            style: TextStyle(
                              fontSize: 22,
                            ),
                          ),
                          ColoredButton(
                            width: 72,
                            height: 8,
                            callbackFunction: _resetRating,
                            text: 'Reset',
                            fontWeight: FontWeight.bold,
                            borderRadius: 8,
                            borderColor: Colors.black,
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _rating = 0;
                              });
                            },
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: Radio<int>(
                                    value: 0,
                                    groupValue: _rating,
                                    activeColor: Colors.black,
                                    onChanged: (int? value) {
                                      setState(() {
                                        _rating = value!;
                                      });
                                    },
                                  ),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                const Text('≥'),
                                const SizedBox(
                                  width: 4,
                                ),
                                TextWithBackground(
                                  text: Rating.three.string,
                                  backgroundColor:
                                      getRatingColor(Rating.three.number),
                                ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _rating = 1;
                              });
                            },
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: Radio<int>(
                                    value: 1,
                                    groupValue: _rating,
                                    activeColor: Colors.black,
                                    onChanged: (int? value) {
                                      setState(() {
                                        _rating = value!;
                                      });
                                    },
                                  ),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                const Text('≥'),
                                const SizedBox(
                                  width: 4,
                                ),
                                TextWithBackground(
                                  text: Rating.threePointFive.string,
                                  backgroundColor: getRatingColor(
                                      Rating.threePointFive.number),
                                ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _rating = 2;
                              });
                            },
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: Radio<int>(
                                    value: 2,
                                    groupValue: _rating,
                                    activeColor: Colors.black,
                                    onChanged: (int? value) {
                                      setState(() {
                                        _rating = value!;
                                      });
                                    },
                                  ),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                const Text('≥'),
                                const SizedBox(
                                  width: 4,
                                ),
                                TextWithBackground(
                                  text: Rating.four.string,
                                  backgroundColor:
                                      getRatingColor(Rating.four.number),
                                ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _rating = 3;
                              });
                            },
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: Radio<int>(
                                    value: 3,
                                    groupValue: _rating,
                                    activeColor: Colors.black,
                                    onChanged: (int? value) {
                                      setState(() {
                                        _rating = value!;
                                      });
                                    },
                                  ),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                const Text('≥'),
                                const SizedBox(
                                  width: 4,
                                ),
                                TextWithBackground(
                                  text: Rating.fourPointFive.string,
                                  backgroundColor: getRatingColor(
                                      Rating.fourPointFive.number),
                                ),
                              ],
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
                  // price range
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            'Price Range',
                            style: TextStyle(
                              fontSize: 22,
                            ),
                          ),
                          ColoredButton(
                            width: 72,
                            height: 8,
                            callbackFunction: _resetPriceRange,
                            text: 'Reset',
                            fontWeight: FontWeight.bold,
                            borderRadius: 8,
                            borderColor: Colors.black,
                          )
                        ],
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
                            child: SearchField(
                              clerk: _minController,
                              label: 'minimum',
                              variety: TextInputType.number,
                            ),
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          Expanded(
                            child: SearchField(
                              clerk: _maxController,
                              label: 'maximum',
                              variety: TextInputType.number,
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            'Sorting Aspect',
                            style: TextStyle(
                              fontSize: 22,
                            ),
                          ),
                          ColoredButton(
                            width: 72,
                            height: 8,
                            callbackFunction: _resetSortingAspect,
                            text: 'Reset',
                            fontWeight: FontWeight.bold,
                            borderRadius: 8,
                            borderColor: Colors.black,
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _sortingAspect = 0;
                              });
                            },
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: Radio<int>(
                                    value: 0,
                                    groupValue: _sortingAspect,
                                    activeColor: Colors.black,
                                    onChanged: (int? value) {
                                      setState(() {
                                        _sortingAspect = value!;
                                      });
                                    },
                                  ),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  SortingAspect.dateASC.string,
                                ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _sortingAspect = 1;
                              });
                            },
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: Radio<int>(
                                    value: 1,
                                    groupValue: _sortingAspect,
                                    activeColor: Colors.black,
                                    onChanged: (int? value) {
                                      setState(() {
                                        _sortingAspect = value!;
                                      });
                                    },
                                  ),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  SortingAspect.ratingASC.string,
                                ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _sortingAspect = 2;
                              });
                            },
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: Radio<int>(
                                    value: 2,
                                    groupValue: _sortingAspect,
                                    activeColor: Colors.black,
                                    onChanged: (int? value) {
                                      setState(() {
                                        _sortingAspect = value!;
                                      });
                                    },
                                  ),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  SortingAspect.priceASC.string,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _sortingAspect = 3;
                              });
                            },
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: Radio<int>(
                                    value: 3,
                                    groupValue: _sortingAspect,
                                    activeColor: Colors.black,
                                    onChanged: (int? value) {
                                      setState(() {
                                        _sortingAspect = value!;
                                      });
                                    },
                                  ),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  SortingAspect.dateDES.string,
                                ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _sortingAspect = 4;
                              });
                            },
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: Radio<int>(
                                    value: 4,
                                    groupValue: _sortingAspect,
                                    activeColor: Colors.black,
                                    onChanged: (int? value) {
                                      setState(() {
                                        _sortingAspect = value!;
                                      });
                                    },
                                  ),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  SortingAspect.ratingDES.string,
                                ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _sortingAspect = 5;
                              });
                            },
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: Radio<int>(
                                    value: 5,
                                    groupValue: _sortingAspect,
                                    activeColor: Colors.black,
                                    onChanged: (int? value) {
                                      setState(() {
                                        _sortingAspect = value!;
                                      });
                                    },
                                  ),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  SortingAspect.priceDES.string,
                                ),
                              ],
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
                ColoredButton(
                  text: 'Reset All',
                  fontWeight: FontWeight.bold,
                  borderRadius: 8,
                  borderColor: Colors.black,
                ),
                ColoredButton(
                  text: 'Apply',
                  fontWeight: FontWeight.bold,
                  normalButtonColor: Colors.black,
                  pressedButtonColor: Color.fromARGB(255, 112, 112, 112),
                  borderRadius: 8,
                  borderColor: Colors.black,
                  textColor: Colors.white,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
