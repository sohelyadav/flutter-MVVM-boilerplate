import 'package:flutter/material.dart';
import 'package:flutter_mvvm_boilerplate/resources/color.dart';

const kAppPadding = 16.0;
const kAppCornerSRadius = 4.0;
const kAppCornerMRadius = 8.0;
const kAppCornerLRadius = 12.0;
const kAppCornerXLRadius = 20.0;
const kAppCornerXXLRadius = 24.0;
const kWidgetXSPadding = 2.0;
const kWidgetSPadding = 4.0;
const kWidgetMPadding = 8.0;
const kWidgetSLPadding = 16.0;
const kWidgetLPadding = 20.0;
const kWidgetXLPadding = 24.0;
const kWidgetXXLPadding = 28.0;
const kWidgetXXXLPadding = 32.0;
const kWidgetXXXXLPadding = 42.0;

const duration = 5.0;
MaterialTapTargetSize kMaterialTapTargetSize = MaterialTapTargetSize.shrinkWrap;

EdgeInsets kMaterialButtonPadding = EdgeInsets.zero;
double kMaterialButtonHighlightElevation = 0;
Color kMaterialButtonHighlightColor = Colors.transparent;
Color kMaterialButtonSplashColor = Colors.transparent;
double kMaterialButtonElevation = 5;

const textFormFieldHeight =
    const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: kBlack);
const Duration snackbarDuration = Duration(seconds: 5);

List<BoxShadow> boxShadows = [
  BoxShadow(color: kDarkGrey.withOpacity(0.1), spreadRadius: 2, blurRadius: 1),
];
List<String> yearList = List<String>.generate(
        DateTime.now().year - 1950, (i) => (1951 + i).toString())
    .skipWhile((value) => int.parse(value) > DateTime.now().year)
    .toList();
