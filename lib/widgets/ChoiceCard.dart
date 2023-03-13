import 'dart:math';

import 'package:flutter/material.dart';
import '../data/choicelist.dart';

import 'dart:async';

class ChoiceCard extends StatefulWidget {
  const ChoiceCard(
      {Key? key,
      required this.myObject,
      required this.onTap,
      required this.handleTap,
      required this.isGrayedOut})
      : super(key: key);

  final MyObject myObject;
  final VoidCallback onTap;
  final VoidCallback handleTap;
  final bool isGrayedOut;

  @override
  _ChoiceCardState createState() => _ChoiceCardState();
}

class _ChoiceCardState extends State<ChoiceCard> {
  late bool _isGrayedOut;

  @override
  Widget build(BuildContext context) {
    _isGrayedOut = widget.isGrayedOut;
    final remaining = widget.myObject.contentRemaining;
    final description = widget.myObject.description[remaining - 1];

    return Padding(
      padding: EdgeInsets.all(12.0),
      child: InkWell(
        onTap: processTap,
        child: Ink(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                transform: GradientRotation(110 * pi / 180),
                colors: [
                  Color.fromRGBO(75, 38, 47, 1),
                  Color.fromRGBO(30, 18, 18, 0.96),
                  Color.fromRGBO(50, 29, 30, 1),
                ],
              ),
              borderRadius: BorderRadius.all(Radius.circular(12))),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                    color: Color(widget.myObject.color),
                    border:
                        Border.all(color: Color.fromARGB(96, 209, 245, 223)),
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(widget.myObject.title),
                    Text("Content: $remaining"),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(8, 12, 8, 40),
                child: Text(
                  description,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void processTap() {
    if (!_isGrayedOut) {
      widget.handleTap();
      widget.onTap();
    }
  }
}
