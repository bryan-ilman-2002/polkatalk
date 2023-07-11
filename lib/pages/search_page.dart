import 'package:flutter/material.dart';
import 'package:polkatalk/widgets/buttons/bg_reveal_btn.dart';
import 'package:polkatalk/widgets/buttons/twin_btns.dart';
import 'package:polkatalk/widgets/cards/profile_card.dart';

class SearchPage extends StatefulWidget {
  final ScrollController scrollController;

  const SearchPage({super.key, required this.scrollController});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  bool _backgroundIsShown = false;

  void toggleBackgroundVisibility() {
    setState(() {
      _backgroundIsShown = !_backgroundIsShown;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.white,
        child: ListView.builder(
          controller: widget.scrollController,
          itemCount: 15,
          itemBuilder: (BuildContext context, int index) {
            return index == 0
                ? Padding(
                    padding: const EdgeInsets.all(8),
                    child: Row(children: [
                      const Expanded(
                        child: TwinButtons(
                          leftIcon: Icons.filter_alt_outlined,
                          rightIcon: Icons.notifications_none_rounded,
                          leftText: 'Fiter',
                          rightText: 'Notifications',
                        ),
                      ),
                      const SizedBox(width: 8),
                      BackgroundRevealButton(
                        callbackFunction: toggleBackgroundVisibility,
                      ),
                    ]),
                  )
                : Visibility(
                    visible: !_backgroundIsShown,
                    child: const Padding(
                      padding: EdgeInsets.all(8),
                      child: ProfileCard(
                        name: 'Larry Page',
                        profession: 'Economist',
                        rating: 4.8,
                        currency: 'USD',
                        price: 4200,
                      ),
                    ),
                  );
          },
        ),
      ),
    );
  }
}
