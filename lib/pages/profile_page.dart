import 'package:flutter/material.dart';
import 'package:polkatalk/widgets/log_out_btn.dart';
import 'package:polkatalk/widgets/polkapay_btn_and_bank_card_btn.dart';
import 'package:polkatalk/widgets/filter_btn_and_notification_btn.dart';
import 'package:polkatalk/widgets/setting_btn.dart';

class ProfilePage extends StatefulWidget {
  final ScrollController scrollController;

  const ProfilePage({super.key, required this.scrollController});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  List<Widget> pageButtons = [
    const Expanded(
      child: FilterButtonAndNotificationButton(),
    ),
  ];

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
                  name: 'Personal Information'),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 8),
                height: 0.2,
                width: double.infinity,
                color: Colors.black,
              ),
              const SettingButton(
                  icon: Icons.translate_rounded, name: 'Translation'),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 8),
                height: 0.2,
                width: double.infinity,
                color: Colors.black,
              ),
              const SettingButton(
                  icon: Icons.notifications_none_rounded,
                  name: 'Notifications'),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 8),
                height: 0.2,
                width: double.infinity,
                color: Colors.black,
              ),
              const SettingButton(
                  icon: Icons.cloud_download_outlined,
                  name: 'Request Personal Data'),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 8),
                height: 0.2,
                width: double.infinity,
                color: Colors.black,
              ),
              const SettingButton(
                  icon: Icons.delete_outline_rounded, name: 'Delete Account'),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 8),
                height: 0.2,
                width: double.infinity,
                color: Colors.black,
              ),
              const SizedBox(height: 64),
              const SettingButton(
                  icon: Icons.help_outline, name: 'Help Center'),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 8),
                height: 0.2,
                width: double.infinity,
                color: Colors.black,
              ),
              const SettingButton(
                  icon: Icons.menu_book_rounded, name: 'Terms of Service'),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 8),
                height: 0.2,
                width: double.infinity,
                color: Colors.black,
              ),
              const SettingButton(
                  icon: Icons.menu_book_rounded, name: 'Privacy Policy'),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 8),
                height: 0.2,
                width: double.infinity,
                color: Colors.black,
              ),
              const SizedBox(height: 16),
              const LogOutButton(),
            ],
          ),
        ),
      ),
    );
  }
}
