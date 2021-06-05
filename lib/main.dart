import 'dart:ui';

import 'package:flutter/material.dart';

import 'ui/home.dart';

/*void main() {
   runApp(ScaffoldExemple());
  runApp(
}*/
final ThemeData _appTheme=_buildAppTheme();

ThemeData _buildAppTheme() {
  final ThemeData base=ThemeData.dark();
  return base.copyWith(
    brightness: Brightness.dark,
    accentColor: Colors.pinkAccent,
    primaryColor: Colors.pinkAccent.shade200,
    scaffoldBackgroundColor: Colors.pinkAccent.shade100,
    backgroundColor: Colors.pinkAccent,
    //buttonColor: Colors.pink,
    textTheme:_appTextTheme(base.textTheme),

  );
}
TextTheme _appTextTheme(TextTheme base){

return base.copyWith(
  headline1: base.headline1.copyWith(
    fontWeight: FontWeight.w500,
  ),
  headline5: base.headline5.copyWith(
    fontSize: 18.0,
    color: Colors.red,
  ),
  caption: base.caption.copyWith(
    fontWeight: FontWeight.w400,
    fontSize: 14.0
  ),
  bodyText2: base.bodyText2.copyWith(
    fontSize: 16.9,
   // fontFamily: "Blazed",
    color: Colors.red,
  ),
  button: base.button.copyWith(
    //backgroundColor: Colors.redAccent,
  )
);
}

void main()=>runApp(new MaterialApp(
  theme: _appTheme,
  // theme: ThemeData(
  //   brightness: Brightness.dark,
  //   primaryColor: Colors.deepOrange.shade300,
  //   textTheme: TextTheme(
  //   headline1: TextStyle(
  //     fontSize: 34,
  //     fontWeight: FontWeight.bold,
  //   ),
  //   bodyText2: TextStyle(
  //     fontSize: 16.9,
  //     color: Colors.redAccent,
  //   ),
  //   ),
  // ),
  home: QuizApp(),
));