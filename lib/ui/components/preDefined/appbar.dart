import 'package:flutter_mvvm_boilerplate/app/app.locator.dart';
import 'package:flutter_mvvm_boilerplate/resources/color.dart';
import 'package:flutter_mvvm_boilerplate/resources/demins.dart';
import 'package:flutter_mvvm_boilerplate/resources/themes.dart';
import 'package:flutter_mvvm_boilerplate/ui/components/preDefined/icon.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

AppBar appBar(
    {bool? isDrawer = false,
    bool? isClinic = false,
    bool? automaticallyImplyLeading = true,
    String? title,
    Color? contentColor = kWhite,
    List<Widget>? actions,
    Color? color = kPrimaryColor,
    double? elevation,
    PreferredSizeWidget? bottom}) {
  // if (color == kWhite)
  // FlutterStatusbarManager.setStyle(StatusBarStyle.DARK_CONTENT);

  NavigationService _navigationService = locator<NavigationService>();
  actions = actions ?? [];
  return AppBar(
    backgroundColor: color,
    automaticallyImplyLeading: automaticallyImplyLeading!,
    elevation: elevation ?? (color == kWhite ? 5 : 0),
    bottom: bottom,
    leading: automaticallyImplyLeading
        ? ((isDrawer == true)
            ? MaterialButton(
                onPressed: () {},
                shape: CircleBorder(),
                child: Text(""),
              )
            : InkWell(
                customBorder: CircleBorder(),
                onTap: () => _navigationService.back(),
                child: YourClassNameIcon(
                  icon: Icons.arrow_back,
                  color: color == kWhite ? kBlack : contentColor!,
                  size: 28,
                ),
              ))
        : null,
    actions: actions,
    title: Text(
      title ?? "",
      style: appTheme.textTheme.bodyText1!.copyWith(
          color: color == kWhite ? kBlack : contentColor,
          fontWeight: FontWeight.bold),
    ),
  );
}
