import 'package:flutter/material.dart';
import 'package:polkatalk/enums/session_type.dart';
import 'package:polkatalk/widgets/buttons/bg_reveal_btn.dart';
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
  bool _backgroundIsShown = false;

  void toggleBackgroundVisibility() {
    setState(() {
      _backgroundIsShown = !_backgroundIsShown;
    });
  }

  void openFilterModal() => showModalBottomSheet(
        enableDrag: true,
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
          return const FilterModal();
        },
      );

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
                      Expanded(
                        child: _backgroundIsShown
                            ? const SizedBox()
                            : TwinButtons(
                                dividerHeight: 40,
                                leftButtonCallbackFunction: openFilterModal,
                                rightButtonCallbackFunction:
                                    openNotificationsModal,
                                leftIcon: Icons.filter_alt_rounded,
                                rightIcon: Icons.notifications_rounded,
                                leftText: 'Fiters',
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
                        sessionType: SessionType.acquaintanceship,
                        name: 'Larry Page',
                        professions: [
                          'Economist',
                          'Lawyer',
                          'Doctor',
                        ],
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
