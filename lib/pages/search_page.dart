import 'package:flutter/material.dart';
import 'package:polkatalk/widgets/profile_card.dart';
import 'package:polkatalk/widgets/bg_reveal_btn.dart';
import 'package:polkatalk/widgets/filter_btn_and_notification_btn.dart';

class SearchPage extends StatefulWidget {
  final ScrollController scrollController;

  const SearchPage({super.key, required this.scrollController});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  bool _showBackground = false;

  void toggleBackgroundVisibility() {
    setState(() {
      _showBackground = !_showBackground;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> pageButtons = [
      Expanded(
        child: _showBackground
            ? const SizedBox(
                height: 76,
              )
            : const FilterButtonAndNotificationButton(),
      ),
      BackgroundRevealButton(
          toggleBackgroundCallback: toggleBackgroundVisibility),
    ];

    return SafeArea(
      child: Container(
        color: Colors.white,
        child: ListView.builder(
          controller: widget.scrollController,
          itemCount: 15,
          itemBuilder: (BuildContext context, int index) {
            return index == 0
                ? Row(children: pageButtons)
                : Visibility(
                    visible: !_showBackground,
                    child: const ProfileCard(
                      name: 'Larry Page',
                      profession: 'Economist',
                      rating: 4.8,
                    ),
                  );
          },
        ),
      ),
    );
  }
}
