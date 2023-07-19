import 'package:flutter/material.dart';
import 'package:polkatalk/functions/getters/app_colors.dart';
import 'package:polkatalk/functions/getters/light_shadow.dart';
import 'package:polkatalk/widgets/buttons/colored_btn.dart';
import 'package:polkatalk/widgets/buttons/twin_btns.dart';
import 'package:polkatalk/widgets/cards/profile_card.dart';
import 'package:polkatalk/widgets/modals/filter_modal.dart';

class ExplorePage extends StatefulWidget {
  final ScrollController scrollController;

  const ExplorePage({super.key, required this.scrollController});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  void openFilterModal() => showModalBottomSheet(
        context: context,
        useSafeArea: true,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (BuildContext context) {
          return const FilterModal();
        },
      );

  void openNotificationsModal() => showModalBottomSheet(
        context: context,
        useSafeArea: true,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (BuildContext context) {
          return const SizedBox();
        },
      );

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];

    final Padding buttonRow = Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          Expanded(
            child: TwinButtons(
              leftButtonCallbackFunction: openFilterModal,
              rightButtonCallbackFunction: openNotificationsModal,
              leftIcon: Icons.filter_alt_rounded,
              rightIcon: Icons.notifications_rounded,
            ),
          ),
          const SizedBox(width: 8),
          ColoredButton(
            width: 60,
            height: 60,
            basicBorderRadius: 128,
            buttonColor: Colors.white,
            borderColor: Colors.transparent,
            buttonShadow: lightShadow,
            child: Icon(
              Icons.list_rounded,
              size: 30,
              color: lightGray,
            ),
          ),
        ],
      ),
    );

    children.add(buttonRow);

    for (int index = 0; index < 15; index++) {
      children.add(
        const Padding(
          padding: EdgeInsets.all(8),
          child: ProfileCard(
            name: 'Larry Page',
            interests: [
              'Gaming',
              'Golfing',
              'Swimming',
              'Mathematics',
            ],
            rating: 4.8,
            location: 'Moscow, Russia',
          ),
        ),
      );
    }

    return SafeArea(
      child: Container(
        color: Colors.white,
        child: ListView.builder(
          controller: widget.scrollController,
          itemCount: children.length,
          itemBuilder: (BuildContext context, int index) => children[index],
        ),
      ),
    );
  }
}
