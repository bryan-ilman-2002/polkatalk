import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:polkatalk/enums/session_status.dart';
import 'package:polkatalk/functions/getters/light_shadow.dart';
import 'package:polkatalk/widgets/txt_with_bg.dart';

class SessionCard extends StatefulWidget {
  final String name;
  final String profession;

  final SessionStatus varSessionStatus;
  final bool authenticated;

  final String currency;
  final double totalCost;

  const SessionCard(
      {super.key,
      required this.name,
      required this.profession,
      required this.varSessionStatus,
      required this.authenticated,
      required this.currency,
      required this.totalCost});

  @override
  State<SessionCard> createState() => _SessionCardState();
}

class _SessionCardState extends State<SessionCard> {
  String get currentDate {
    DateTime now = DateTime.now();
    DateFormat formatter = DateFormat('dd/MM/yy HH:mm');
    return formatter.format(now);
  }

  String formatNumberWithLocalizedSeparators(double number) {
    final formatter = NumberFormat("#,###", Intl.defaultLocale);
    return formatter.format(number);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 0,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              lightShadow,
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey[200],
                  ),
                  // Replace with your photo widget
                  child: const Center(
                    child: Icon(Icons.photo, color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(width: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    widget.profession,
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextWithBackground(
                          text: widget.varSessionStatus.string,
                          varColor:
                              widget.varSessionStatus == SessionStatus.scheduled
                                  ? Colors.amber
                                  : Colors.green),
                      const SizedBox(width: 8),
                      Icon(
                        Icons.fact_check_outlined,
                        color: widget.authenticated
                            ? Colors.grey
                            : Colors.transparent,
                        size: 20,
                      )
                    ],
                  ),
                ],
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 16, right: 12, top: 8, bottom: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'start:',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        currentDate,
                        style: const TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'end:',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        currentDate,
                        style: const TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '${widget.currency} ${formatNumberWithLocalizedSeparators(widget.totalCost)}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
