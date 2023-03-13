import 'dart:async';
import 'package:flutter/material.dart';

class ReverseTimer extends StatefulWidget {
  final int seconds;

  ReverseTimer({required this.seconds});

  @override
  _ReverseTimerState createState() => _ReverseTimerState();
}

class _ReverseTimerState extends State<ReverseTimer> {
  late Timer _timer;
  int _remainingSeconds = 0;

  @override
  void initState() {
    super.initState();
    _remainingSeconds = widget.seconds;
    _timer = Timer.periodic(Duration(seconds: 1), _tick);
  }

  void _tick(Timer timer) {
    setState(() {
      if (_remainingSeconds > 0) {
        _remainingSeconds--;
      } else {
        _timer.cancel();
      }
    });
  }

  String _formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    return '$minutes:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _formatTime(_remainingSeconds),
      style: const TextStyle(
          color: Color(0XFFFFF4F4), fontWeight: FontWeight.w400),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
