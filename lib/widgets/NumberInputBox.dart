import 'package:flutter/material.dart';

import 'package:flutter/services.dart';

import '../data/userdata.dart';

class NumberInputBox extends StatefulWidget {
  const NumberInputBox({Key? key, required this.updateRegisterNo})
      : super(key: key);
  final VoidCallback updateRegisterNo;
  @override
  _NumericInputBoxState createState() => _NumericInputBoxState();
}

class _NumericInputBoxState extends State<NumberInputBox> {
  late String _inputValue;
  bool _isEditMode = true;

  @override
  void initState() {
    super.initState();
    _inputValue = '';
  }

  @override
  Widget build(BuildContext context) {
    final double boxWidth = 150; // increase box width to 100

    return GestureDetector(
      onLongPress: () {
        setState(() {
          _isEditMode = true;
        });
      },
      child: _isEditMode
          ? Container(
              width: boxWidth,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      style: TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(8),
                          border: InputBorder.none,
                          hintStyle: TextStyle(color: Colors.white),
                          labelStyle: TextStyle(color: Colors.white),
                          hintText: 'Register Number'),
                      cursorColor: Colors.amber,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(
                            8), // allow up to 8 digits
                      ],
                      onChanged: (value) {
                        setState(() {
                          _inputValue = value;
                          userdata[0].registerno = int.parse(_inputValue);
                          widget.updateRegisterNo();
                        });
                      },
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        _isEditMode = false;
                      });
                    },
                    icon: Icon(Icons.check, color: Colors.white),
                  ),
                ],
              ),
            )
          : GestureDetector(
              onLongPress: () {
                setState(() {
                  _isEditMode = true;
                });
              },
              child: Container(
                width: boxWidth,
                padding: const EdgeInsets.only(
                    top: 12, bottom: 12, left: 8, right: 8),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Center(
                    child: Text(
                  _inputValue,
                  style: TextStyle(color: Colors.white),
                )),
              ),
            ),
    );
  }
}
