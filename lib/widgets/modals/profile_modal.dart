import 'package:flutter/material.dart';
import 'package:polkatalk/enums/opinion.dart';
import 'package:polkatalk/functions/getters/app_colors.dart';
import 'package:polkatalk/functions/getters/heavy_shadow.dart';
import 'package:polkatalk/functions/getters/light_shadow.dart';
import 'package:polkatalk/functions/getters/rating_color.dart';
import 'package:polkatalk/widgets/custom_scroll_behavior.dart';
import 'package:polkatalk/widgets/date_picker.dart';
import 'package:polkatalk/widgets/lines/horizontal_thin_line.dart';
import 'package:polkatalk/widgets/lines/vertical_thin_line.dart';
import 'package:polkatalk/widgets/tag_board.dart';
import 'package:polkatalk/widgets/text/txt_with_bg.dart';
import 'package:polkatalk/widgets/social_media_links.dart';

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
                          height: 24,
                        ),
                        const Row(
                          children: [
                            Expanded(
                              child: TagBoard(
                                horizontalAlignment: WrapAlignment.center,
                                horizontalSpacing: 12,
                                prints: [
                                  'English',
                                  'French',
                                  'Japanese',
                                  'German',
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 64,
                        ),
                        Text(
                          'Interest(s)',
                          style: TextStyle(
                            fontSize: 18,
                            color: heavyGray,
                          ),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        const Row(
                          children: [
                            Expanded(
                              child: TagBoard(
                                horizontalAlignment: WrapAlignment.center,
                                horizontalSpacing: 12,
                                prints: [
                                  'Cooking',
                                  'Cooking',
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 64,
                        ),
                        Text(
                          'What others think of Larry Page',
                          style: TextStyle(
                            fontSize: 18,
                            color: heavyGray,
                          ),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: TagBoard(
                                containsOpinion: true,
                                horizontalSpacing: 12,
                                prints: [
                                  [Opinion.good.string, 'cute', 24],
                                  [Opinion.neutral.string, 'talkative', 102],
                                  [Opinion.bad.string, 'horny', 102],
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                        Center(
                          child: Container(
                            padding: const EdgeInsets.all(32),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                lightShadow,
                              ],
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      '4.2',
                                      style: TextStyle(
                                        fontSize: 64,
                                        fontWeight: FontWeight.bold,
                                        color: getRatingColor(4.2),
                                      ),
                                    ),
                                    const Text(
                                      '1486',
                                      style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        TextWithBackground(
                                          backgroundColor: getRatingColor(5.0),
                                          text: '5.0',
                                        ),
                                        const SizedBox(
                                          width: 2,
                                        ),
                                        Icon(
                                          Icons.close_rounded,
                                          size: 12,
                                          color: moderateGray,
                                        ),
                                        const SizedBox(
                                          width: 2,
                                        ),
                                        const Text(
                                          '1208',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
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
                                          text: '4.0',
                                        ),
                                        const SizedBox(
                                          width: 2,
                                        ),
                                        Icon(
                                          Icons.close_rounded,
                                          size: 12,
                                          color: moderateGray,
                                        ),
                                        const SizedBox(
                                          width: 2,
                                        ),
                                        const Text(
                                          '24',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
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
                                          text: '3.0',
                                        ),
                                        const SizedBox(
                                          width: 2,
                                        ),
                                        Icon(
                                          Icons.close_rounded,
                                          size: 12,
                                          color: moderateGray,
                                        ),
                                        const SizedBox(
                                          width: 2,
                                        ),
                                        const Text(
                                          '122',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
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
                                          text: '2.0',
                                        ),
                                        const SizedBox(
                                          width: 2,
                                        ),
                                        Icon(
                                          Icons.close_rounded,
                                          size: 12,
                                          color: moderateGray,
                                        ),
                                        const SizedBox(
                                          width: 2,
                                        ),
                                        const Text(
                                          '8',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
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
                                          text: '1.0',
                                        ),
                                        const SizedBox(
                                          width: 2,
                                        ),
                                        Icon(
                                          Icons.close_rounded,
                                          size: 12,
                                          color: moderateGray,
                                        ),
                                        const SizedBox(
                                          width: 2,
                                        ),
                                        const Text(
                                          '12',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 64,
                        ),
                        Text(
                          'Social Media Links',
                          style: TextStyle(
                            fontSize: 18,
                            color: heavyGray,
                          ),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        const SocialMediaLinks(),
                        const SizedBox(
                          height: 64,
                        ),
                        Text(
                          'Available Slot(s)',
                          style: TextStyle(
                            fontSize: 18,
                            color: heavyGray,
                          ),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 8,
                              ),
                              child: Text(
                                '00:00',
                              ),
                            ),
                            VerticalThinLine(
                              height: 20,
                              lineColor: moderateGray,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(
                                      top: 2,
                                    ),
                                    child: Text(
                                      '10',
                                      style: TextStyle(
                                        fontSize: 10,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 20,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            ),
                            VerticalThinLine(
                              height: 20,
                              lineColor: moderateGray,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(
                                      top: 2,
                                    ),
                                    child: Text(
                                      '20',
                                      style: TextStyle(
                                        fontSize: 10,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 20,
                                    color: lightBlue,
                                  ),
                                ],
                              ),
                            ),
                            VerticalThinLine(
                              height: 20,
                              lineColor: moderateGray,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(
                                      top: 2,
                                    ),
                                    child: Text(
                                      '30',
                                      style: TextStyle(
                                        fontSize: 10,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 20,
                                    color: lightBlue,
                                  ),
                                ],
                              ),
                            ),
                            VerticalThinLine(
                              height: 20,
                              lineColor: moderateGray,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(
                                      top: 2,
                                    ),
                                    child: Text(
                                      '40',
                                      style: TextStyle(
                                        fontSize: 10,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 20,
                                    color: lightBlue,
                                  ),
                                ],
                              ),
                            ),
                            VerticalThinLine(
                              height: 20,
                              lineColor: moderateGray,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(
                                      top: 2,
                                    ),
                                    child: Text(
                                      '50',
                                      style: TextStyle(
                                        fontSize: 10,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 20,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            ),
                            VerticalThinLine(
                              height: 20,
                              lineColor: moderateGray,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(
                                      top: 2,
                                    ),
                                    child: Text(
                                      '60',
                                      style: TextStyle(
                                        fontSize: 10,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 20,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            ),
                            VerticalThinLine(
                              height: 20,
                              lineColor: moderateGray,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 8,
                              ),
                              child: Text(
                                '01:00',
                              ),
                            ),
                            VerticalThinLine(
                              height: 20,
                              lineColor: moderateGray,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(
                                      top: 2,
                                    ),
                                    child: Text(
                                      '10',
                                      style: TextStyle(
                                        fontSize: 10,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 20,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            ),
                            VerticalThinLine(
                              height: 20,
                              lineColor: moderateGray,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(
                                      top: 2,
                                    ),
                                    child: Text(
                                      '20',
                                      style: TextStyle(
                                        fontSize: 10,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 20,
                                    color: lightBlue,
                                  ),
                                ],
                              ),
                            ),
                            VerticalThinLine(
                              height: 20,
                              lineColor: moderateGray,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(
                                      top: 2,
                                    ),
                                    child: Text(
                                      '30',
                                      style: TextStyle(
                                        fontSize: 10,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 20,
                                    color: lightBlue,
                                  ),
                                ],
                              ),
                            ),
                            VerticalThinLine(
                              height: 20,
                              lineColor: moderateGray,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(
                                      top: 2,
                                    ),
                                    child: Text(
                                      '40',
                                      style: TextStyle(
                                        fontSize: 10,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 20,
                                    color: lightBlue,
                                  ),
                                ],
                              ),
                            ),
                            VerticalThinLine(
                              height: 20,
                              lineColor: moderateGray,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(
                                      top: 2,
                                    ),
                                    child: Text(
                                      '50',
                                      style: TextStyle(
                                        fontSize: 10,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 20,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            ),
                            VerticalThinLine(
                              height: 20,
                              lineColor: moderateGray,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(
                                      top: 2,
                                    ),
                                    child: Text(
                                      '60',
                                      style: TextStyle(
                                        fontSize: 10,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 20,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            ),
                            VerticalThinLine(
                              height: 20,
                              lineColor: moderateGray,
                            ),
                          ],
                        ),
                        const CalendarContainer(),
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
