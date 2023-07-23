import 'package:flutter/material.dart';
import 'package:polkatalk/functions/getters/app_colors.dart';
import 'package:polkatalk/functions/getters/light_shadow.dart';
import 'package:polkatalk/widgets/buttons/colored_btn.dart';
import 'package:polkatalk/widgets/custom_scroll_behavior.dart';

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
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    lightShadow,
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
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                        ),
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
                child: ScrollConfiguration(
                  behavior: CustomScrollBehavior(),
                  child: ListView(
                    children: const [],
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8),
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
                        child: Row(
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
                      ),
                    ),
                    const SizedBox(
                      width: 4,
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
