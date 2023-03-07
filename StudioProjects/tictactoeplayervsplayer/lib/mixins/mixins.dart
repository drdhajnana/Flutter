import 'package:tictactoeplayervsplayer/constants/constants.dart';
import 'package:tictactoeplayervsplayer/modules/launch_pad/models/launch_pad_model.dart';

mixin Player1ResultCheck {
  /// Player Result Check Working Properly
  bool player1ResultCheck(LaunchPadModel launchPadModel) {
    bool playerVictory = false;
    if (launchPadModel.placeValue[0] == 1 &&
        launchPadModel.placeValue[1] == 1 &&
        launchPadModel.placeValue[2] == 1) {
      playerVictory = true;
    } else if (launchPadModel.placeValue[3] == 1 &&
        launchPadModel.placeValue[4] == 1 &&
        launchPadModel.placeValue[5] == 1) {
      playerVictory = true;
    } else if (launchPadModel.placeValue[6] == 1 &&
        launchPadModel.placeValue[7] == 1 &&
        launchPadModel.placeValue[8] == 1) {
      playerVictory = true;
    } else if (launchPadModel.placeValue[0] == 1 &&
        launchPadModel.placeValue[3] == 1 &&
        launchPadModel.placeValue[6] == 1) {
      playerVictory = true;
    } else if (launchPadModel.placeValue[1] == 1 &&
        launchPadModel.placeValue[4] == 1 &&
        launchPadModel.placeValue[7] == 1) {
      playerVictory = true;
    } else if (launchPadModel.placeValue[2] == 1 &&
        launchPadModel.placeValue[5] == 1 &&
        launchPadModel.placeValue[8] == 1) {
      playerVictory = true;
    } else if (launchPadModel.placeValue[0] == 1 &&
        launchPadModel.placeValue[4] == 1 &&
        launchPadModel.placeValue[8] == 1) {
      playerVictory = true;
    } else if (launchPadModel.placeValue[6] == 1 &&
        launchPadModel.placeValue[4] == 1 &&
        launchPadModel.placeValue[2] == 1) {
      playerVictory = true;
    }
    return playerVictory;
  }
}
mixin Player2ResultCheck {
  /// Player Result Check Working Properly
  bool player2ResultCheck(LaunchPadModel launchPadModel) {
    bool playerVictory = false;
    if (launchPadModel.placeValue[0] == 5 &&
        launchPadModel.placeValue[1] == 5 &&
        launchPadModel.placeValue[2] == 5) {
      playerVictory = true;
    } else if (launchPadModel.placeValue[3] == 5 &&
        launchPadModel.placeValue[4] == 5 &&
        launchPadModel.placeValue[5] == 5) {
      playerVictory = true;
    } else if (launchPadModel.placeValue[6] == 5 &&
        launchPadModel.placeValue[7] == 5 &&
        launchPadModel.placeValue[8] == 5) {
      playerVictory = true;
    } else if (launchPadModel.placeValue[0] == 5 &&
        launchPadModel.placeValue[3] == 5 &&
        launchPadModel.placeValue[6] == 5) {
      playerVictory = true;
    } else if (launchPadModel.placeValue[1] == 5 &&
        launchPadModel.placeValue[4] == 5 &&
        launchPadModel.placeValue[7] == 5) {
      playerVictory = true;
    } else if (launchPadModel.placeValue[2] == 5 &&
        launchPadModel.placeValue[5] == 5 &&
        launchPadModel.placeValue[8] == 5) {
      playerVictory = true;
    } else if (launchPadModel.placeValue[0] == 5 &&
        launchPadModel.placeValue[4] == 5 &&
        launchPadModel.placeValue[8] == 5) {
      playerVictory = true;
    } else if (launchPadModel.placeValue[6] == 5 &&
        launchPadModel.placeValue[4] == 5 &&
        launchPadModel.placeValue[2] == 5) {
      playerVictory = true;
    }
    return playerVictory;
  }
}
mixin DrawCheck {
  /// Draw Check Working Properly
  bool drawCheck(int count, LaunchPadModel launchPadModel) {
    bool draw = false;
    int drawCount = 0;
    int row1 = launchPadModel.placeValue[0] +
        launchPadModel.placeValue[1] +
        launchPadModel.placeValue[2];
    int row2 = launchPadModel.placeValue[3] +
        launchPadModel.placeValue[4] +
        launchPadModel.placeValue[5];
    int row3 = launchPadModel.placeValue[6] +
        launchPadModel.placeValue[7] +
        launchPadModel.placeValue[8];
    int col1 = launchPadModel.placeValue[0] +
        launchPadModel.placeValue[3] +
        launchPadModel.placeValue[6];
    int col2 = launchPadModel.placeValue[1] +
        launchPadModel.placeValue[4] +
        launchPadModel.placeValue[7];
    int col3 = launchPadModel.placeValue[2] +
        launchPadModel.placeValue[5] +
        launchPadModel.placeValue[8];
    int dia1 = launchPadModel.placeValue[0] +
        launchPadModel.placeValue[4] +
        launchPadModel.placeValue[8];
    int dia2 = launchPadModel.placeValue[2] +
        launchPadModel.placeValue[4] +
        launchPadModel.placeValue[6];
    if (row1 == 11 || row1 == 7 || row1 == 6 || (row1 == 10 && count == 8)) {
      drawCount++;
    }
    if (row2 == 11 || row2 == 7 || row2 == 6 || (row2 == 10 && count == 8)) {
      drawCount++;
    }
    if (row3 == 11 || row3 == 7 || row3 == 6 || (row3 == 10 && count == 8)) {
      drawCount++;
    }
    if (col1 == 11 || col1 == 7 || col1 == 6 || (col1 == 10 && count == 8)) {
      drawCount++;
    }
    if (col2 == 11 || col2 == 7 || col2 == 6 || (col2 == 10 && count == 8)) {
      drawCount++;
    }
    if (col3 == 11 || col3 == 7 || col3 == 6 || (col3 == 10 && count == 8)) {
      drawCount++;
    }
    if (dia1 == 11 || dia1 == 7 || dia1 == 6 || (dia1 == 10 && count == 8)) {
      drawCount++;
    }
    if (dia2 == 11 || dia2 == 7 || dia2 == 6 || (dia2 == 10 && count == 8)) {
      drawCount++;
    }
    if (drawCount == 8) {
      draw = true;
    }
    return draw;
  }
}

