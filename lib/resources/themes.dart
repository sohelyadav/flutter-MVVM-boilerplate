import 'package:flutter_mvvm_boilerplate/resources/demins.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'color.dart';

final ThemeData appTheme = buildAppTheme();

ThemeData buildAppTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
      pageTransitionsTheme: PageTransitionsTheme(builders: {
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      }),
      colorScheme: ColorScheme(
          primary: kPrimaryColor,
          primaryVariant: kPrimaryColor,
          secondary: kSecondaryColor,
          secondaryVariant: kSecondaryColor,
          surface: kPrimaryColor,
          background: kWhite,
          error: kErrorColor,
          onPrimary: kPrimaryColor,
          onSecondary: kSecondaryColor,
          onSurface: kPrimaryColor,
          onBackground: kWhite,
          onError: kErrorColor,
          brightness: Brightness.light),
      primaryColor: kPrimaryColor,
      // timePickerTheme: TimePickerThemeData(backgroundColor: kWhite),
      accentColor: kPrimaryColor,
      indicatorColor: kPrimaryColor,
      scaffoldBackgroundColor: kWhite,
      cardColor: kWhite,
      focusColor: kPrimaryColor,
      textSelectionColor: kPrimaryColor,
      primaryColorDark: kPrimaryColor,
      textSelectionHandleColor: kPrimaryColor,
      primaryColorLight: kPrimaryColor,
      errorColor: kErrorColor,
      iconTheme: IconThemeData(
        color: kPrimaryColor,
      ),
      textTheme: buildAppTextTheme(base.textTheme),
      buttonTheme: base.buttonTheme.copyWith(
        textTheme: ButtonTextTheme.normal,
      ),
      // brightness: Brightness.dark,
      // appbar theme
      appBarTheme: AppBarTheme(
          backwardsCompatibility: false,
          systemOverlayStyle: SystemUiOverlayStyle.light,
          iconTheme: IconThemeData(color: kBlack, size: 20),
          centerTitle: false,
          color: kWhite,
          elevation: 0,
          actionsIconTheme: IconThemeData(color: kBlack, size: 20),
          textTheme: TextTheme(
              bodyText1: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black))),

      // textform theme
      inputDecorationTheme: InputDecorationTheme(
        prefixStyle: TextStyle(fontSize: 14),
        suffixStyle: TextStyle(fontSize: 14),
        helperStyle: TextStyle(fontSize: 14),
        labelStyle: TextStyle(
          fontSize: 14,
        ),
        errorStyle: TextStyle(
            fontSize: 10, fontWeight: FontWeight.bold, color: kErrorColor),
        // contentPadding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
        hintStyle: TextStyle(fontSize: 14, color: kGrey),
        contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        focusColor: kGrey, filled: false,
        border: OutlineInputBorder(
            borderSide:
                BorderSide(color: kPrimaryColor.withOpacity(0.3), width: .5),
            borderRadius: BorderRadius.circular(8)),
        disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: kBlack.withOpacity(0.3), width: .5),
            borderRadius: BorderRadius.circular(8)),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: kBlack.withOpacity(0.3), width: .5),
            borderRadius: BorderRadius.circular(8)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: kPrimaryColor, width: 1),
            borderRadius: BorderRadius.circular(8)),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: kErrorColor, width: 1),
            borderRadius: BorderRadius.circular(8)),
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: kErrorColor, width: 1),
            borderRadius: BorderRadius.circular(8)),
        fillColor: Color(0xFFF7F7F7),
      ),
      tabBarTheme: TabBarTheme(
        indicator: BoxDecoration(
            // color: kP,
            border: Border(bottom: BorderSide(color: kPrimaryColor, width: 4))),
        labelColor: kPrimaryColor,
        unselectedLabelColor: kDarkGrey,
        indicatorSize: TabBarIndicatorSize.tab,
        labelStyle: TextStyle(
          color: kPrimaryColor,
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
        unselectedLabelStyle: TextStyle(
          color: Colors.grey,
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      ));
}

TextTheme buildAppTextTheme(TextTheme textTheme) {
  return GoogleFonts.robotoTextTheme(textTheme).copyWith(
    headline1: GoogleFonts.poppins(
        textStyle: textTheme.headline1!.copyWith(fontSize: 24, color: kBlack)),
    headline2: GoogleFonts.roboto(
        textStyle: textTheme.headline2!.copyWith(fontSize: 22, color: kBlack)),
    headline3: GoogleFonts.roboto(
        textStyle: textTheme.headline3!.copyWith(fontSize: 20, color: kBlack)),
    headline4: GoogleFonts.roboto(
        textStyle: textTheme.headline4!.copyWith(fontSize: 18, color: kBlack)),
    headline5: GoogleFonts.roboto(
        textStyle:
            textTheme.headline5!.copyWith(color: kBlack, fontSize: 16.0)),
    headline6: GoogleFonts.roboto(
        textStyle: textTheme.headline6!.copyWith(fontSize: 14, color: kBlack)),
    bodyText1: GoogleFonts.roboto(
        textStyle: textTheme.bodyText1!.copyWith(fontSize: 16, color: kBlack)),
    bodyText2: GoogleFonts.roboto(
        textStyle: textTheme.bodyText2!.copyWith(fontSize: 14, color: kBlack)),
    subtitle1: GoogleFonts.roboto(
        textStyle: textTheme.subtitle1!.copyWith(fontSize: 12, color: kBlack)),
    subtitle2: GoogleFonts.roboto(
        textStyle: textTheme.subtitle2!.copyWith(fontSize: 10, color: kBlack)),
    button: GoogleFonts.roboto(
        textStyle: textTheme.button!.copyWith(color: kWhite, fontSize: 12)),
    caption: GoogleFonts.roboto(
        textStyle: textTheme.caption!.copyWith(color: kBlack)),
    overline: GoogleFonts.roboto(textStyle: textTheme.overline),
  );
}
