import 'package:flutter/material.dart';

import '../../../gen/fonts.gen.dart';

class TextStyles {
  static TextStyle get h1 => const TextStyle(
        fontFamily: FontFamily.norse,
        fontSize: 45,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      );
  static TextStyle get subtitle => TextStyle(
        fontFamily: FontFamily.norse,
        fontSize: 20,
        color: Colors.grey.shade900,
      );
  static TextStyle get bodyBlackM => const TextStyle(
        fontFamily: FontFamily.norse,
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      );
  static TextStyle get bodyBlueGreyM => const TextStyle(
        fontFamily: FontFamily.norse,
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.blueGrey,
      );

  static TextStyle get bodyGreyMLineThrough => const TextStyle(
        fontFamily: FontFamily.norse,
        fontSize: 20,
        fontWeight: FontWeight.bold,
        decoration: TextDecoration.lineThrough,
        color: Colors.grey,
      );

  static TextStyle get twitter => const TextStyle(
        fontFamily: FontFamily.norse,
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Colors.blueAccent,
      );
  static TextStyle get github => const TextStyle(
        fontFamily: FontFamily.norse,
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Colors.purple,
      );
  static TextStyle get body => const TextStyle(
        fontFamily: FontFamily.norse,
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      );
  static TextStyle get bodyGrey => const TextStyle(
        fontFamily: FontFamily.norse,
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Colors.grey,
      );

  static TextStyle get bodyPurple => const TextStyle(
        fontFamily: FontFamily.norse,
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Colors.purple,
      );

  static TextStyle get bodyGreyS => TextStyle(
        fontFamily: FontFamily.norse,
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.blueGrey.shade900,
      );
  static TextStyle get bodyWhiteS => const TextStyle(
        fontFamily: FontFamily.norse,
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      );
  static TextStyle get bodyWhiteXS => const TextStyle(
        fontFamily: FontFamily.norse,
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      );
}
