import 'package:flutter/material.dart';
import 'dart:math';

import '../data/userdata.dart';

class DropDown extends StatefulWidget {
  const DropDown({Key? key, required this.updateRegisterNo}) : super(key: key);
  final VoidCallback updateRegisterNo;
  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<DropDown> {
  int _selectedChoice = userdata[0].choice;

  @override
  void initState() {
    super.initState();
  }

  void rebuildDropDown() {
    // Code to update the register number, for example:
    _selectedChoice = _selectedChoice;
    setState(() {}); // Call setState() to trigger a re-render of the widget
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<int>(
      dropdownColor: Color.fromARGB(255, 6, 6, 6),
      style: TextStyle(color: Colors.white),
      value: _selectedChoice,
      items: List.generate(
        7,
        (index) => DropdownMenuItem(
          child: Text('Choice ${index + 1}'),
          value: index + 1,
        ),
      ),
      onChanged: (value) {
        setState(() {
          _selectedChoice = value!;
          userdata[0].choice = _selectedChoice;
          widget.updateRegisterNo();
          rebuildDropDown();
        });
      },
    );
  }
}
