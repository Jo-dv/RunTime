import 'package:flutter/material.dart';
import 'package:front_android/theme/foundation/app_theme.dart';
import 'package:front_android/theme/res/typo.dart';

class BasicTheme implements AppTheme {
  @override
  ThemeName themeName = ThemeName.normal;

  @override
  AppColor color = const AppColor(
    accept: Color(0xFF4c51bf),
    deny: Color(0xFFc53030),
    inactive: Color(0xFFa9a9a9),
    neutral: Color(0xFF38a169),
    onAccept: Color(0xFFf8f8f8),
    onDeny: Color(0xFFf8f8f8),
    onInactive: Color(0xFFf8f8f8),
    onNeutral: Color(0xFFf8f8f8),
    trace: Color(0xFF48bb78),
    traceBackground: Color(0xFFd9d9d9),
    battleBox: Color(0xFF2D3748),
    onBattleBox: Color(0xFFf8f8f8),
    userMode: Color(0xFF7f9cf5),
    practiceMode: Color(0xFFed8936),
    rankingButton: Color(0xFFfc8181),
    battleMode1: Color(0xFF1a202c),
    battleMode2: Color(0xFF4a5568),
    list1Main: Color(0xFF5334b2),
    list2Main: Color(0xFF344db6),
    list3Main: Color(0xFF2f855a),
    list4Main: Color(0xFFb83280),
    list5Main: Color(0xFFc53030),
    list1Sub: Color(0xFF9468f8),
    list2Sub: Color(0xFF688cfd),
    list3Sub: Color(0xFF68d391),
    list4Sub: Color(0xFFf687b3),
    list5Sub: Color(0xFFfc8181),
    battleBackground1: Color(0xFF000000),
    battleBackground2: Color(0xFF2C363F),
    onBackground: Color(0xFFf8f8f8),
    userModeBackground: Color(0x9F1A202C),
    achievementLevel: Color(0xFFecc94b),
    counterAchievementLevel: Color(0xFFf8f8f8),
    surface: Color(0xFFf8f8f8),
    text: Colors.black,
    lightText: Color(0xFFCFCFCF),
  );

  @override
  late AppTypo typo = AppTypo(
    typo: const Pretendard(),
    fontColor: color.text,
  );

  @override
  Palette palette = const Palette(
    blue100: Color(0xFFEBF8FF),
    blue200: Color(0xFFBEE3F8),
    blue300: Color(0xFF90CDF4),
    blue400: Color(0xFF63B3ED),
    blue500: Color(0xFF4299E1),
    blue600: Color(0xFF3182CE),
    blue700: Color(0xFF2B6CB0),
    blue800: Color(0xFF2C5282),
    blue900: Color(0xFF2A4365),
    gray100: Color(0xFFF7FAFC),
    gray200: Color(0xFFEDF2F7),
    gray300: Color(0xFFE2E8F0),
    gray400: Color(0xFFCBD5E0),
    gray500: Color(0xFFA0AEC0),
    gray600: Color(0xFF718096),
    gray700: Color(0xFF4A5568),
    gray800: Color(0xFF2D3748),
    gray900: Color(0xFF1A202C),
    green100: Color(0xFFF0FFF4),
    green200: Color(0xFFC6F6D5),
    green300: Color(0xFF9AE6B4),
    green400: Color(0xFF68D391),
    green500: Color(0xFF48BB78),
    green600: Color(0xFF38A169),
    green700: Color(0xFF2F855A),
    green800: Color(0xFF276749),
    green900: Color(0xFF22543D),
    indigo100: Color(0xFFEBF4FF),
    indigo200: Color(0xFFC3DAFE),
    indigo300: Color(0xFFA3BFFA),
    indigo400: Color(0xFF7F9CF5),
    indigo500: Color(0xFF667EEA),
    indigo600: Color(0xFF5A67D8),
    indigo700: Color(0xFF4C51BF),
    indigo800: Color(0xFF434190),
    indigo900: Color(0xFF3C366B),
    orange100: Color(0xFFFFFAF0),
    orange200: Color(0xFFFEEBC8),
    orange300: Color(0xFFFBD38D),
    orange400: Color(0xFFF6AD55),
    orange500: Color(0xFFED8936),
    orange600: Color(0xFFDD6B20),
    orange700: Color(0xFFC05621),
    orange800: Color(0xFF9C4221),
    orange900: Color(0xFF7B341E),
    pink100: Color(0xFFFED7E2),
    pink200: Color(0xFFFED7E2),
    pink300: Color(0xFFFBB6CE),
    pink400: Color(0xFFF687B3),
    pink500: Color(0xFFED64A6),
    pink600: Color(0xFFD53F8C),
    pink700: Color(0xFFB83280),
    pink800: Color(0xFF97266D),
    pink900: Color(0xFF702459),
    purple100: Color(0xFFFAF5FF),
    purple200: Color(0xFFE9D8FD),
    purple300: Color(0xFFD6BCFA),
    purple400: Color(0xFFB794F4),
    purple500: Color(0xFF9F7AEA),
    purple600: Color(0xFF805AD5),
    purple700: Color(0xFF6B46C1),
    purple800: Color(0xFF553C9A),
    purple900: Color(0xFF44337A),
    red100: Color(0xFFFFF5F5),
    red200: Color(0xFFFED7D7),
    red300: Color(0xFFFEB2B2),
    red400: Color(0xFFFC8181),
    red500: Color(0xFFF56565),
    red600: Color(0xFFE53E3E),
    red700: Color(0xFFC53030),
    red800: Color(0xFF9B2C2C),
    red900: Color(0xFF742A2A),
    teal100: Color(0xFFE6FFFA),
    teal200: Color(0xFFB2F5EA),
    teal300: Color(0xFF81E6D9),
    teal400: Color(0xFF4FD1C5),
    teal500: Color(0xFF38B2AC),
    teal600: Color(0xFF319795),
    teal700: Color(0xFF2C7A7B),
    teal800: Color(0xFF285E61),
    teal900: Color(0xFF234E52),
    yellow100: Color(0xFFFFFFF0),
    yellow200: Color(0xFFFEFCBF),
    yellow300: Color(0xFFFAF089),
    yellow400: Color(0xFFF6E05E),
    yellow500: Color(0xFFECC94B),
    yellow600: Color(0xFFD69E2E),
    yellow700: Color(0xFFB7791F),
    yellow800: Color(0xFF975A16),
    yellow900: Color(0xFF744210),
  );
}
