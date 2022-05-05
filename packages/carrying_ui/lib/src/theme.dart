import 'package:flutter/material.dart';
import 'package:carrying_ui/carrying_ui.dart';

const _smallTextScaleFactor = 0.80;

/// Namespace for the Photobooth [ThemeData].
class CarryingTheme {
  /// Standard `ThemeData` for Photobooth UI.
  static ThemeData get standard {
    return ThemeData(
      colorScheme: ColorScheme.fromSwatch(accentColor: CarryingColors.blue),
      appBarTheme: _appBarTheme,
      elevatedButtonTheme: _elevatedButtonTheme,
      outlinedButtonTheme: _outlinedButtonTheme,
      textTheme: _textTheme,
      dialogBackgroundColor: CarryingColors.whiteBackground,
      dialogTheme: _dialogTheme,
      tooltipTheme: _tooltipTheme,
      bottomSheetTheme: _bottomSheetTheme,
      tabBarTheme: _tabBarTheme,
      dividerTheme: _dividerTheme,
      iconTheme: _iconTheme,
      scaffoldBackgroundColor: CarryingColors.cream,
    );
  }

  /// `ThemeData` for Photobooth UI for small screens.
  static ThemeData get small {
    return standard.copyWith(textTheme: _smallTextTheme);
  }

  /// `ThemeData` for Photobooth UI for medium screens.
  static ThemeData get medium {
    return standard.copyWith(textTheme: _smallTextTheme);
  }

  static TextTheme get _textTheme {
    return TextTheme(
      headline1: PhotoboothTextStyle.headline1,
      headline2: PhotoboothTextStyle.headline2,
      headline3: PhotoboothTextStyle.headline3,
      headline4: PhotoboothTextStyle.headline4,
      headline5: PhotoboothTextStyle.headline5,
      headline6: PhotoboothTextStyle.headline6,
      subtitle1: PhotoboothTextStyle.subtitle1,
      subtitle2: PhotoboothTextStyle.subtitle2,
      bodyText1: PhotoboothTextStyle.bodyText1,
      bodyText2: PhotoboothTextStyle.bodyText2,
      caption: PhotoboothTextStyle.caption,
      overline: PhotoboothTextStyle.overline,
      button: PhotoboothTextStyle.button,
    );
  }

  static TextTheme get _smallTextTheme {
    return TextTheme(
      headline1: PhotoboothTextStyle.headline1.copyWith(
        fontSize: _textTheme.headline1!.fontSize! * _smallTextScaleFactor,
      ),
      headline2: PhotoboothTextStyle.headline2.copyWith(
        fontSize: _textTheme.headline2!.fontSize! * _smallTextScaleFactor,
      ),
      headline3: PhotoboothTextStyle.headline3.copyWith(
        fontSize: _textTheme.headline3!.fontSize! * _smallTextScaleFactor,
      ),
      headline4: PhotoboothTextStyle.headline4.copyWith(
        fontSize: _textTheme.headline4!.fontSize! * _smallTextScaleFactor,
      ),
      headline5: PhotoboothTextStyle.headline5.copyWith(
        fontSize: _textTheme.headline5!.fontSize! * _smallTextScaleFactor,
      ),
      headline6: PhotoboothTextStyle.headline6.copyWith(
        fontSize: _textTheme.headline6!.fontSize! * _smallTextScaleFactor,
      ),
      subtitle1: PhotoboothTextStyle.subtitle1.copyWith(
        fontSize: _textTheme.subtitle1!.fontSize! * _smallTextScaleFactor,
      ),
      subtitle2: PhotoboothTextStyle.subtitle2.copyWith(
        fontSize: _textTheme.subtitle2!.fontSize! * _smallTextScaleFactor,
      ),
      bodyText1: PhotoboothTextStyle.bodyText1.copyWith(
        fontSize: _textTheme.bodyText1!.fontSize! * _smallTextScaleFactor,
      ),
      bodyText2: PhotoboothTextStyle.bodyText2.copyWith(
        fontSize: _textTheme.bodyText2!.fontSize! * _smallTextScaleFactor,
      ),
      caption: PhotoboothTextStyle.caption.copyWith(
        fontSize: _textTheme.caption!.fontSize! * _smallTextScaleFactor,
      ),
      overline: PhotoboothTextStyle.overline.copyWith(
        fontSize: _textTheme.overline!.fontSize! * _smallTextScaleFactor,
      ),
      button: PhotoboothTextStyle.button.copyWith(
        fontSize: _textTheme.button!.fontSize! * _smallTextScaleFactor,
      ),
    );
  }

  static IconThemeData get _iconTheme {
    return const IconThemeData(color: CarryingColors.black);
  }

  static AppBarTheme get _appBarTheme {
    return const AppBarTheme(
      color: CarryingColors.black,
      iconTheme: IconThemeData(color: CarryingColors.black),
    );
  }

  static ElevatedButtonThemeData get _elevatedButtonTheme {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
        padding: const EdgeInsets.symmetric(vertical: 16),
        primary: CarryingColors.pink,
        minimumSize: const Size(208, 54),
      ),
    );
  }

  static OutlinedButtonThemeData get _outlinedButtonTheme {
    return OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
        side: const BorderSide(color: CarryingColors.white, width: 2),
        padding: const EdgeInsets.symmetric(vertical: 16),
        primary: CarryingColors.white,
        minimumSize: const Size(208, 54),
      ),
    );
  }

  static TooltipThemeData get _tooltipTheme {
    return const TooltipThemeData(
      decoration: BoxDecoration(
        color: CarryingColors.charcoal,
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      padding: EdgeInsets.all(10),
      textStyle: TextStyle(color: CarryingColors.white),
    );
  }

  static DialogTheme get _dialogTheme {
    return DialogTheme(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  static BottomSheetThemeData get _bottomSheetTheme {
    return const BottomSheetThemeData(
      backgroundColor: CarryingColors.whiteBackground,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
      ),
    );
  }

  static TabBarTheme get _tabBarTheme {
    return const TabBarTheme(
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(
          width: 2.0,
          color: CarryingColors.blue,
        ),
      ),
      labelColor: CarryingColors.blue,
      unselectedLabelColor: CarryingColors.black25,
      indicatorSize: TabBarIndicatorSize.tab,
    );
  }

  static DividerThemeData get _dividerTheme {
    return const DividerThemeData(
      space: 0,
      thickness: 0.5,
      color: CarryingColors.cream,
    );
  }
}
