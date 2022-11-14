import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final currentAppTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    elevatedButtonTheme: elevatedButton,
    inputDecorationTheme: inputDecoration,
    sliderTheme: sliderTheme,
    appBarTheme: appBar);

final sliderTheme = SliderThemeData(
  thumbColor: AppTheme.displayColor,
  inactiveTrackColor: AppTheme.displayColor.withOpacity(0.8),
  activeTrackColor: AppTheme.displayColor.withOpacity(0.9),
  overlayColor: AppTheme.displayColor.withOpacity(0.6),
  thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 10.0),
  overlayShape: const RoundSliderOverlayShape(overlayRadius: 20.0),
);

final inputDecoration = InputDecorationTheme(
    iconColor: AppTheme.primaryColor,
    labelStyle: AppTheme.textFieldText(),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(width: 1, color: Colors.grey.withOpacity(0.4)),
      borderRadius: const BorderRadius.all(Radius.circular(20)),
    ),
    focusColor: AppTheme.primaryColor);
final appBar = AppBarTheme(
    elevation: 0,
    iconTheme: IconThemeData(color: AppTheme.primaryColor),
    titleTextStyle: AppTheme.titleText(fontSize: 18),
    backgroundColor: Colors.white);
final elevatedButton = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
  backgroundColor: AppTheme.primaryColor,
  textStyle: AppTheme.buttonTextBold(fontSize: 14),
));

class TextTheme {
  static TextStyle displayFont({
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    double? letterSpacing,
    double? wordSpacing,
    double? height,
  }) =>
      GoogleFonts.poppins(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontStyle: fontStyle,
        letterSpacing: letterSpacing,
        wordSpacing: wordSpacing,
        height: height,
      );
}

class AppTheme extends TextTheme {
  static Color get displayColor => HexColor.fromHex('#E29547');
  static Color get primaryColor => HexColor.fromHex('#3a7068');

  //SECTION text config
  static TextStyle displayText({double? fontSize, FontWeight? weight}) =>
      TextTheme.displayFont(
          fontSize: fontSize,
          color: HexColor.fromHex('#E29547'),
          fontWeight: weight ?? FontWeight.w400);

  static TextStyle displayTextBold({double? fontSize}) => TextTheme.displayFont(
      fontSize: fontSize,
      color: HexColor.fromHex('#E29547'),
      fontWeight: FontWeight.w600);

  static TextStyle buttonTextBold({double? fontSize}) => TextTheme.displayFont(
      fontSize: fontSize ?? 16,
      color: HexColor.fromHex('#F2F0E0'),
      fontWeight: FontWeight.w600);

  static TextStyle titleText({double? fontSize}) => TextTheme.displayFont(
      fontSize: fontSize,
      color: HexColor.fromHex('#3a7068'),
      fontWeight: FontWeight.w700);

  static TextStyle textFieldText({double? fontSize}) => TextTheme.displayFont(
      fontSize: fontSize,
      color: HexColor.fromHex('#000000'),
      fontWeight: FontWeight.w300);

  static TextStyle labelText({double? fontSize, FontWeight? weight}) =>
      TextTheme.displayFont(
          fontSize: fontSize,
          color: HexColor.fromHex('#000000'),
          fontWeight: weight ?? FontWeight.w300);

  static TextStyle labelTextGrey({double? fontSize, FontWeight? weight}) =>
      TextTheme.displayFont(
          fontSize: fontSize,
          color: HexColor.fromHex('#aaaaaa'),
          fontWeight: weight ?? FontWeight.w300);

  static TextStyle drawerText({double? fontSize}) => TextTheme.displayFont(
      fontSize: fontSize,
      color: HexColor.fromHex('#F2F0E0'),
      fontWeight: FontWeight.w300);

  static TextStyle productCardText({double? fontSize}) => TextTheme.displayFont(
      fontSize: fontSize,
      color: HexColor.fromHex('#AAAAAA'),
      fontWeight: FontWeight.w400);

  static TextStyle deliveryCardText({double? fontSize, FontWeight? weight}) =>
      TextTheme.displayFont(
          fontSize: fontSize,
          color: HexColor.fromHex('#F2F0E0'),
          fontWeight: weight ?? FontWeight.w400);
  //!SECTION
}

extension HexColor on Color {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}
