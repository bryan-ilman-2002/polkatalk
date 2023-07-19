import 'package:flutter/material.dart';
import 'package:polkatalk/functions/getters/app_colors.dart';
import 'package:polkatalk/widgets/buttons/colored_btn.dart';
import 'package:polkatalk/widgets/buttons/setting_btn.dart';
import 'package:polkatalk/widgets/buttons/twin_btns.dart';
import 'package:polkatalk/widgets/lines/horizontal_thin_line.dart';

class SettingsPage extends StatelessWidget {
  final ScrollController scrollController;

  const SettingsPage({super.key, required this.scrollController});

  void logOut() => print(const Text('clicked'));

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          controller: scrollController,
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 32),
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
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Mark Zuckerberg',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: heavyGray,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              TwinButtons(
                height: 120,
                leftButtonCallbackFunction: logOut,
                rightButtonCallbackFunction: logOut,
                dividerHeight: 100,
                leftIcon: Icons.wallet_rounded,
                rightIcon: Icons.credit_card_rounded,
                leftText: 'PolkaPay',
                rightText: 'Bank Card',
                iconColor: Colors.white,
                textSize: 16,
                textColor: Colors.white,
                buttonColor: heavyGray,
                borderRadius: 12,
              ),
              const SizedBox(height: 16),
              const SettingButton(
                icon: Icons.person_rounded,
                label: 'Personal Information',
              ),
              const HorizontalThinLine(),
              const SettingButton(
                icon: Icons.translate_rounded,
                label: 'Translation',
              ),
              const HorizontalThinLine(),
              const SettingButton(
                icon: Icons.notifications_rounded,
                label: 'Notifications',
              ),
              const HorizontalThinLine(),
              const SettingButton(
                icon: Icons.cloud_download_rounded,
                label: 'Request Personal Data',
              ),
              const HorizontalThinLine(),
              SettingButton(
                icon: Icons.delete_rounded,
                label: 'Delete Account',
                iconColor: tenseColor,
                textColor: tenseColor,
                splashColor: const Color.fromARGB(255, 255, 226, 224),
              ),
              const HorizontalThinLine(),
              const SizedBox(height: 64),
              const SettingButton(
                icon: Icons.help_rounded,
                label: 'Help Center',
              ),
              const HorizontalThinLine(),
              const SettingButton(
                icon: Icons.menu_book_rounded,
                label: 'Terms of Service',
              ),
              const HorizontalThinLine(),
              const SettingButton(
                icon: Icons.menu_book_rounded,
                label: 'Privacy Policy',
              ),
              const HorizontalThinLine(),
              const SizedBox(height: 16),
              ColoredButton(
                width: 240,
                verticalPadding: 16,
                callbackFunction: logOut,
                buttonColor: Colors.transparent,
                splashColor: const Color.fromARGB(255, 255, 226, 224),
                borderColor: Colors.transparent,
                child: Text(
                  'Log Out',
                  style: TextStyle(
                    fontSize: 16,
                    color: tenseColor,
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
