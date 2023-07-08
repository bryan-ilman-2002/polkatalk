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
  List<Widget> pageButtons = [
    const Expanded(
      child: FilterButtonAndNotificationButton(),
    ),
    const BackgroundRevealButton()
  ];

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
                ? Row(children: pageButtons)
                : const ProfileCard(
                    name: 'Larry Page',
                    profession: 'Economist',
                    rating: 4.8,
                  );
          },
        ),
      ),
    );
  }
}
