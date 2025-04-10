import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magic_view/property/font/font.dart';
import 'package:magic_view/style/MagicTextFieldBorder.dart';
import 'package:magic_view/style/MagicTextStyle.dart';

class MagicFactory {
  static initMagicFactory({
    /// [REQUIRED] Mengatur warna utama
    required Color colorBrand,

    /// [REQUIRED] Mengatur warna sekunder
    required Color colorBrand2,

    /// Mengatur warna border, digunakan untuk warna border di MagicButton
    Color? colorStroke,

    /// Mengatur warna teks untuk MagicText
    Color? colorText,

    /// Mengatur warna disable, seperti digunakan untuk MagicButton disable
    Color? colorDisable,

    /// Mengatur warna error
    Color? colorError,

    /// Mengatur Font
    FontFamily? fontFamily,

    /// Mengatur nama font yang ada di google
    String? fontName,

    /// Mengatur style default untuk MagicText
    MagicTextStyle? magicTextStyle,

    /// Mengatur border untuk MagicTextField
    MagicTextFieldBorder? magicTextFieldBorder,

    /// Mengatur radius untuk MagicButton atau MagicTextField
    double? buttonBorderRadius,

    /// Mengatur penggunaan ScreenUtil. Jika bernilai true maka fontSize akan dikonversi ke .sp
    bool useScreenUtil = false,

    /// Mengatur batas. width < limit = Small dan width > limit = Medium
    double? limitSmallMediumScreen,

    /// Mengatur batas. width < limit = Medium dan width > limit = Large
    double? limitMediumLargeScreen,

    /// Mengatur icon Success dialog ketika EnumIconDialogType.success
    Widget? iconSuccess,

    /// Mengatur icon Success dialog ketika EnumIconDialogType.failed
    Widget? iconFailed,

    /// Mengatur icon Success dialog ketika EnumIconDialogType.warning
    Widget? iconWarning,
  }) {
    MagicFactory.colorBrand = colorBrand;
    MagicFactory.colorBrand2 = colorBrand2;
    if (colorStroke != null) MagicFactory.colorStroke = colorStroke;
    if (colorText != null) MagicFactory.colorText = colorText;
    if (colorDisable != null) MagicFactory.colorDisable = colorDisable;
    if (colorError != null) MagicFactory.colorError = colorError;
    if (fontFamily != null) MagicFactory.fontFamily = fontFamily;
    if (fontName != null) MagicFactory.fontName = fontName;
    if (magicTextStyle != null) MagicFactory.magicTextStyle = magicTextStyle;
    if (magicTextFieldBorder != null) {
      MagicFactory.border = magicTextFieldBorder;
    }
    if (buttonBorderRadius != null) {
      MagicFactory.buttonRadius = buttonBorderRadius;
    }
    MagicFactory.useScreenUtil = useScreenUtil;
    if (limitSmallMediumScreen != null) {
      MagicFactory.limitSmallMediumScreen = limitSmallMediumScreen;
    }
    if (limitMediumLargeScreen != null) {
      MagicFactory.limitMediumLargeScreen = limitMediumLargeScreen;
    }
    if (iconSuccess != null) MagicFactory.iconSuccess = iconSuccess;
    if (iconFailed != null) MagicFactory.iconFailed = iconFailed;
    if (iconWarning != null) MagicFactory.iconWarning = iconWarning;
  }

  /// Mengatur warna
  static Color colorBrand = Color(0xFF4086EF);
  static Color colorBrand2 = Color(0xFFFFFFFF);
  static Color colorStroke = colorBrand;
  static Color colorText = Color(0xFF2F2F2F);
  static Color colorDisable = Color(0xFFA9A9A9);
  static Color colorError = Color(0xFFFF0000);

  static bool useScreenUtil = false;

  /// Mengatur font yang akan digunakan
  static FontFamily fontFamily = FontFamily.jakartaSans;
  static String fontFamilyCustom = "";

  /// Mengatur nama font yang ada di google
  static String? fontName;

  /// Mengatur gaya teks [default]
  static MagicTextStyle magicTextStyle = MagicTextStyle(
    maxLines: null,
    minLines: 1,
    textAlign: null,
    textOverflow: null,
    fontFamily: fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: colorText,
    fontStyle: FontStyle.normal,
  );

  /// Mengatur radius tombol [default]
  static double buttonRadius = 20;

  /// Mengatur border textfield [default]
  static MagicTextFieldBorder border = MagicTextFieldBorder(
    border: MagicTextFieldBorderProperty(
        type: MagicTextFieldBorderType.OUTLINE,
        sideColor: colorBrand,
        sideWidth: 1,
        radiusAll: buttonRadius),
    enableBorder: MagicTextFieldBorderProperty(
        type: MagicTextFieldBorderType.OUTLINE,
        sideColor: colorBrand,
        sideWidth: 1,
        radiusAll: buttonRadius),
    disableBorder: MagicTextFieldBorderProperty(
        type: MagicTextFieldBorderType.OUTLINE,
        sideColor: colorDisable,
        sideWidth: 1,
        radiusAll: buttonRadius),
    focusedBorder: MagicTextFieldBorderProperty(
        type: MagicTextFieldBorderType.OUTLINE,
        sideColor: colorBrand,
        sideWidth: 1,
        radiusAll: buttonRadius),
    errorBorder: MagicTextFieldBorderProperty(
        type: MagicTextFieldBorderType.OUTLINE,
        sideColor: colorError,
        sideWidth: 1,
        radiusAll: buttonRadius),
    focusedErrorBorder: MagicTextFieldBorderProperty(
        type: MagicTextFieldBorderType.OUTLINE,
        sideColor: colorError,
        sideWidth: 2,
        radiusAll: buttonRadius),
  );

  /// Layout Builder
  static double limitSmallMediumScreen = 800;
  static double limitMediumLargeScreen = 1200;

  /// Dialog
  static Widget iconSuccess = Image.asset(
    "assets/checked.png",
    width: 48,
    height: 48,
    package: 'magic_view',
  );
  static Widget iconFailed = Image.asset(
    "assets/cancel.png",
    width: 48,
    height: 48,
    package: 'magic_view',
  );
  static Widget iconWarning = Image.asset(
    "assets/warning.png",
    width: 48,
    height: 48,
    package: 'magic_view',
  );

  static initScreen(BuildContext context) {
    ScreenUtil.init(context, designSize: MediaQuery.of(context).size);
  }
}
