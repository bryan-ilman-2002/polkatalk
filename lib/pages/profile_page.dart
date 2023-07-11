import 'package:flutter/material.dart';
import 'package:polkatalk/widgets/buttons/colored_btn.dart';
import 'package:polkatalk/widgets/buttons/twin_btns.dart';
import 'package:polkatalk/widgets/buttons/polkapay_btn_and_bank_card_btn.dart';
import 'package:polkatalk/widgets/buttons/setting_btn.dart';
import 'package:polkatalk/widgets/lines/horizontal_thin_line.dart';

class ProfilePage extends StatefulWidget {
  final ScrollController scrollController;

  const ProfilePage({super.key, required this.scrollController});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  void logOut() => print(const Text('clicked'));

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          controller: widget.scrollController,
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 24),
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey[200],
                ),
                child: const Center(
                  child: Icon(Icons.photo, color: Colors.white),
                ),
              ),
              const SizedBox(height: 16),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Mark Zuckerberg',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              const PolkaPayButtonAndBankCardButton(),
              const SizedBox(height: 8),
              const SettingButton(
                icon: Icons.person_outline_rounded,
                label: 'Personal Information',
              ),
              const HorizontalThinLine(),
              const SettingButton(
                icon: Icons.translate_rounded,
                label: 'Translation',
              ),
              const HorizontalThinLine(),
              const SettingButton(
                icon: Icons.notifications_none_rounded,
                label: 'Notifications',
              ),
              const HorizontalThinLine(),
              const SettingButton(
                icon: Icons.cloud_download_outlined,
                label: 'Request Personal Data',
              ),
              const HorizontalThinLine(),
              const SettingButton(
                icon: Icons.delete_outline_rounded,
                label: 'Delete Account',
              ),
              const HorizontalThinLine(),
              const SizedBox(height: 64),
              const SettingButton(
                icon: Icons.help_outline,
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
                width: 180,
                verticalPadding: 16,
                callbackFunction: logOut,
                text: 'Log out',
                textColor: Colors.red,
                buttonColor: Colors.white,
                splashColor: const Color.fromARGB(255, 255, 226, 224),
                borderColor: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
