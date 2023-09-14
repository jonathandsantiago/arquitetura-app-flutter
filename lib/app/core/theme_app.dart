import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class ThemeApp {
  static ThemeApp of(BuildContext context) {
    return LightModeTheme();
  }

  late Color primary;
  late Color icon;
  late Color secondary;
  late Color tertiary;
  late Color alternate;
  late Color primaryText;
  late Color secondaryText;
  late Color primaryColorBtn;
  late Color primaryBackground;
  late Color secondaryBackground;
  late Color sucess;
  late Color warning;
  late Color error;
  late Color info;
  late Color ligth;
  late Color primaryBtnText;
  late Color secondaryBtnText;
  late Color lineColor;
  late Color logginApp;

  String get displayFamily => 'Poppins';

  TextStyle get titulo => TextStyle(
        fontFamily: displayFamily,
        color: primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 18,
      );

  TextStyle get tituloHeader => TextStyle(
        fontFamily: displayFamily,
        color: primary,
        fontWeight: FontWeight.w600,
        fontSize: 19,
      );

  TextStyle get subtituloHeader => TextStyle(
        fontFamily: displayFamily,
        color: primary,
        fontWeight: FontWeight.w500,
        fontSize: 12,
      );

  TextStyle get subtitulo => TextStyle(
        fontFamily: displayFamily,
        color: secondary,
        fontWeight: FontWeight.w500,
        fontSize: 14.0,
      );

  TextStyle get infoConteudo => TextStyle(
        fontFamily: displayFamily,
        color: secondary,
        fontWeight: FontWeight.w500,
        fontSize: 11.0,
      );

  TextStyle get tituloButton => TextStyle(
        color: primaryBtnText,
        fontSize: 18.0,
        fontWeight: FontWeight.w600,
      );

  TextStyle get descricao => TextStyle(
        fontFamily: displayFamily,
        color: secondary,
        fontWeight: FontWeight.normal,
        fontSize: 14.0,
      );

  TextStyle get descricaoBtn => TextStyle(
        fontFamily: displayFamily,
        color: secondaryBtnText,
        fontWeight: FontWeight.normal,
        fontSize: 14.0,
      );

  TextStyle get legenda => TextStyle(
        fontFamily: displayFamily,
        color: secondaryText,
        fontWeight: FontWeight.w500,
        fontSize: 11.0,
      );
}

class LightModeTheme extends ThemeApp {
  @override
  late Color primary = const Color(0xFFFFFFFF);
  @override
  late Color icon = const Color(0XFF0157C8);
  @override
  late Color secondary = const Color(0xFF000000);
  @override
  late Color tertiary = const Color(0xFFFF4D00);
  @override
  late Color alternate = const Color(0xFFFF5757);
  @override
  late Color primaryText = const Color(0xFF16129F);
  @override
  late Color primaryColorBtn = const Color(0xFF0157C8);
  @override
  late Color secondaryText = const Color(0xFFFFFFFF);
  @override
  late Color primaryBackground = const Color(0xFF00004B);
  @override
  late Color secondaryBackground = const Color(0xFFF4F6FF);
  @override
  late Color sucess = const Color(0xFF44A835);
  @override
  late Color warning = const Color(0xFFFCDC0C);
  @override
  late Color error = const Color(0xFFE21C3D);
  @override
  late Color info = const Color(0xFF1C4494);
  @override
  late Color ligth = const Color(0xFF00CADC);

  @override
  late Color primaryBtnText = const Color(0xFF00004B);
  @override
  late Color secondaryBtnText = const Color(0xFFFFFFFF);
  @override
  late Color lineColor = const Color(0xFF9E9E9E);

  @override
  late Color logginApp = const Color(0xFFF6A200);
}

extension TextStyleHelper on TextStyle {
  TextStyle override({
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    double? letterSpacing,
    FontStyle? fontStyle,
    bool useGoogleFonts = true,
    TextDecoration? decoration,
    double? lineHeight,
  }) =>
      useGoogleFonts
          ? GoogleFonts.getFont(
              'Poppins',
              color: color ?? this.color,
              fontSize: fontSize ?? this.fontSize,
              letterSpacing: letterSpacing ?? this.letterSpacing,
              fontWeight: fontWeight ?? this.fontWeight,
              fontStyle: fontStyle ?? this.fontStyle,
              decoration: decoration,
              height: lineHeight,
            )
          : copyWith(
              fontFamily: 'Poppins',
              color: color,
              fontSize: fontSize,
              letterSpacing: letterSpacing,
              fontWeight: fontWeight,
              fontStyle: fontStyle,
              decoration: decoration,
              height: lineHeight,
            );
}
