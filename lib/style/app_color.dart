import 'package:flutter/material.dart';

class MyColor {

  static const white = Colors.white;
  static const black = Colors.black;
  static const dartBackgroundColor = Color(0xFF242424);
  static const lightBackgroundColor = Color(0xFFF9F9F9);

  static const color_f7f7f7 = Color(0xFFf7f7f7);
  static const color_e5e5e5 = Color(0xFFe5e5e5);
  static const color_e8e8e8 = Color(0xFFe8e8e8);
  static const color_e1e1e1 = Color(0xFFe1e1e1);
  static const color_dedede = Color(0xFFdedede);
  static const color_cccccc = Color(0xFFcccccc);
  static const color_999999 = Color(0xFF999999);
  static const color_666666 = Color(0xFF666666);
  static const color_333333 = Color(0xFF333333);
  static const color_1a1a1a = Color(0xFF1a1a1a);
  static const color_808080 = Color(0xFF808080);
  static const color_4b4b4b = Color(0xFF4b4b4b);
  static const color_6f6f6f = Color(0xFF6f6f6f);
  static const color_b6b6b6 = Color(0xFFb6b6b6);

  static const color_eeeeee = Color(0xFFEEEEEE);
  static const color_2b364d = Color(0xFF2B364D);
  static const color_f1f1f1 = Color(0xFFF1F1F1);
  static const color_151b26 = Color(0xFF151B26);
  static const color_e7e9ea = Color(0xFFE7E9EA);
  static const color_abb0b7 = Color(0xFFABB0B7);
  static const color_7c848d = Color(0xFF7C848D);

  static const color_5d5d5d = Color(0xFF5D5D5D);
  static const color_edf2fa = Color(0xFFEDF2FA);
  static const color_868686 = Color(0xFF868686);
  static const color_a2acbf = Color(0xFFA2ACBF);
  static const color_c6c6c6 = Color(0xFFC6C6C6);
  static const color_424e66 = Color(0xFF424E66);
  static const color_e8f3f0 = Color(0xFFE8F3F0);

  /// 背景颜色
  static Color backColor(BuildContext context){
    return _isNight(context) ? dartBackgroundColor : white;
  }

  /// 图标的颜色
  static Color iconColor(BuildContext context){
    return _isNight(context) ? white : black;
  }

  /// 分割线颜色
  static Color lineColor(BuildContext context){
    return _isNight(context) ? color_2b364d : color_eeeeee;
  }

  /// 黑色字体颜色
  static Color blackColor(BuildContext context) {
    return _isNight(context) ? color_edf2fa : color_5d5d5d;
  }

  /// 中浅色字体颜色
  static Color grayColor(BuildContext context) {
    return _isNight(context) ? color_a2acbf : color_868686;
  }

  /// 浅色字体颜色
  static Color lightGray(BuildContext context) {
    return _isNight(context) ? color_424e66 : color_c6c6c6;
  }

  /// 333333
  static Color font33(BuildContext context) {
    return _isNight(context) ? color_e7e9ea : color_333333;
  }

  /// 666666
  static Color font66(BuildContext context) {
    return _isNight(context) ? color_abb0b7 : color_666666;
  }

  /// 999999
  static Color font99(BuildContext context) {
    return _isNight(context) ? color_7c848d : color_999999;
  }

  /// 是否是暗夜模式
  static bool _isNight(BuildContext context){
    return Theme.of(context).brightness == Brightness.dark;
  }

  /// 主色
  static const MaterialColor mainColor =
      MaterialColor(_mainPrimaryValue, <int, Color>{
    50: Color(_mainPrimaryValue),
    100: Color(_mainPrimaryValue),
    200: Color(_mainPrimaryValue),
    300: Color(_mainPrimaryValue),
    400: Color(_mainPrimaryValue),
    500: Color(_mainPrimaryValue),
    600: Color(_mainPrimaryValue),
    700: Color(_mainPrimaryValue),
    800: Color(_mainPrimaryValue),
    900: Color(_mainPrimaryValue),
  });

  static const int _mainPrimaryValue = 0xFF165DFF;

  /// 亮色主题颜色
  static lightColorScheme(Brightness b) => ColorScheme(
    brightness: b,
    primary: const Color(0xFF006A66),
    onPrimary: const Color(0xFFFFFFFF),
    primaryContainer: const Color(0xFF5FF9F1),
    onPrimaryContainer: const Color(0xFF00201E),
    secondary: const Color(0xFF4A6361),
    onSecondary: const Color(0xFFFFFFFF),
    secondaryContainer: const Color(0xFFCCE8E5),
    onSecondaryContainer: const Color(0xFF051F1E),
    tertiary: const Color(0xFF49607B),
    onTertiary: const Color(0xFFFFFFFF),
    tertiaryContainer: const Color(0xFFD0E4FF),
    onTertiaryContainer: const Color(0xFF011D34),
    error: const Color(0xFFBA1A1A),
    errorContainer: const Color(0xFFFFDAD6),
    onError: const Color(0xFFFFFFFF),
    onErrorContainer: const Color(0xFF410002),
    background: const Color(0xFFFAFDFB),
    onBackground: const Color(0xFF191C1C),
    surface: const Color(0xFFFAFDFB),
    onSurface: const Color(0xFF191C1C),
    surfaceVariant: const Color(0xFFDAE5E3),
    onSurfaceVariant: const Color(0xFF3F4948),
    outline: const Color(0xFF6F7978),
    onInverseSurface: const Color(0xFFEFF1F0),
    inverseSurface: const Color(0xFF2D3131),
    inversePrimary: const Color(0xFF37DCD5),
    shadow: const Color(0xFF000000),
    surfaceTint: const Color(0xFF006A66),
    //outlineVariant: Color(0xFFBEC9C7),
    //scrim: Color(0xFF000000),
  );

  /// 暗色主题颜色
  static darkColorScheme(Brightness b) => ColorScheme(
    brightness: b,
    primary: const Color(0xFF37DCD5),
    onPrimary: const Color(0xFF003735),
    primaryContainer: const Color(0xFF00504D),
    onPrimaryContainer: const Color(0xFF5FF9F1),
    secondary: const Color(0xFFB0CCC9),
    onSecondary: const Color(0xFF1B3533),
    secondaryContainer: const Color(0xFF324B49),
    onSecondaryContainer: const Color(0xFFCCE8E5),
    tertiary: const Color(0xFFB0C9E7),
    onTertiary: const Color(0xFF19324A),
    tertiaryContainer: const Color(0xFF314962),
    onTertiaryContainer: const Color(0xFFD0E4FF),
    error: const Color(0xFFFFB4AB),
    errorContainer: const Color(0xFF93000A),
    onError: const Color(0xFF690005),
    onErrorContainer: const Color(0xFFFFDAD6),
    background: const Color(0xFF191C1C),
    onBackground: const Color(0xFFE0E3E2),
    surface: const Color(0xFF191C1C),
    onSurface: const Color(0xFFE0E3E2),
    surfaceVariant: const Color(0xFF3F4948),
    onSurfaceVariant: const Color(0xFFBEC9C7),
    outline: const Color(0xFF889391),
    onInverseSurface: const Color(0xFF191C1C),
    inverseSurface: const Color(0xFFE0E3E2),
    inversePrimary: const Color(0xFF006A66),
    shadow: const Color(0xFF000000),
    surfaceTint: const Color(0xFF37DCD5),
    //outlineVariant: Color(0xFF3F4948),
    //scrim: Color(0xFF000000),
  );
}
