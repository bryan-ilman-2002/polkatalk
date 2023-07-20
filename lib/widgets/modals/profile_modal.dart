import 'package:flutter/material.dart';
import 'package:polkatalk/functions/getters/app_colors.dart';
import 'package:polkatalk/functions/getters/green_shadow.dart';
import 'package:polkatalk/functions/getters/heavy_shadow.dart';
import 'package:polkatalk/functions/getters/light_shadow.dart';
import 'package:polkatalk/functions/getters/rating_color.dart';
import 'package:polkatalk/widgets/custom_scroll_behavior.dart';
import 'package:polkatalk/widgets/lines/horizontal_thin_line.dart';
import 'package:polkatalk/widgets/tag_board.dart';
import 'package:polkatalk/widgets/text/txt_with_bg.dart';

class ProfileModal extends StatelessWidget {
  const ProfileModal({super.key});

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
                  child: Icon(
                    Icons.close_rounded,
                    size: 24,
                    color: moderateGray,
                  ),
                ),
              ),
              Text(
                'User Profile',
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
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 32,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: moderateGray,
                                  )),
                              // Replace with your photo widget
                              child: Center(
                                child: Icon(
                                  Icons.no_photography_rounded,
                                  size: 24,
                                  color: lightGray,
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Larry Page',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: heavyGray,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.location_pin,
                                        size: 20,
                                        color: tenseColor,
                                      ),
                                      const SizedBox(width: 2),
                                      const Expanded(
                                        child: Text(
                                          'Moscow, Russia',
                                          maxLines: 4,
                                          textHeightBehavior:
                                              TextHeightBehavior(
                                            applyHeightToFirstAscent: false,
                                          ),
                                          style: TextStyle(
                                            height: 1.2,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                        Text(
                          'Language(s)',
                          style: TextStyle(
                            fontSize: 18,
                            color: heavyGray,
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        const TagBoard(
                          horizontalAlignment: WrapAlignment.start,
                          horizontalSpacing: 12,
                          prints: [
                            'English',
                            'French',
                            'Japanese',
                            'German',
                          ],
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                        Text(
                          'Interest(s)',
                          style: TextStyle(
                            fontSize: 18,
                            color: heavyGray,
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        const TagBoard(
                          horizontalAlignment: WrapAlignment.start,
                          horizontalSpacing: 12,
                          prints: [
                            'Gaming',
                            'Reading',
                            'Travelling',
                            'Cooking',
                          ],
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                        Text(
                          'Rating',
                          maxLines: 2,
                          style: TextStyle(
                            fontSize: 18,
                            color: heavyGray,
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                Text(
                                  '4.2',
                                  style: TextStyle(
                                    fontSize: 64,
                                    fontWeight: FontWeight.bold,
                                    color: getRatingColor(4.2),
                                    shadows: [
                                      lightShadow,
                                    ],
                                  ),
                                ),
                                Text(
                                  '1486',
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    shadows: [
                                      lightShadow,
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    TextWithBackground(
                                      backgroundColor: getRatingColor(5.0),
                                      boxShadow: lightShadow,
                                      text: '5.0',
                                    ),
                                    const SizedBox(
                                      width: 2,
                                    ),
                                    Icon(
                                      Icons.close_rounded,
                                      size: 12,
                                      color: moderateGray,
                                      shadows: [lightShadow],
                                    ),
                                    const SizedBox(
                                      width: 2,
                                    ),
                                    Text(
                                      '1208',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        shadows: [
                                          lightShadow,
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  children: [
                                    TextWithBackground(
                                      backgroundColor: getRatingColor(4.0),
                                      boxShadow: lightShadow,
                                      text: '4.0',
                                    ),
                                    const SizedBox(
                                      width: 2,
                                    ),
                                    Icon(
                                      Icons.close_rounded,
                                      size: 12,
                                      color: moderateGray,
                                      shadows: [lightShadow],
                                    ),
                                    const SizedBox(
                                      width: 2,
                                    ),
                                    Text(
                                      '24',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        shadows: [
                                          lightShadow,
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  children: [
                                    TextWithBackground(
                                      backgroundColor: getRatingColor(3.0),
                                      boxShadow: lightShadow,
                                      text: '3.0',
                                    ),
                                    const SizedBox(
                                      width: 2,
                                    ),
                                    Icon(
                                      Icons.close_rounded,
                                      size: 12,
                                      color: moderateGray,
                                      shadows: [lightShadow],
                                    ),
                                    const SizedBox(
                                      width: 2,
                                    ),
                                    Text(
                                      '122',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        shadows: [
                                          lightShadow,
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  children: [
                                    TextWithBackground(
                                      backgroundColor: getRatingColor(2.0),
                                      boxShadow: lightShadow,
                                      text: '2.0',
                                    ),
                                    const SizedBox(
                                      width: 2,
                                    ),
                                    Icon(
                                      Icons.close_rounded,
                                      size: 12,
                                      color: moderateGray,
                                      shadows: [lightShadow],
                                    ),
                                    const SizedBox(
                                      width: 2,
                                    ),
                                    Text(
                                      '8',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        shadows: [
                                          lightShadow,
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  children: [
                                    TextWithBackground(
                                      backgroundColor: getRatingColor(1.0),
                                      boxShadow: lightShadow,
                                      text: '1.0',
                                    ),
                                    const SizedBox(
                                      width: 2,
                                    ),
                                    Icon(
                                      Icons.close_rounded,
                                      size: 12,
                                      color: moderateGray,
                                      shadows: [lightShadow],
                                    ),
                                    const SizedBox(
                                      width: 2,
                                    ),
                                    Text(
                                      '12',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        shadows: [
                                          lightShadow,
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                        Text(
                          'What Other People Think of This Person',
                          maxLines: 2,
                          textHeightBehavior: const TextHeightBehavior(
                            applyHeightToFirstAscent: false,
                          ),
                          style: TextStyle(
                            height: 1.2,
                            fontSize: 18,
                            color: heavyGray,
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        const TagBoard(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
