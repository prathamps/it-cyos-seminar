import 'package:cyos/widgets/DropDown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'dart:math';

import 'dart:async';
import 'package:gsheets/gsheets.dart';

import 'club.dart';

import 'widgets/StagingArea.dart';
import 'widgets/ChoiceCard.dart';
import 'widgets/Timer.dart';
import 'widgets/NumberInputBox.dart';
import 'data/choicelist.dart';
import 'data/userdata.dart';
import 'data/offset.dart';

const _spreadsheetId = '1NfdiFjJGPJLjhappRYVmjOlAZIv6AeUr5BmEpvCbRd8';
void decrementContent(String title, List<MyObject> objects) {
  final object = objects.firstWhere((obj) => obj.title == title);
  object.contentRemaining--;
}

Future<void> main() async {
  await dotenv.load();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int count = 0;
  Color generateRandomColor() {
    Random random = Random();
    Color color = Color.fromARGB(
      255,
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
    );
    return color;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: club(),
      ),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int? registerno;
  int choice = userdata[0].choice;
  int regoffset = 1;
  Random random = new Random();
  int standardDebounce = 5;
  void updateResponse(String userchoice) async {
    //init
    final gsheets = GSheets(dotenv.env['CREDENTIALS'] ?? 'API URL NOT FOUND');
    // fetch spreadsheet y its id
    try {
      final ss = await gsheets.spreadsheet(_spreadsheetId);

      var sheet = ss.worksheetByTitle('Response');
      var currValue =
          await sheet.values.value(column: (choice * 5) - 3, row: 2);
      decrementContent(userchoice, choicelist);
      // Updating a cell
      await sheet.values.insertValue(userchoice,
          column: (choice * 5) - 4, row: int.parse(currValue) + 2);
      userdata[0].choice = userdata[0].choice + 1;
      updateRegisterNo();
    } catch (e) {
      print(e);
    }
  }

  bool _isGrayedOut = false;

  @override
  void initState() {
    super.initState();
    standardDebounce = 300 + random.nextInt(100);
    _handleTap();
  }

  void _handleTap() {
    if (!_isGrayedOut) {
      setState(() {
        _isGrayedOut = true;
      });

      Timer(Duration(seconds: standardDebounce), () {
        setState(() {
          _isGrayedOut = false;
        });
      });
    }
  }

  void updateRegisterNo() {
    // Code to update the register number, for example:

    registerno = userdata[0].registerno;
    for (var i = 0; i < registerNumbers.length; i++) {
      var currentObject = registerNumbers[i];
      if (currentObject['Register No'] == registerno) {
        int offset = currentObject['Offset'];
        regoffset = offset;
        standardDebounce = 300 + regoffset;
        break;
      }
    }

    choice = userdata[0].choice;
    setState(() {}); // Call setState() to trigger a re-render of the widget
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          // show confirmation dialog
          bool confirm = await showDialog(
            context: context,
            builder: (context) => AlertDialog(
              backgroundColor: Color.fromRGBO(30, 18, 18, 0.96),
              title: const Text(
                'Are you sure you want to go back?',
                style: TextStyle(color: Colors.white),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child:
                      const Text('No', style: TextStyle(color: Colors.white)),
                ),
                TextButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  child:
                      const Text('Yes', style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          );

          // return true if user confirms, false otherwise
          return confirm;
        },
        child: Scaffold(
            body: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromRGBO(18, 12, 14, 1),
                      Color.fromRGBO(92, 46, 56, 1),
                      Color.fromRGBO(80, 39, 47, 1),
                    ],
                    stops: [0, 0.8, 1],
                  ),
                ),
                child: Column(children: [
                  SizedBox(
                      height: 150,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                              decoration: BoxDecoration(
                                  color: _isGrayedOut
                                      ? const Color.fromARGB(255, 158, 20, 20)
                                      : const Color.fromARGB(255, 80, 195, 111),
                                  border: Border.all(color: Colors.black),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(12))),
                              padding: const EdgeInsets.all(12),
                              child: Text(_isGrayedOut ? "Closed" : "Open",
                                  style: const TextStyle(
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      fontWeight: FontWeight.w400))),
                          Container(
                            child: _isGrayedOut
                                ? ReverseTimer(seconds: standardDebounce)
                                : Container(
                                    child: const Center(
                                      child: Text("Choose your topics",
                                          style: TextStyle(
                                              color: Color(0XFFFFF4F4),
                                              fontWeight: FontWeight.w400,
                                              fontSize: 18)),
                                    ),
                                  ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 86, 86, 86),
                                border: Border.all(color: Colors.black),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(12))),
                            padding: const EdgeInsets.only(
                                top: 12, bottom: 12, left: 18, right: 18),
                            child: Text("$choice",
                                style: const TextStyle(
                                    color: Color(0XFFFFF4F4),
                                    fontWeight: FontWeight.w400)),
                          )
                        ],
                      )),
                  NumberInputBox(updateRegisterNo: updateRegisterNo),
                  Container(
                      margin: const EdgeInsets.only(top: 24),
                      child: Column(children: [
                        const Text(
                          "Change with discretion",
                          style: TextStyle(color: Colors.white),
                        ),
                        DropDown(updateRegisterNo: updateRegisterNo)
                      ])),
                  Expanded(
                    child: ListView.separated(
                      shrinkWrap: true,
                      itemCount: choicelist.length,
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 12),
                      itemBuilder: (context, index) {
                        if (choicelist[index].contentRemaining > 0) {
                          return Material(
                              color: Colors.transparent,
                              child: ChoiceCard(
                                myObject: choicelist[index],
                                onTap: () {
                                  updateResponse(choicelist[index].title);
                                },
                                handleTap: _handleTap,
                                isGrayedOut: _isGrayedOut,
                              ));
                        } else {
                          return Center(
                              child: Text(
                            "${choicelist[index].title} - completed",
                            style: TextStyle(color: Colors.white),
                          ));
                        }
                      },
                    ),
                  )
                ]))));
  }
}
