import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tictactoeplayerfirst/constants/constants.dart';
import 'package:tictactoeplayerfirst/mixins/mixins.dart';
import 'package:tictactoeplayerfirst/modules/launch_pad/models/launch_pad_model.dart';


class LaunchPad extends StatefulWidget {
  final String title;

  const LaunchPad({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  LaunchPadState createState() => LaunchPadState();
}

class LaunchPadState extends State<LaunchPad> {
  final LaunchPadModel launchPadModel = LaunchPadModel();
  final Snippet snippet = Snippet();
  late int count;

  @override
  void initState() {
    super.initState();
    launchPadModel.isWin = true;
    launchPadModel.resultDeclared = true;
    launchPadModel.players = true;
    launchPadModel.isDraw = true;
    launchPadModel.customIcon = [
      Icons.cancel,
      Icons.cancel,
      Icons.cancel,
      Icons.cancel,
      Icons.cancel,
      Icons.cancel,
      Icons.cancel,
      Icons.cancel,
      Icons.cancel,
    ];
    launchPadModel.customColor = [
      Colors.white,
      Colors.white,
      Colors.white,
      Colors.white,
      Colors.white,
      Colors.white,
      Colors.white,
      Colors.white,
      Colors.white,
    ];

    count = 0;
    launchPadModel.placeValue = List.filled(9, 0, growable: false) ;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            /// Turn Text
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  TextMessage.turn,
                  style: Theme.of(context).textTheme.headline6,
                ),
                Text( snippet.turnText(launchPadModel.resultDeclared, launchPadModel.players),

                  style: Theme.of(context).textTheme.subtitle1,
                ),
              ],
            ),

            /// Table
            Padding(
              padding: EdgeInsets.only(
                top: ((MediaQuery.of(context).size.height * 2.2) / 100),
                bottom: ((MediaQuery.of(context).size.height * 2.2) / 100),
              ),
              child: SizedBox(
                width: 280,
                child: Table(
                    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                    border: const TableBorder(horizontalInside: BorderSide( width: 4,
                        style: BorderStyle.solid,
                        color: Colors.blueGrey),verticalInside: BorderSide( width: 4,
                        style: BorderStyle.solid,
                        color: Colors.blueGrey),
                       ),
                    children: [
                      TableRow(decoration: const BoxDecoration(
                        shape: BoxShape.rectangle,
                      ),
                          children: [
                        customCell(0),
                        customCell(1),
                        customCell(2),
                      ]),
                      TableRow(
                          decoration: const BoxDecoration(
                            shape: BoxShape.rectangle,
                          ),
                          children: [
                            customCell(3),
                            customCell(4),
                            customCell(5),
                          ]),
                      TableRow(
                          decoration: const BoxDecoration(
                            shape: BoxShape.rectangle,
                          ),
                          children: [
                            customCell(6),
                            customCell(7),
                            customCell(8),
                          ]),
                    ]),
              ),
            ),

            /// Result Text
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  TextMessage.result,
                  style: Theme.of(context).textTheme.headline6,
                ),
                Text( snippet.resultText(launchPadModel.resultDeclared, launchPadModel.isDraw, launchPadModel.isWin),
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              ],
            ),

            /// Elevated Button
            Padding(
              padding: EdgeInsets.only(
                top: ((MediaQuery.of(context).size.height * 2.2) / 100),
                bottom: ((MediaQuery.of(context).size.height * 2.2) / 100),
              ),
              child: ElevatedButton(
                onPressed: () => reset(),
                child: const Text(
                  TextMessage.resetButton,
                ),
              ),
            )
          ]),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  /// Delay Working Properly
  void delay() {
    Timer(const Duration(seconds: 1), () {
      bot();
    });
  }

  /// Bot method Working Properly
  bot() {
    int i = 0;
    bool botWon = false;
    bool playerWon = false;
    count++; // for bots move
    if (count < 9) {

      if (count == 2 && i == 0) {
        /// Place first step.
        i = snippet.botFirst(launchPadModel);

        place(i, botWon);
      } else {
        playerWon = snippet.playerResultCheck(launchPadModel);

        if (!playerWon) {
          /// Win check and place.
          i = snippet.botWin(launchPadModel);
          botWon = true;

          /// Block check and place.
          if (i == 10) {
            i = snippet.botBlock(launchPadModel);
            botWon = false;
            if (i == 20) {
              i = snippet.botContinue(launchPadModel);
              botWon = false;
            }
          }

          place(i, botWon);
        } else {
          setState(() {
            snippet.playerWinResult(launchPadModel);
          });
        }
      }
    } else {
      playerWon = snippet.playerResultCheck(launchPadModel);
      if (!playerWon) {
        setState(() {
          snippet.draw(launchPadModel);
        });
      } else {
        setState(() {
          snippet.playerWinResult(launchPadModel);
        });
      }
    }
  }

  /// Bot Place Working Properly
  place(int i, bool botResult) {
    launchPadModel.customColor[i] = Colors.amber;
    launchPadModel.customIcon[i] = Icons.radio_button_off;
    launchPadModel.placeValue[i] = 5;
    setState(() {
      bool draw = snippet.drawCheck(count, launchPadModel);
      if (!draw) {
        if (!launchPadModel.players && !botResult) {
          launchPadModel.players = true;
        } else if (botResult) {
          snippet.botWinResult(launchPadModel);
        }
      } else {
        snippet.draw(launchPadModel);
      }
    });
  }

  /// Game Reset Working Properly
  void reset() {
    setState(() {
      launchPadModel.isWin = true;
      launchPadModel.resultDeclared = true;
      launchPadModel.players = true;
      launchPadModel.isDraw = true;
      launchPadModel.customIcon = [
        Icons.cancel,
        Icons.cancel,
        Icons.cancel,
        Icons.cancel,
        Icons.cancel,
        Icons.cancel,
        Icons.cancel,
        Icons.cancel,
        Icons.cancel,
      ];
      launchPadModel.customColor = [
        Colors.white,
        Colors.white,
        Colors.white,
        Colors.white,
        Colors.white,
        Colors.white,
        Colors.white,
        Colors.white,
        Colors.white,
      ];

      count = 0;
      launchPadModel.placeValue = List.filled(9, 0, growable: false) ;
    });
  }

  /// Custom TableCell Working Properly
  TableCell customCell(int i) {
    return TableCell(
      verticalAlignment: TableCellVerticalAlignment.middle,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: IconButton(
          splashRadius: 10,
          padding: const EdgeInsets.all(8),
          alignment: Alignment.center,
          onPressed: () => {
            if (launchPadModel.placeValue[i] == 0 && launchPadModel.players)
              {
                count++, // for players move
                setState(() {
                  launchPadModel.placeValue[i] = 1;
                  launchPadModel.customColor[i] = Colors.blue;
                  launchPadModel.players = false;
                }),

                delay(),
              }
          },
          color: launchPadModel.customColor[i],
          icon: Icon(
            launchPadModel.customIcon[i],
          ),
        ),
      ),
    );
  }
}
