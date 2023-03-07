import 'package:flutter/material.dart';

class Style {
  Style();

  ThemeData customTheme(BuildContext context) {
    return ThemeData(
     appBarTheme: const AppBarTheme(
          centerTitle: true,
          elevation: 7.3,
          backgroundColor: Colors.black54,
          titleTextStyle: TextStyle(
              fontSize: 22.041984,
              fontFamily: 'Libre Baskerville',
              overflow: TextOverflow.ellipsis,
              color: Colors.white,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal)),
      scaffoldBackgroundColor: const Color.fromRGBO(58, 66, 86, 1.0),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          minimumSize: MaterialStateProperty.resolveWith<Size>(
            (Set<MaterialState> states) {
              return const Size(170, 47);
            },
          ),
          textStyle: MaterialStateProperty.resolveWith<TextStyle>(
            (Set<MaterialState> states) {
              return const TextStyle(
                  fontFamily: 'Ubuntu',
                  fontSize: 18.8,
                  fontWeight: FontWeight.w700,
                  overflow: TextOverflow.ellipsis,
                  letterSpacing: 1.4);
            },
          ),
          elevation: MaterialStateProperty.resolveWith<double>(
            (Set<MaterialState> states) {
              return 4.0;
            },
          ),
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              return Colors.black45;
            },
          ),
          shape: MaterialStateProperty.resolveWith<OutlinedBorder>(
            (Set<MaterialState> states) {
              return RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
                side: const BorderSide(width: 1.0, style: BorderStyle.solid),
              );
            },
          ),
        ),
      ),
      textTheme: const TextTheme(
        headline6: TextStyle(
          overflow: TextOverflow.ellipsis,
            color: Colors.deepOrange,

          fontFamily: 'Varela Round',
            fontWeight: FontWeight.bold
        ),
        subtitle1: TextStyle(
            overflow: TextOverflow.ellipsis,
          color: Colors.lightGreen,
            fontFamily: 'Varela Round',
            fontWeight: FontWeight.bold
            ),
      ),
      iconTheme: const IconThemeData(size: 64)
    );
  }
}


