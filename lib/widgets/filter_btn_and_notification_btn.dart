import 'package:flutter/material.dart';
import 'package:polkatalk/functions/getters/light_shadow.dart';

class FilterButtonAndNotificationButton extends StatefulWidget {
  const FilterButtonAndNotificationButton({super.key});

  @override
  State<FilterButtonAndNotificationButton> createState() =>
      _FilterButtonAndNotificationButtonState();
}

class _FilterButtonAndNotificationButtonState
    extends State<FilterButtonAndNotificationButton> {
  bool _filterButtonState = false;
  bool _notificationButtonState = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(32),
        boxShadow: [
          lightShadow,
        ],
      ),
      child: Row(
        children: [
          _buttonPairBuilder('Filter'),
          Container(
            height: 40,
            width: 1.2,
            color: Colors.grey,
          ),
          _buttonPairBuilder('Notification'),
        ],
      ),
    );
  }

  Widget _buttonPairBuilder(String buttonName) {
    bool filterOrNotification() => buttonName == 'Filter';

    void setButtonState(bool state) {
      filterOrNotification()
          ? _filterButtonState = state
          : _notificationButtonState = state;
    }

    return Expanded(
      child: Listener(
        onPointerDown: (PointerDownEvent _) {
          setState(() {
            setButtonState(true);
          });
        },
        onPointerUp: (PointerUpEvent _) {
          setState(() {
            setButtonState(false);
          });
        },
        onPointerCancel: (PointerCancelEvent _) {
          setState(() {
            setButtonState(false);
          });
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          height: 60,
          decoration: BoxDecoration(
            borderRadius: filterOrNotification()
                ? const BorderRadius.horizontal(left: Radius.circular(32))
                : const BorderRadius.horizontal(right: Radius.circular(32)),
            color: filterOrNotification()
                ? _filterButtonState
                    ? const Color.fromARGB(255, 230, 230, 230)
                    : Colors.white
                : _notificationButtonState
                    ? const Color.fromARGB(255, 230, 230, 230)
                    : Colors.white,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                filterOrNotification()
                    ? Icons.filter_alt_outlined
                    : Icons.notifications_outlined,
                color: Colors.grey,
                size: 30,
              ),
              const SizedBox(width: 8),
              Text(
                buttonName,
                style: const TextStyle(
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
