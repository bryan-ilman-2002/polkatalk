import 'package:flutter/material.dart';
import 'package:polkatalk/enums/session_type.dart';
import 'package:polkatalk/widgets/colored_btn.dart';
import 'package:polkatalk/widgets/horizontal_thin_line.dart';
import 'package:polkatalk/widgets/search_field.dart';
import 'package:polkatalk/widgets/tag.dart';

class FilterModal extends StatefulWidget {
  const FilterModal({super.key});

  @override
  State<FilterModal> createState() => _FilterModalState();
}

class _FilterModalState extends State<FilterModal> {
  int _sessionType = 0;

  @override
  Widget build(BuildContext context) {
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
            margin: EdgeInsets.all(0),
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
                              // fontWeight: FontWeight.bold,
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
                  margin: EdgeInsets.symmetric(horizontal: 20),
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
                    const SearchField(),
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
                  margin: EdgeInsets.symmetric(horizontal: 20),
                ),
                const Column(
                  // date
                  children: [
                    Row(),
                    Row(),
                    Row(),
                  ],
                ),
                const HorizontalThinLine(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                ),
                const Column(
                  // language
                  children: [
                    Row(),
                    Row(),
                    Row(),
                  ],
                ),
                const HorizontalThinLine(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                ),
                const Column(
                  // communication medium
                  children: [
                    Row(),
                    Row(),
                    Row(),
                  ],
                ),
                const HorizontalThinLine(
                  margin: EdgeInsets.symmetric(horizontal: 20),
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
                  margin: EdgeInsets.symmetric(horizontal: 20),
                ),
                const Column(
                  // rating
                  children: [
                    Row(),
                    Row(),
                    Row(),
                  ],
                ),
                const HorizontalThinLine(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                ),
                const Column(
                  // price range
                  children: [
                    Row(),
                    Row(),
                    Row(),
                  ],
                ),
                const HorizontalThinLine(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                ),
                const Column(
                  // sorting aspect
                  children: [
                    Row(),
                    Row(),
                    Row(),
                  ],
                ),
              ],
            ),
          ),
          const HorizontalThinLine(
            margin: EdgeInsets.all(0),
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
