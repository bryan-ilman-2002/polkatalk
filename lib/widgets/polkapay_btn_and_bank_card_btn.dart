import 'package:flutter/material.dart';
import 'package:polkatalk/functions/getters/light_shadow.dart';

class PolkaPayButtonAndBankCardButton extends StatefulWidget {
  const PolkaPayButtonAndBankCardButton({super.key});

  @override
  State<PolkaPayButtonAndBankCardButton> createState() =>
      _PolkaPayButtonAndBankCardButtonState();
}

class _PolkaPayButtonAndBankCardButtonState
    extends State<PolkaPayButtonAndBankCardButton> {
  bool _polkaPayButtonState = false;
  bool _bankCardButtonState = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      height: 120,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 38, 38, 38),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          lightShadow,
        ],
      ),
      child: Row(
        children: [
          _buttonPairBuilder('PolkaPay'),
          Container(
            height: 100,
            width: 1.2,
            color: Colors.white,
          ),
          _buttonPairBuilder('Bank Card'),
        ],
      ),
    );
  }

  Widget _buttonPairBuilder(String buttonName) {
    bool polkaPayOrBankCard() => buttonName == 'PolkaPay';

    void setButtonState(bool state) {
      polkaPayOrBankCard()
          ? _polkaPayButtonState = state
          : _bankCardButtonState = state;
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
          height: 120,
          decoration: BoxDecoration(
            borderRadius: polkaPayOrBankCard()
                ? const BorderRadius.horizontal(left: Radius.circular(12))
                : const BorderRadius.horizontal(right: Radius.circular(12)),
            color: polkaPayOrBankCard()
                ? _polkaPayButtonState
                    ? const Color.fromARGB(255, 112, 112, 112)
                    : const Color.fromARGB(255, 38, 38, 38)
                : _bankCardButtonState
                    ? const Color.fromARGB(255, 112, 112, 112)
                    : const Color.fromARGB(255, 38, 38, 38),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                polkaPayOrBankCard() ? Icons.wallet : Icons.credit_card,
                color: Colors.white,
                size: 30,
              ),
              const SizedBox(width: 8),
              Text(
                buttonName,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
