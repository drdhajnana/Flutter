import 'package:flutter/material.dart';
import 'package:tictactoeplayervsplayer/constants/constants.dart';
import 'package:tictactoeplayervsplayer/mixins/mixins.dart';
import 'package:tictactoeplayervsplayer/modules/launch_pad/models/launch_pad_model.dart';

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
    launchPadModel.player1Win = true;
    launchPadModel.resultDeclared = true;
    launchPadModel.player1 = true;
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
    launchPadModel.placeValue = List.filled(9, 0, growable: false);
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
                Text(
                  snippet.turnText(
                      launchPadModel.resultDeclared, launchPadModel.player1),
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
                    border: const TableBorder(
                      horizontalInside: BorderSide(
                          width: 4,
                          style: BorderStyle.solid,
                          color: Colors.blueGrey),
                      verticalInside: BorderSide(
                          width: 4,
                          style: BorderStyle.solid,
                          color: Colors.blueGrey),
                    ),
                    children: [
                      TableRow(
                          decoration: const BoxDecoration(
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
                Text(
                  snippet.resultText(launchPadModel.resultDeclared,
                      launchPadModel.isDraw, launchPadModel.player1Win),
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

  /// Bot Place Working Properly
  place(int i, bool botResult) {
    launchPadModel.customColor[i] = Colors.amber;
    launchPadModel.customIcon[i] = Icons.radio_button_off;
    launchPadModel.placeValue[i] = 5;
    setState(() {
      bool draw = snippet.drawCheck(count, launchPadModel);
      if (!draw) {
        if (!launchPadModel.player1 && !botResult) {
          launchPadModel.player1 = true;
        } else if (botResult) {
          snippet.player2WinResult(launchPadModel);
        }
      } else {
        snippet.drawResult(launchPadModel);
      }
    });
  }

  /// Game Reset Working Properly
  void reset() {
    setState(() {
      launchPadModel.player1Win = true;
      launchPadModel.resultDeclared = true;
      launchPadModel.player1 = true;
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
      launchPadModel.placeValue = List.filled(9, 0, growable: false);
    });
  }

  /// Custom TableCell Working Properly
  TableCell customCell(int i) {
    int mod = 0;
    bool player1Win = false;
    bool player2Win = false;
    bool draw = false;
    return TableCell(
      verticalAlignment: TableCellVerticalAlignment.middle,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: IconButton(
          splashRadius: 10,
          padding: const EdgeInsets.all(8),
          alignment: Alignment.center,
          onPressed: () => {
            mod = count % 2,
            if (mod == 0 &&
                launchPadModel.player1 &&
                count < 9 &&
                launchPadModel.resultDeclared &&
                launchPadModel.placeValue[i] == 0)
              {
                count++, // for Player 1's move
                setState(() {
                  launchPadModel.placeValue[i] = 1;
                  launchPadModel.customColor[i] = Colors.blue;
                  launchPadModel.player1 = false;
                }),
              }
            else if (mod != 0 &&
                count < 9 &&
                launchPadModel.resultDeclared &&
                launchPadModel.placeValue[i] == 0)
              {
                count++, // for Player 2's move
                setState(() {
                  launchPadModel.customColor[i] = Colors.amber;
                  launchPadModel.customIcon[i] = Icons.radio_button_off;
                  launchPadModel.placeValue[i] = 5;
                  launchPadModel.customColor[i] = Colors.yellow;
                  launchPadModel.player1 = true;
                }),
              },
            player1Win = snippet.player1ResultCheck(launchPadModel),
            player2Win = snippet.player2ResultCheck(launchPadModel),
            draw = snippet.drawCheck(count, launchPadModel),
            if (player1Win)
              {
                setState(() {
                  snippet.player1WinResult(launchPadModel);
                })
              },
            if (player2Win)
              {
                setState(() {
                  snippet.player2WinResult(launchPadModel);
                })
              },
            if (draw)
              {
                setState(() {
                  snippet.drawResult(launchPadModel);
                })
              },
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