mixin Player2WinResult {
  void player2WinResult(LaunchPadModel launchPadModel) {
    launchPadModel.resultDeclared = false;
    launchPadModel.isDraw = false;
    launchPadModel.player1Win = false;
    launchPadModel.player1 = false;
  }
}
mixin Player1WinResult {
  void player1WinResult(LaunchPadModel launchPadModel) {
    launchPadModel.resultDeclared = false;
    launchPadModel.isDraw = false;
    launchPadModel.player1Win = true;
    launchPadModel.player1 = false;
  }
}
mixin DrawResult {
  void drawResult(LaunchPadModel launchPadModel) {
    launchPadModel.resultDeclared = false;
    launchPadModel.isDraw = true;
    launchPadModel.player1Win = false;
    launchPadModel.player1 = false;
  }
}

mixin TurnText {
  String returnTurnString = '';

  String turnText(bool resultDeclared, bool players) {
    resultDeclared
        ? players
            ? returnTurnString = TextMessage.turnMessage1
            : returnTurnString = TextMessage.turnMessage2
        : returnTurnString = TextMessage.turnMessage3;
    return returnTurnString;
  }
}
mixin ResultText {
  String returnResultString = '';

  String resultText(bool resultDeclared, bool isDraw, bool isWin) {
    resultDeclared
        ? returnResultString = TextMessage.resultMessage1
        : isDraw
            ? returnResultString = TextMessage.resultMessage2
            : isWin
                ? returnResultString = TextMessage.resultMessage3
                : returnResultString = TextMessage.resultMessage4;
    return returnResultString;
  }
}

class Snippet
    with
        Player1ResultCheck,
        Player2ResultCheck,
        DrawResult,
        Player2WinResult,
        DrawCheck,
        Player1WinResult,
        TurnText,
        ResultText {}
