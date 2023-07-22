import 'package:flutter/material.dart';
import 'package:polkatalk/functions/getters/app_colors.dart';
import 'package:polkatalk/widgets/custom_scroll_behavior.dart';
import 'package:polkatalk/widgets/lines/horizontal_thin_line.dart';

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
                        Icons.arrow_back_rounded,
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
                    children: const [],
                  ),
                ),
              ),
              const HorizontalThinLine(
                horizontalMargin: 0,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
