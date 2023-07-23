import 'package:flutter/material.dart';
import 'package:polkatalk/functions/getters/app_colors.dart';
import 'package:polkatalk/functions/getters/green_shadow.dart';
import 'package:polkatalk/functions/getters/heavy_shadow.dart';
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
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    lightShadow,
                  ],
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(20),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.arrow_back_rounded,
                          size: 24,
                          color: moderateGray,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        'Larry Page',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: heavyGray,
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
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: lightGray,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Row(
                          children: [
                            ColoredButton(
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
                                style: TextStyle(),
                                decoration: InputDecoration(
                                  hintText: 'Message',
                                  hintStyle: TextStyle(),
                                  isCollapsed: true,
                                  contentPadding: EdgeInsets.only(
                                    right: 8,
                                    top: 8,
                                    bottom: 8,
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
                      horizontalPadding: 8,
                      verticalPadding: 8,
                      buttonColor: primaryAppColor,
                      borderColor: Colors.transparent,
                      basicBorderRadius: 128,
                      child: const Icon(
                        Icons.send_rounded,
                        size: 24,
                        color: Colors.white,
                      ),
                    )
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
