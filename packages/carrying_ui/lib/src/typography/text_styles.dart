import 'package:flutter/widgets.dart';
import 'package:carrying_ui/carrying_ui.dart';

import 'font_weights.dart';

class PhotoboothTextStyle {
  static const _baseTextStyle = TextStyle(
    package: 'photobooth_ui',
    fontFamily: 'GoogleSans',
    color: CarryingColors.black,
    fontWeight: CarryingFontWeight.regular,
  );

  static TextStyle get headline1 {
    return _baseTextStyle.copyWith(
      fontSize: 56,
      fontWeight: CarryingFontWeight.medium,
    );
  }

  static TextStyle get headline2 {
    return _baseTextStyle.copyWith(
      fontSize: 30,
      fontWeight: CarryingFontWeight.regular,
    );
  }

  static TextStyle get headline3 {
    return _baseTextStyle.copyWith(
      fontSize: 24,
      fontWeight: CarryingFontWeight.regular,
    );
  }

  static TextStyle get headline4 {
    return _baseTextStyle.copyWith(
      fontSize: 22,
      fontWeight: CarryingFontWeight.bold,
    );
  }

  static TextStyle get headline5 {
    return _baseTextStyle.copyWith(
      fontSize: 22,
      fontWeight: CarryingFontWeight.medium,
    );
  }

  static TextStyle get headline6 {
    return _baseTextStyle.copyWith(
      fontSize: 22,
      fontWeight: CarryingFontWeight.bold,
    );
  }

  static TextStyle get subtitle1 {
    return _baseTextStyle.copyWith(
      fontSize: 16,
      fontWeight: CarryingFontWeight.bold,
    );
  }

  static TextStyle get subtitle2 {
    return _baseTextStyle.copyWith(
      fontSize: 14,
      fontWeight: CarryingFontWeight.bold,
    );
  }

  static TextStyle get bodyText1 {
    return _baseTextStyle.copyWith(
      fontSize: 18,
      fontWeight: CarryingFontWeight.medium,
    );
  }

  static TextStyle get bodyText2 {
    return _baseTextStyle.copyWith(
      fontSize: 16,
      fontWeight: CarryingFontWeight.regular,
    );
  }

  static TextStyle get caption {
    return _baseTextStyle.copyWith(
      fontSize: 14,
      fontWeight: CarryingFontWeight.light,
    );
  }

  static TextStyle get overline {
    return _baseTextStyle.copyWith(
      fontSize: 16,
      fontWeight: CarryingFontWeight.regular,
    );
  }

  static TextStyle get button {
    return _baseTextStyle.copyWith(
      fontSize: 18,
      fontWeight: CarryingFontWeight.medium,
    );
  }
}
