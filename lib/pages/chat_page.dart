import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:polkatalk/functions/getters/app_colors.dart';
import 'package:polkatalk/functions/getters/green_shadow.dart';
import 'package:polkatalk/functions/getters/heavy_shadow.dart';
import 'package:polkatalk/functions/getters/light_shadow.dart';
import 'package:polkatalk/widgets/buttons/colored_btn.dart';
import 'package:polkatalk/widgets/custom_scroll_behavior.dart';
import 'package:polkatalk/widgets/lines/horizontal_thin_line.dart';
import 'package:polkatalk/widgets/tag_board.dart';
import 'package:polkatalk/widgets/text/txt_with_bg.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    tinyShadow,
                  ],
                ),
                child: Row(
                  children: [
                    ColoredButton(
                      horizontalPadding: 8,
                      verticalPadding: 8,
                      basicBorderRadius: 128,
                      borderColor: Colors.transparent,
                      child: Icon(
                        Icons.arrow_back_rounded,
                        size: 24,
                        color: moderateGray,
                      ),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Container(
                      width: 48,
                      height: 48,
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
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.only(
                          left: 8,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Daniela Armandario',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: heavyGray,
                              ),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Text(
                              'last active yesterday',
                              style: TextStyle(
                                color: moderateGray,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    ColoredButton(
                      verticalPadding: 4,
                      basicBorderRadius: 128,
                      borderColor: moderateGray,
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 6,
                          ),
                          TextWithBackground(
                            backgroundColor: Colors.transparent,
                            padding: const EdgeInsets.all(0),
                            text: '04:50',
                            textColor: moderateGray,
                          ),
                          Icon(
                            Icons.keyboard_arrow_down_rounded,
                            size: 20,
                            color: heavyGray,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        right: 8,
                      ),
                      child: ColoredButton(
                        horizontalPadding: 8,
                        verticalPadding: 8,
                        basicBorderRadius: 128,
                        borderColor: Colors.transparent,
                        child: Icon(
                          Icons.videocam_rounded,
                          size: 30,
                          color: primaryAppColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(
                    left: 8,
                    right: 8,
                    top: 8,
                  ),
                  child: ScrollConfiguration(
                    behavior: CustomScrollBehavior(),
                    child: ListView(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Column(
                              children: [
                                Text(
                                  '28',
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                                Text(
                                  'September',
                                ),
                                Text(
                                  '2023',
                                ),
                              ],
                            ),
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 24,
                                  vertical: 12,
                                ),
                                child: Column(
                                  children: [
                                    const Text(
                                      'What game do you want to play?',
                                    ),
                                    const SizedBox(
                                      height: 12,
                                    ),
                                    // Text(
                                    //   'Alexander Antonio chose Truth or Dare',
                                    //   style: TextStyle(
                                    //     color: primaryAppColor,
                                    //   ),
                                    // ),
                                    ColoredButton(
                                      horizontalPadding: 8,
                                      verticalPadding: 8,
                                      borderColor: Colors.transparent,
                                      basicBorderRadius: 12,
                                      buttonShadow: tinyShadow,
                                      child: const Text(
                                        'Truth or Dare',
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    ColoredButton(
                                      horizontalPadding: 8,
                                      verticalPadding: 8,
                                      borderColor: Colors.transparent,
                                      basicBorderRadius: 12,
                                      buttonShadow: tinyShadow,
                                      child: const Text(
                                        'Would You Rather',
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    ColoredButton(
                                      horizontalPadding: 8,
                                      verticalPadding: 8,
                                      borderColor: Colors.transparent,
                                      basicBorderRadius: 12,
                                      buttonShadow: tinyShadow,
                                      child: const Text(
                                        'Never Have I Ever',
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    ColoredButton(
                                      horizontalPadding: 8,
                                      verticalPadding: 8,
                                      borderColor: Colors.transparent,
                                      basicBorderRadius: 12,
                                      buttonShadow: tinyShadow,
                                      child: const Text(
                                        'Kiss, Marry, Kill',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                          ),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 8,
                              ),
                              decoration: BoxDecoration(
                                color: chatColor,
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: [
                                  giantShadow,
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    'Hello There',
                                    style: TextStyle(
                                      color: heavyGray,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        '14:32',
                                        style: TextStyle(
                                          color: moderateGray,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 4,
                                      ),
                                      Icon(
                                        Icons.check_box_rounded,
                                        size: 20,
                                        color: Colors.blue[400],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                          ),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 8,
                              ),
                              decoration: BoxDecoration(
                                color: chatColor,
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: [
                                  giantShadow,
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    'Hello There',
                                    style: TextStyle(
                                      color: heavyGray,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        '14:32',
                                        style: TextStyle(
                                          color: moderateGray,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 4,
                                      ),
                                      Icon(
                                        Icons.check_box_rounded,
                                        size: 20,
                                        color: Colors.blue[400],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                          ),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 8,
                              ),
                              decoration: BoxDecoration(
                                color: chatColor,
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: [
                                  giantShadow,
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    'Hello There',
                                    style: TextStyle(
                                      color: heavyGray,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        '14:32',
                                        style: TextStyle(
                                          color: moderateGray,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 4,
                                      ),
                                      Icon(
                                        Icons.check_box_rounded,
                                        size: 20,
                                        color: Colors.blue[400],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                          ),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 8,
                              ),
                              decoration: BoxDecoration(
                                color: chatColor,
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: [
                                  giantShadow,
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    'Hello There',
                                    style: TextStyle(
                                      color: heavyGray,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        '14:32',
                                        style: TextStyle(
                                          color: moderateGray,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 4,
                                      ),
                                      Icon(
                                        Icons.check_box_rounded,
                                        size: 20,
                                        color: Colors.blue[400],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                          ),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 8,
                              ),
                              decoration: BoxDecoration(
                                color: chatColor,
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: [
                                  giantShadow,
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    'Hello There',
                                    style: TextStyle(
                                      color: heavyGray,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        '14:32',
                                        style: TextStyle(
                                          color: moderateGray,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 4,
                                      ),
                                      Icon(
                                        Icons.check_box_rounded,
                                        size: 20,
                                        color: Colors.blue[400],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                          ),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 8,
                              ),
                              decoration: BoxDecoration(
                                color: chatColor,
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: [
                                  giantShadow,
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    'Hello There',
                                    style: TextStyle(
                                      color: heavyGray,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        '14:32',
                                        style: TextStyle(
                                          color: moderateGray,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 4,
                                      ),
                                      Icon(
                                        Icons.check_box_rounded,
                                        size: 20,
                                        color: Colors.blue[400],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                          ),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 8,
                              ),
                              decoration: BoxDecoration(
                                color: chatColor,
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: [
                                  giantShadow,
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    'Hello There',
                                    style: TextStyle(
                                      color: heavyGray,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        '14:32',
                                        style: TextStyle(
                                          color: moderateGray,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 4,
                                      ),
                                      Icon(
                                        Icons.check_box_rounded,
                                        size: 20,
                                        color: Colors.blue[400],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                          ),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 8,
                              ),
                              decoration: BoxDecoration(
                                color: chatColor,
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: [
                                  giantShadow,
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    'Hello There',
                                    style: TextStyle(
                                      color: heavyGray,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        '14:32',
                                        style: TextStyle(
                                          color: moderateGray,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 4,
                                      ),
                                      Icon(
                                        Icons.check_box_rounded,
                                        size: 20,
                                        color: Colors.blue[400],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                          ),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 8,
                              ),
                              decoration: BoxDecoration(
                                color: chatColor,
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: [
                                  giantShadow,
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    'Hello There',
                                    style: TextStyle(
                                      color: heavyGray,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        '14:32',
                                        style: TextStyle(
                                          color: moderateGray,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 4,
                                      ),
                                      Icon(
                                        Icons.check_box_rounded,
                                        size: 20,
                                        color: Colors.blue[400],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                          ),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 8,
                              ),
                              decoration: BoxDecoration(
                                color: chatColor,
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: [
                                  giantShadow,
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    'Hello There',
                                    style: TextStyle(
                                      color: heavyGray,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        '14:32',
                                        style: TextStyle(
                                          color: moderateGray,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 4,
                                      ),
                                      Icon(
                                        Icons.check_box_rounded,
                                        size: 20,
                                        color: Colors.blue[400],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(
                  left: 8,
                  right: 8,
                  top: 4,
                  bottom: 8,
                ),
                child: IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: lightGray,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            children: [
                              IntrinsicHeight(
                                child: Row(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Container(
                                      width: 24,
                                      margin: const EdgeInsets.symmetric(
                                        horizontal: 8,
                                      ),
                                      decoration: BoxDecoration(
                                        color: tinyGray,
                                        border: Border.all(
                                          color: lightGray,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                    Expanded(
                                      child: TextField(
                                        enabled: false,
                                        minLines: 2,
                                        maxLines: 2,
                                        decoration: InputDecoration(
                                          hintText:
                                              'Hello There, you you you you you you you you you you you you you you you you you you ',
                                          hintStyle: TextStyle(
                                            fontSize: 14,
                                            color: moderateGray,
                                          ),
                                          contentPadding:
                                              const EdgeInsets.all(0),
                                          disabledBorder:
                                              const OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.transparent),
                                          ),
                                          isCollapsed: true,
                                          isDense: true,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 4,
                                    ),
                                  ],
                                ),
                              ),
                              HorizontalThinLine(
                                height: 1,
                                horizontalMargin: 8,
                                verticalMargin: 4,
                                lineColor: lightGray,
                              ),
                              Row(
                                children: [
                                  const ColoredButton(
                                    horizontalPadding: 8,
                                    verticalPadding: 8,
                                    basicBorderRadius: 128,
                                    borderColor: Colors.transparent,
                                    child: Icon(
                                      Icons.photo_rounded,
                                      size: 24,
                                    ),
                                  ),
                                  Expanded(
                                    child: TextField(
                                      minLines: 1,
                                      maxLines: 6,
                                      style: TextStyle(
                                        color: heavyGray,
                                      ),
                                      decoration: const InputDecoration(
                                        hintText: 'Message',
                                        hintStyle: TextStyle(),
                                        isCollapsed: true,
                                        contentPadding: EdgeInsets.only(
                                          right: 8,
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                          ),
                                        ),
                                        disabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ColoredButton(
                            horizontalPadding: 4,
                            verticalPadding: 4,
                            basicBorderRadius: 128,
                            borderColor: Colors.transparent,
                            child: Icon(
                              Icons.close_rounded,
                              size: 20,
                              color: moderateGray,
                            ),
                          ),
                          ColoredButton(
                            horizontalPadding: 12,
                            verticalPadding: 12,
                            buttonColor: primaryAppColor,
                            splashColor: secondaryAppColor,
                            borderColor: Colors.transparent,
                            basicBorderRadius: 128,
                            child: const Icon(
                              Icons.send_rounded,
                              size: 26,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
