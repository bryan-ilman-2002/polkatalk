import 'package:flutter/material.dart';
import 'package:polkatalk/enums/direction.dart';
import 'package:polkatalk/functions/getters/app_colors.dart';
import 'package:polkatalk/functions/getters/heavy_shadow.dart';
import 'package:polkatalk/functions/getters/light_shadow.dart';

class Tag extends StatelessWidget {
  final String print;

  const Tag({
    super.key,
    required this.print,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          heavyShadow,
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buttonBuilder(Direction.left),
          _buttonBuilder(Direction.right),
        ],
      ),
    );
  }

  Widget _buttonBuilder(Direction value) {
    bool eitherLeftOrRight() => value == Direction.left;
    // color:  const Color.fromARGB(255, 214, 244, 215),

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
                  width: 4,
                ),
                Text(
                  String.fromCharCode(Icons.check_rounded.codePoint),
                  style: TextStyle(
                    inherit: false,
                    color: primaryAppColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w800,
                    fontFamily: Icons.check_rounded.fontFamily,
                  ),
                ),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  print,
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
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Colors.white,
                  Color.fromARGB(251, 190, 248, 190),
                ],
              ),
              borderRadius: BorderRadius.only(
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
                Icon(
                  Icons.close_rounded,
                  size: 12,
                  color: heavyGray,
                  shadows: [lightShadow],
                ),
                const SizedBox(
                  width: 2,
                ),
                Text(
                  '12',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    shadows: [
                      lightShadow,
                    ],
                  ),
                ),
                const SizedBox(
                  width: 4,
                ),
              ],
            ),
          );
  }

  // return Row(
  //   mainAxisSize: MainAxisSize.min,
  //   children: [
  //     Container(
  //       padding: const EdgeInsets.all(8),
  //       decoration: BoxDecoration(
  //         color: Colors.white,
  //         borderRadius: BorderRadius.circular(12),
  //         boxShadow: [
  //           heavyShadow,
  //         ],
  //       ),
  //       child: Row(
  //         mainAxisSize: MainAxisSize.min,
  //         children: [
  //           Padding(
  //             padding: const EdgeInsets.symmetric(horizontal: 4),
  //             child: Text(
  //               String.fromCharCode(Icons.check_rounded.codePoint),
  //               style: TextStyle(
  //                 inherit: false,
  //                 color: primaryAppColor,
  //                 fontSize: 12,
  //                 fontWeight: FontWeight.w800,
  //                 fontFamily: Icons.check_rounded.fontFamily,
  //               ),
  //             ),
  //           ),
  //           // const SizedBox(
  //           //   width: 4,
  //           // ),
  //           Text(
  //             print,
  //           ),
  //           const SizedBox(
  //             width: 4,
  //           ),
  //         ],
  //       ),
  //     ),
  //     Icon(
  //       Icons.close_rounded,
  //       size: 12,
  //       color: moderateGray,
  //       shadows: [lightShadow],
  //     ),
  //     const SizedBox(
  //       width: 2,
  //     ),
  //     Text(
  //       '12',
  //       style: TextStyle(
  //         fontWeight: FontWeight.bold,
  //         shadows: [
  //           lightShadow,
  //         ],
  //       ),
  //     ),
  //   ],
  // );
}
