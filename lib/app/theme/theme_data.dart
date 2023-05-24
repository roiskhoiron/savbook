import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utility/shared/constants/colors.dart';
import '../../utility/shared/constants/common.dart';

class ThemeConfig {
  static ThemeData createTheme({
    required Brightness brightness,
    required Color background,
    required Color primaryText,
    required Color indicatorTab,
    required Color selectedTextTab,
    required Color unselectedTextTab,
    Color? secondaryText,
    required Color accentColor,
    Color? divider,
    Color? shadowColor,
    Color? buttonBackground,
    required Color buttonText,
    Color? cardBackground,
    Color? disabled,
    required Color error,
  }) {
    final baseTextTheme = brightness == Brightness.dark
        ? Typography.blackMountainView
        : Typography.whiteMountainView;

    return ThemeData(
      useMaterial3: false,
      tabBarTheme: TabBarTheme(
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(
            25.0,
          ),
          boxShadow: const [
            BoxShadow(
              color: Colors.black38,
              offset: Offset(
                0.0,
                2.0,
              ),
              blurRadius: 6.0,
              spreadRadius: 1.0,
            ), //BoxShadow
            BoxShadow(
              color: Colors.white,
              offset: Offset(0.0, 0.0),
              blurRadius: 0.0,
              spreadRadius: 0.0,
            ), //BoxShadow
          ],
          color: indicatorTab,
        ),
        labelStyle:
            GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 14),
        unselectedLabelStyle:
            GoogleFonts.poppins(fontWeight: FontWeight.w500, fontSize: 14),
        labelColor: selectedTextTab,
        unselectedLabelColor: unselectedTextTab,
      ),
      brightness: brightness,
      canvasColor: background,
      cardColor: background,
      dividerColor: divider,
      dividerTheme: DividerThemeData(
        color: divider,
        space: 1,
        thickness: 1,
      ),
      cardTheme: CardTheme(
        color: cardBackground,
        margin: EdgeInsets.zero,
        clipBehavior: Clip.antiAliasWithSaveLayer,
      ),
      colorScheme: ColorScheme(
        brightness: brightness,
        primary: background,
        onPrimary: background,
        secondary: ColorConstants.secondaryAppColor,
        onSecondary: ColorConstants.secondaryAppColor,
        background: background,
        onBackground: background,
        error: error,
        onError: error,
        surface: ColorConstants.secondaryAppColor,
        onSurface: ColorConstants.secondaryAppColor,
      ),
      primaryColor: accentColor,
      // textSelectionColor: accentColor,
      // textSelectionHandleColor: accentColor,
      // cursorColor: accentColor,
      textSelectionTheme: TextSelectionThemeData(
        selectionColor: accentColor,
        selectionHandleColor: accentColor,
        cursorColor: accentColor,
      ),
      appBarTheme: AppBarTheme(
        // brightness: brightness,
        color: cardBackground,
        // textTheme: TextTheme(
        //   bodyText1: baseTextTheme.bodyText1!.copyWith(
        //     color: secondaryText,
        //     fontSize: 18,
        //   ),
        // ),
        iconTheme: IconThemeData(
          color: primaryText,
        ),
      ),

