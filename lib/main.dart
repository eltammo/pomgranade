import 'package:flutter/material.dart';
import 'package:ppg/models/constants.dart';
import 'package:ppg/screens/home/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Project PG',
      theme: _kMyAppTheme,
      home: HomeScreen(),
    );
  }
}

final ThemeData _kMyAppTheme = _buildMyAppTheme();

ThemeData _buildMyAppTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    accentColor: kSecondaryDark,
    primaryColor: kPrimaryLight,
    buttonTheme: base.buttonTheme.copyWith(
      buttonColor: kPrimaryLight,
      colorScheme: base.colorScheme.copyWith(
        secondary: kSecondaryLight,
      ),
    ),
    buttonBarTheme: base.buttonBarTheme.copyWith(
      buttonTextTheme: ButtonTextTheme.accent,
    ),
    scaffoldBackgroundColor: kBackgroundWhite,
    cardColor: kBackgroundWhite,
    textSelectionTheme: TextSelectionThemeData(
      selectionColor: kPrimary
    ),
    errorColor: kErrorRed,
  );
}

// TextTheme _buildMyAppTextTheme(TextTheme base) {
//   return base.copyWith(
//     headline5: base.headline5!.copyWith(
//       fontWeight: FontWeight.w500,
//     ),
//     headline6: base.headline6!.copyWith(
//       fontSize: 18.0,
//     ),
//     caption: base.caption!.copyWith(
//       fontWeight: FontWeight.w400,
//       fontSize: 14.0,
//     ),
//     bodyText1: base.bodyText1!.copyWith(
//       fontWeight: FontWeight.w500,
//       fontSize: 16.0,
//     ),
//   ).apply(
//     fontFamily: 'Roboto',
//     displayColor: kOnSurface,
//     bodyColor: kOnSurface,
//   );
// }