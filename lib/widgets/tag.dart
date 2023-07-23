import 'package:flutter/material.dart';
import 'package:polkatalk/enums/direction.dart';
import 'package:polkatalk/functions/getters/app_colors.dart';
import 'package:polkatalk/functions/getters/light_shadow.dart';
import 'package:polkatalk/functions/getters/opinion_design.dart';

class Tag extends StatelessWidget {
  final print;
  final bool containsOpinion;

  const Tag({
    super.key,
    required this.print,
    this.containsOpinion = false,
  });

  @override
  Widget build(BuildContext context) {
    return containsOpinion
        ? Container(
            decoration: BoxDecoration(
              boxShadow: [
                lightShadow,
              ],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buttonBuilder(Direction.left),
                _buttonBuilder(Direction.right),
              ],
            ),
          )
        : Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                lightShadow,
              ],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: Icon(
                    Icons.circle,
                    size: 8,
                    color: moderateGray,
                  ),
                ),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  print,
                ),
                const SizedBox(
                  width: 4,
                ),
              ],
            ),
          );
  }

  Widget _buttonBuilder(Direction value) {
    bool eitherLeftOrRight() => value == Direction.left;

    return eitherLeftOrRight()
        ? Container(
            padding: const EdgeInsets.symmetric(
              vertical: 8,
            ),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                bottomLeft: Radius.circular(12),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  width: 8,
                ),
                Text(
                  String.fromCharCode(getOpinionIcon(print[0]).codePoint),
                  style: TextStyle(
                    inherit: false,
                    color: getOpinionColor(print[0]),
                    fontSize: 12,
                    fontWeight: FontWeight.w800,
                    fontFamily: getOpinionIcon(print[0]).fontFamily,
                  ),
                ),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  print[1].toString(),
                ),
                const SizedBox(
                  width: 2,
                ),
              ],
            ),
          )
        : Container(
            padding: const EdgeInsets.symmetric(
              vertical: 8,
            ),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Colors.white,
                  getOpinionShadow(print[0]),
                ],
              ),
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  width: 2,
                ),
                Text(
                  String.fromCharCode(Icons.close_rounded.codePoint),
                  style: TextStyle(
                    inherit: false,
                    color: heavyGray,
                    shadows: [lightShadow],
                    fontSize: 12,
                    fontWeight: FontWeight.w800,
                    fontFamily: Icons.close_rounded.fontFamily,
                  ),
                ),
                const SizedBox(
                  width: 2,
                ),
                Text(
                  print[2].toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    shadows: [
                      lightShadow,
                    ],
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
              ],
            ),
          );
  }
}
