import 'package:flutter/material.dart';

Widget StagingArea(Color color, double width, double height, double top,
    double left, double right) {
  return Container(
    margin: EdgeInsets.only(top: top, left: left, right: right),
    decoration: BoxDecoration(
      color: color,
      border: Border.all(
        color: const Color.fromARGB(255, 0, 0, 0),
      ),
    ),
    width: width,
    height: height,
  );
}
