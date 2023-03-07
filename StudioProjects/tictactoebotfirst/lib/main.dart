import 'package:flutter/material.dart';
import 'package:tictactoebotfirst/config/routes/routes.dart';
import 'package:tictactoebotfirst/config/themes/style.dart';
import 'package:tictactoebotfirst/constants/constants.dart';


void main() {
  runApp(const TicTacToe());
}

class TicTacToe extends StatelessWidget {
  const TicTacToe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Style theme = Style();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: PageTitleConstants.landingScreenTitle,
      theme: theme.customTheme(context),
      initialRoute: '/',
      onGenerateRoute: Routes.generateRoute,
    );
  }
}