      iconTheme: IconThemeData(
        color: buttonBackground,
        size: 16.0,
      ),
      buttonTheme: ButtonThemeData(
        textTheme: ButtonTextTheme.primary,
        colorScheme: ColorScheme(
          brightness: brightness,
          primary: accentColor,
          secondary: accentColor,
          surface: background,
          background: background,
          error: error,
          onPrimary: buttonText,
          onSecondary: buttonText,
          onSurface: buttonText,
          onBackground: buttonText,
          onError: buttonText,
        ),
        padding: const EdgeInsets.all(16.0),
      ),
      cupertinoOverrideTheme: CupertinoThemeData(
        brightness: brightness,
        primaryColor: accentColor,
      ),
      inputDecorationTheme: InputDecorationTheme(
        errorStyle: TextStyle(color: error),
        labelStyle: GoogleFonts.poppins(
          fontSize: 14.0,
          color: primaryText.withOpacity(0.5),
        ),
        hintStyle: TextStyle(
          color: secondaryText,
          fontSize: 12.0,
        ),
      ),
      shadowColor: shadowColor,
      // fontFamily: 'Poppins',
      unselectedWidgetColor: hexToColor('#DADCDD'),
      textTheme: GoogleFonts.poppinsTextTheme(baseTextTheme).copyWith(
        displayLarge: baseTextTheme.displayLarge!.copyWith(
          color: primaryText,
          fontSize: 34.0,
          fontWeight: FontWeight.bold,
        ),
        displayMedium: baseTextTheme.displayMedium!.copyWith(
          color: primaryText,
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
        displaySmall: baseTextTheme.displaySmall!.copyWith(
          color: secondaryText,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
        headlineMedium: baseTextTheme.headlineMedium!.copyWith(
          color: primaryText,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
        headlineSmall: baseTextTheme.headlineSmall!.copyWith(
          color: primaryText,
          fontSize: 16,
          fontWeight: FontWeight.w700,
        ),
        titleLarge: baseTextTheme.titleLarge!.copyWith(
            color: primaryText,
            fontSize: 14,
            fontWeight: FontWeight.w400,
            height: pxToDouble(px: 21)),
        bodyLarge: baseTextTheme.bodyLarge!.copyWith(
          color: secondaryText,
          fontSize: 15,
        ),
        bodyMedium: baseTextTheme.bodyMedium!.copyWith(
            color: primaryText,
            fontSize: 12,
            fontWeight: FontWeight.w400,
            height: pxToDouble(px: 18)),
        labelLarge: baseTextTheme.labelLarge!.copyWith(
          color: primaryText,
          fontSize: 12.0,
          fontWeight: FontWeight.w700,
        ),
        bodySmall: baseTextTheme.bodySmall!.copyWith(
          color: primaryText,
          fontSize: 11.0,
          fontWeight: FontWeight.w300,
        ),
        labelSmall: baseTextTheme.labelSmall!.copyWith(
          color: secondaryText,
          fontSize: 11.0,
          fontWeight: FontWeight.w500,
        ),
        titleMedium: baseTextTheme.titleMedium!.copyWith(
          color: primaryText,
          fontSize: 16.0,
          fontWeight: FontWeight.w700,
        ),
        titleSmall: baseTextTheme.titleSmall!.copyWith(
          color: primaryText,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  static ThemeData get lightTheme => createTheme(
      brightness: Brightness.light,
      background: ColorConstants.lightScaffoldBackgroundColor,
      cardBackground: ColorConstants.cardBackground,
      primaryText: ColorConstants.lightTextColor,
      secondaryText: Colors.white,
      accentColor: ColorConstants.secondaryAppColor,
      indicatorTab: ColorConstants.primaryColor,
      unselectedTextTab: ColorConstants.primaryColor,
      selectedTextTab: Colors.white,
      divider: ColorConstants.lightGray,
      buttonBackground: ColorConstants.primaryColor,
      buttonText: ColorConstants.secondaryAppColor,
      disabled: ColorConstants.secondaryAppColor,
      error: Colors.red,
      shadowColor: ColorConstants.backgroundShadowColor);

  static ThemeData get darkTheme => createTheme(
      brightness: Brightness.dark,
      background: ColorConstants.darkScaffoldBackgroundColor,
      cardBackground: ColorConstants.darkCardBackground,
      primaryText: ColorConstants.darkTextColor,
      secondaryText: Colors.black,
      accentColor: ColorConstants.secondaryDarkAppColor,
      indicatorTab: Colors.black,
      selectedTextTab: Colors.white,
      unselectedTextTab: Colors.white,
      divider: Colors.black45,
      buttonBackground: ColorConstants.primaryColor,
      buttonText: ColorConstants.secondaryDarkAppColor,
      disabled: ColorConstants.secondaryDarkAppColor,
      error: Colors.red,
      shadowColor: ColorConstants.darkShadowColor);
}
