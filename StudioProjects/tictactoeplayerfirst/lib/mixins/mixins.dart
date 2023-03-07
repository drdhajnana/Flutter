import 'dart:math';

import 'package:tictactoeplayerfirst/constants/constants.dart';
import 'package:tictactoeplayerfirst/modules/launch_pad/models/launch_pad_model.dart';



mixin PlayerResultCheck {
  /// Player Result Check Working Properly
  bool playerResultCheck(LaunchPadModel launchPadModel) {
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

mixin BotFirst {
  /// First Working Properly
  int botFirst(LaunchPadModel launchPadModel) {
    int value = 8;
    int temp = 0;

    for (int i = 0; i < 9; i++) {
      if (1 == launchPadModel.placeValue[i]) {
        break;
      }
      temp++;
    }

    for (int infinite = 0; infinite < 1000000; infinite++) {
      value = 8;

      value = Random().nextInt(value);

      if (value != temp) {
        break;
      }
    }

    return value;
  }
}
mixin BotWin {
  /// Win Working Properly
  int botWin(LaunchPadModel launchPadModel) {
    int value = 10;
    if ((launchPadModel.placeValue[0] == 5 &&
            launchPadModel.placeValue[1] == 5 &&
            launchPadModel.placeValue[2] == 0) ||
        (launchPadModel.placeValue[4] == 5 &&
            launchPadModel.placeValue[6] == 5 &&
            launchPadModel.placeValue[2] == 0) ||
        (launchPadModel.placeValue[5] == 5 &&
            launchPadModel.placeValue[8] == 5 &&
            launchPadModel.placeValue[2] == 0)) {
      value = 2;
      launchPadModel.placeValue[2] = 5;
    } else if ((launchPadModel.placeValue[6] == 5 &&
            launchPadModel.placeValue[7] == 5 &&
            launchPadModel.placeValue[8] == 0) ||
        (launchPadModel.placeValue[2] == 5 &&
            launchPadModel.placeValue[5] == 5 &&
            launchPadModel.placeValue[8] == 0) ||
        (launchPadModel.placeValue[0] == 5 &&
            launchPadModel.placeValue[4] == 5 &&
            launchPadModel.placeValue[8] == 0)) {
      value = 8;
      launchPadModel.placeValue[8] = 5;
    } else if ((launchPadModel.placeValue[2] == 5 &&
            launchPadModel.placeValue[1] == 5 &&
            launchPadModel.placeValue[0] == 0) ||
        (launchPadModel.placeValue[3] == 5 &&
            launchPadModel.placeValue[6] == 5 &&
            launchPadModel.placeValue[0] == 0) ||
        (launchPadModel.placeValue[4] == 5 &&
            launchPadModel.placeValue[8] == 5 &&
            launchPadModel.placeValue[0] == 0)) {
      value = 0;
      launchPadModel.placeValue[0] = 5;
    } else if ((launchPadModel.placeValue[5] == 5 &&
            launchPadModel.placeValue[4] == 5 &&
            launchPadModel.placeValue[3] == 0) ||
        (launchPadModel.placeValue[0] == 5 &&
            launchPadModel.placeValue[6] == 5 &&
            launchPadModel.placeValue[3] == 0)) {
      value = 3;
      launchPadModel.placeValue[3] = 5;
    } else if ((launchPadModel.placeValue[8] == 5 &&
            launchPadModel.placeValue[7] == 5 &&
            launchPadModel.placeValue[6] == 0) ||
        (launchPadModel.placeValue[0] == 5 &&
            launchPadModel.placeValue[3] == 5 &&
            launchPadModel.placeValue[6] == 0) ||
        (launchPadModel.placeValue[4] == 5 &&
            launchPadModel.placeValue[2] == 5 &&
            launchPadModel.placeValue[6] == 0)) {
      value = 6;
      launchPadModel.placeValue[6] = 5;
    } else if ((launchPadModel.placeValue[2] == 5 &&
            launchPadModel.placeValue[0] == 5 &&
            launchPadModel.placeValue[1] == 0) ||
        (launchPadModel.placeValue[4] == 5 &&
            launchPadModel.placeValue[7] == 5 &&
            launchPadModel.placeValue[1] == 0)) {
      value = 1;
      launchPadModel.placeValue[1] = 5;
    } else if ((launchPadModel.placeValue[5] == 5 &&
            launchPadModel.placeValue[3] == 5 &&
            launchPadModel.placeValue[4] == 0) ||
        (launchPadModel.placeValue[0] == 5 &&
            launchPadModel.placeValue[8] == 5 &&
            launchPadModel.placeValue[4] == 0) ||
        (launchPadModel.placeValue[1] == 5 &&
            launchPadModel.placeValue[7] == 5 &&
            launchPadModel.placeValue[4] == 0) ||
        (launchPadModel.placeValue[6] == 5 &&
            launchPadModel.placeValue[2] == 5 &&
            launchPadModel.placeValue[4] == 0)) {
      value = 4;
      launchPadModel.placeValue[4] = 5;
    } else if ((launchPadModel.placeValue[8] == 5 &&
            launchPadModel.placeValue[6] == 5 &&
            launchPadModel.placeValue[7] == 0) ||
        (launchPadModel.placeValue[1] == 5 &&
            launchPadModel.placeValue[4] == 5 &&
            launchPadModel.placeValue[7] == 0)) {
      value = 7;
      launchPadModel.placeValue[7] = 5;
    } else if ((launchPadModel.placeValue[2] == 5 &&
            launchPadModel.placeValue[8] == 5 &&
            launchPadModel.placeValue[5] == 0) ||
        (launchPadModel.placeValue[3] == 5 &&
            launchPadModel.placeValue[4] == 5 &&
            launchPadModel.placeValue[5] == 0)) {
      value = 5;
      launchPadModel.placeValue[5] = 5;
    }

    return value;
  }
}

mixin BotContinue {
  int botContinue(LaunchPadModel launchPadModel) {
    int value = 9;
    List<int> temp = List.empty(growable: true);
    List<int> temp1 = List.empty(growable: true);
    for (int i = 0; i < 9; i++) {
      if (launchPadModel.placeValue[i] == 5) {
        temp.add(i);
      }
    }
    temp1 = temp;
    if (temp.isNotEmpty) {
      for (int j = 0; j < temp.length; j++) {
        if (temp[j] == 0) {
          for (int i = 0; i < temp1.length; i++) {
            if (temp1[i] != 3 && launchPadModel.placeValue[3] == 0) {
              value = 3;
              break;
            } else if (temp1[i] != 4 && launchPadModel.placeValue[4] == 0) {
              value = 4;
              break;
            } else if (temp1[i] != 1 && launchPadModel.placeValue[1] == 0) {
              value = 1;
              break;
            }
          }
          if (value != 9) break;
        } else if (temp[j] == 1) {
          for (int i = 0; i < temp1.length; i++) {
            if (temp1[i] != 3 && launchPadModel.placeValue[3] == 0) {
              value = 3;
              break;
            } else if (temp1[i] != 4 && launchPadModel.placeValue[4] == 0) {
              value = 4;
              break;
            } else if (temp1[i] != 0 && launchPadModel.placeValue[0] == 0) {
              value = 0;
              break;
            } else if (temp1[i] != 2 && launchPadModel.placeValue[2] == 0) {
              value = 2;
              break;
            } else if (temp1[i] != 5 && launchPadModel.placeValue[5] == 0) {
              value = 5;
              break;
            }
          }
          if (value != 9) break;
        } else if (temp[j] == 2) {
          for (int i = 0; i < temp1.length; i++) {
            if (temp1[i] != 4 && launchPadModel.placeValue[4] == 0) {
              value = 4;
              break;
            } else if (temp1[i] != 1 && launchPadModel.placeValue[1] == 0) {
              value = 1;
              break;
            } else if (temp1[i] != 3 && launchPadModel.placeValue[3] == 0) {
              value = 3;
              break;
            }
          }
          if (value != 9) break;
        } else if (temp[j] == 3) {
          for (int i = 0; i < temp1.length; i++) {
            if (temp1[i] != 0 && launchPadModel.placeValue[0] == 0) {
              value = 0;
              break;
            } else if (temp1[i] != 4 && launchPadModel.placeValue[4] == 0) {
              value = 4;
              break;
            } else if (temp1[i] != 1 && launchPadModel.placeValue[1] == 0) {
              value = 1;
              break;
            } else if (temp1[i] != 7 && launchPadModel.placeValue[7] == 0) {
              value = 7;
              break;
            } else if (temp1[i] != 6 && launchPadModel.placeValue[6] == 0) {
              value = 6;
              break;
            }
          }
          if (value != 9) break;
        } else if (temp[j] == 4) {
          for (int i = 0; i < temp1.length; i++) {
            if (temp1[i] != 3 && launchPadModel.placeValue[3] == 0) {
              value = 3;
              break;
            } else if (temp1[i] != 5 && launchPadModel.placeValue[5] == 0) {
              value = 5;
              break;
            } else if (temp1[i] != 1 && launchPadModel.placeValue[1] == 0) {
              value = 1;
              break;
            } else if (temp1[i] != 0 && launchPadModel.placeValue[0] == 0) {
              value = 0;
              break;
            } else if (temp1[i] != 2 && launchPadModel.placeValue[2] == 0) {
              value = 2;
              break;
            } else if (temp1[i] != 6 && launchPadModel.placeValue[6] == 0) {
              value = 6;
              break;
            } else if (temp1[i] != 7 && launchPadModel.placeValue[7] == 0) {
              value = 7;
              break;
            } else if (temp1[i] != 8 && launchPadModel.placeValue[8] == 0) {
              value = 8;
              break;
            }
          }
          if (value != 9) break;
        } else if (temp[j] == 5) {
          for (int i = 0; i < temp1.length; i++) {
            if (temp1[i] != 1 && launchPadModel.placeValue[1] == 0) {
              value = 1;
              break;
            } else if (temp1[i] != 2 && launchPadModel.placeValue[2] == 0) {
              value = 2;
              break;
            } else if (temp1[i] != 4 && launchPadModel.placeValue[4] == 0) {
              value = 4;
              break;
            } else if (temp1[i] != 7 && launchPadModel.placeValue[7] == 0) {
              value = 7;
              break;
            } else if (temp1[i] != 8 && launchPadModel.placeValue[8] == 0) {
              value = 8;
              break;
            }
          }
          if (value != 9) break;
        } else if (temp[j] == 6) {
          for (int i = 0; i < temp1.length; i++) {
            if (temp1[i] != 3 && launchPadModel.placeValue[3] == 0) {
              value = 3;
              break;
            } else if (temp1[i] != 7 && launchPadModel.placeValue[7] == 0) {
              value = 7;
              break;
            } else if (temp1[i] != 4 && launchPadModel.placeValue[4] == 0) {
              value = 4;
              break;
            }
          }
          if (value != 9) break;
        } else if (temp[j] == 7) {
          for (int i = 0; i < temp1.length; i++) {
            if (temp1[i] != 3 && launchPadModel.placeValue[3] == 0) {
              value = 3;
              break;
            } else if (temp1[i] != 4 && launchPadModel.placeValue[4] == 0) {
              value = 4;
              break;
            } else if (temp1[i] != 5 && launchPadModel.placeValue[5] == 0) {
              value = 5;
              break;
            } else if (temp1[i] != 8 && launchPadModel.placeValue[8] == 0) {
              value = 8;
              break;
            } else if (temp1[i] != 6 && launchPadModel.placeValue[6] == 0) {
              value = 6;
              break;
            }
          }
          if (value != 9) break;
        } else if (temp[j] == 8) {
          for (int i = 0; i < temp1.length; i++) {
            if (temp1[i] != 5 && launchPadModel.placeValue[5] == 0) {
              value = 5;
              break;
            } else if (temp1[i] != 4 && launchPadModel.placeValue[4] == 0) {
              value = 4;
              break;
            } else if (temp1[i] != 7 && launchPadModel.placeValue[7] == 0) {
              value = 7;
              break;
            }
          }
        }
        if (value != 9) break;
      }
    }
    return value;
  }
}
mixin BotBlock {
  /// Block Working Properly
  int botBlock(LaunchPadModel launchPadModel) {
    int value = 20;
    if ((launchPadModel.placeValue[0] == 1 &&
            launchPadModel.placeValue[1] == 1 &&
            launchPadModel.placeValue[2] == 0) ||
        (launchPadModel.placeValue[4] == 1 &&
            launchPadModel.placeValue[6] == 1 &&
            launchPadModel.placeValue[2] == 0) ||
        (launchPadModel.placeValue[5] == 1 &&
            launchPadModel.placeValue[8] == 1 &&
            launchPadModel.placeValue[2] == 0)) {
      value = 2;
      launchPadModel.placeValue[2] = 5;
    } else if ((launchPadModel.placeValue[6] == 1 &&
            launchPadModel.placeValue[7] == 1 &&
            launchPadModel.placeValue[8] == 0) ||
        (launchPadModel.placeValue[2] == 1 &&
            launchPadModel.placeValue[5] == 1 &&
            launchPadModel.placeValue[8] == 0) ||
        (launchPadModel.placeValue[0] == 1 &&
            launchPadModel.placeValue[4] == 1 &&
            launchPadModel.placeValue[8] == 0)) {
      value = 8;
      launchPadModel.placeValue[8] = 5;
    } else if ((launchPadModel.placeValue[2] == 1 &&
            launchPadModel.placeValue[1] == 1 &&
            launchPadModel.placeValue[0] == 0) ||
        (launchPadModel.placeValue[3] == 1 &&
            launchPadModel.placeValue[6] == 1 &&
            launchPadModel.placeValue[0] == 0) ||
        (launchPadModel.placeValue[4] == 1 &&
            launchPadModel.placeValue[8] == 1 &&
            launchPadModel.placeValue[0] == 0)) {
      value = 0;
      launchPadModel.placeValue[0] = 5;
    } else if ((launchPadModel.placeValue[5] == 1 &&
            launchPadModel.placeValue[4] == 1 &&
            launchPadModel.placeValue[3] == 0) ||
        (launchPadModel.placeValue[0] == 1 &&
            launchPadModel.placeValue[6] == 1 &&
            launchPadModel.placeValue[3] == 0)) {
      value = 3;
      launchPadModel.placeValue[3] = 5;
    } else if ((launchPadModel.placeValue[8] == 1 &&
            launchPadModel.placeValue[7] == 1 &&
            launchPadModel.placeValue[6] == 0) ||
        (launchPadModel.placeValue[0] == 1 &&
            launchPadModel.placeValue[3] == 1 &&
            launchPadModel.placeValue[6] == 0) ||
        (launchPadModel.placeValue[4] == 1 &&
            launchPadModel.placeValue[2] == 1 &&
            launchPadModel.placeValue[6] == 0)) {
      value = 6;
      launchPadModel.placeValue[6] = 5;
    } else if ((launchPadModel.placeValue[2] == 1 &&
            launchPadModel.placeValue[0] == 1 &&
            launchPadModel.placeValue[1] == 0) ||
        (launchPadModel.placeValue[4] == 1 &&
            launchPadModel.placeValue[7] == 1 &&
            launchPadModel.placeValue[1] == 0)) {
      value = 1;
      launchPadModel.placeValue[1] = 5;
    } else if ((launchPadModel.placeValue[5] == 1 &&
            launchPadModel.placeValue[3] == 1 &&
            launchPadModel.placeValue[4] == 0) ||
        (launchPadModel.placeValue[0] == 1 &&
            launchPadModel.placeValue[8] == 1 &&
            launchPadModel.placeValue[4] == 0) ||
        (launchPadModel.placeValue[1] == 1 &&
            launchPadModel.placeValue[7] == 1 &&
            launchPadModel.placeValue[4] == 0) ||
        (launchPadModel.placeValue[6] == 1 &&
            launchPadModel.placeValue[2] == 1 &&
            launchPadModel.placeValue[4] == 0)) {
      value = 4;
      launchPadModel.placeValue[4] = 5;
    } else if ((launchPadModel.placeValue[8] == 1 &&
            launchPadModel.placeValue[6] == 1 &&
            launchPadModel.placeValue[7] == 0) ||
        (launchPadModel.placeValue[1] == 1 &&
            launchPadModel.placeValue[4] == 1 &&
            launchPadModel.placeValue[7] == 0)) {
      value = 7;
      launchPadModel.placeValue[7] = 5;
    } else if ((launchPadModel.placeValue[2] == 1 &&
            launchPadModel.placeValue[8] == 1 &&
            launchPadModel.placeValue[5] == 0) ||
        (launchPadModel.placeValue[3] == 1 &&
            launchPadModel.placeValue[4] == 1 &&
            launchPadModel.placeValue[5] == 0)) {
      value = 5;
      launchPadModel.placeValue[5] = 5;
    }
    return value;
  }
}

mixin Draw {
  void draw(LaunchPadModel launchPadModel) {
    launchPadModel.resultDeclared = false;
    launchPadModel.isDraw = true;
    launchPadModel.isWin = false;
    launchPadModel.players = false;
}
}
mixin BotWinResult {
  void botWinResult(LaunchPadModel launchPadModel) {
    launchPadModel.resultDeclared = false;
    launchPadModel.isDraw = false;
    launchPadModel.isWin = false;
    launchPadModel.players = false;
  }
}
mixin PlayerWinResult {
  void playerWinResult(LaunchPadModel launchPadModel) {
    launchPadModel.resultDeclared = false;
    launchPadModel.isDraw = false;
    launchPadModel.isWin = true;
    launchPadModel.players = false;
  }
}

mixin TurnText {

  String returnTurnString = '';
  String turnText(bool resultDeclared, bool players){

    resultDeclared
        ? players
        ? returnTurnString = TextMessage.turnMessage1
        : returnTurnString =  TextMessage.turnMessage2
        : returnTurnString = TextMessage.turnMessage3;
    return returnTurnString;
  }

}
mixin ResultText {

  String returnResultString = '';
  String resultText(bool resultDeclared, bool isDraw, bool isWin){

  resultDeclared
        ? returnResultString = TextMessage.resultMessage1
        : isDraw
        ? returnResultString= TextMessage.resultMessage2
        : isWin
        ? returnResultString=TextMessage.resultMessage3
        : returnResultString=TextMessage.resultMessage4;
    return returnResultString;
  }

}

class Snippet
    with
        PlayerResultCheck,
        BotFirst,
        BotWin,
        BotContinue,
        DrawCheck,
        BotBlock, Draw, BotWinResult, PlayerWinResult, TurnText, ResultText {}
