import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mvvm_boilerplate/app/app.locator.dart';
import 'package:flutter_mvvm_boilerplate/resources/demins.dart';
import 'package:flutter_mvvm_boilerplate/resources/themes.dart';
import 'package:flutter_mvvm_boilerplate/services/firebaseAuthServices.dart';
import 'package:flutter_mvvm_boilerplate/ui/components/preDefined/button.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginSignupBottomsheet extends StatelessWidget {
  NavigationService _navigationService = locator<NavigationService>();
  FirebaseAuthService _firebaseService = FirebaseAuthService();
  final String title;
  final String? description;
  final String acceptText;
  final String rejectText;
  final Function()? onAccept;
  final Function()? onReject;
  LoginSignupBottomsheet(
      {required this.title,
      required this.onAccept,
      required this.acceptText,
      required this.rejectText,
      this.description,
      this.onReject,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          top: kAppPadding, left: kAppPadding, right: kAppPadding),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(kAppPadding),
            topRight: Radius.circular(kAppPadding)),
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: appTheme.textTheme.bodyText1!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            description?.isNotEmpty ?? false
                ? Text(
                    description ?? '',
                    style: appTheme.textTheme.bodyText2!.copyWith(),
                  )
                : Container(),
            SizedBox(
                height: description?.isNotEmpty ?? false
                    ? kWidgetMPadding
                    : kWidgetXLPadding),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: FittedBox(
                    child: CustomButton(
                      horizontalMargin: 0,
                      vericalMargin: 0,
                      onPressed: onReject != null
                          ? onReject
                          : () => _navigationService.back(),
                      text: rejectText,
                      customButtonType: CustomButtonType.ErrorWithOutline,
                      customButtonSize: CustomButtonSize.Large,
                    ),
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: FittedBox(
                    child: CustomButton(
                      vericalMargin: 0,
                      horizontalMargin: 0,
                      onPressed: onAccept,
                      text: acceptText,
                      customButtonType: CustomButtonType.Primary,
                      customButtonSize: CustomButtonSize.Large,
                    ),
                  ),
                ),
              ],
            ),
            Visibility(
                visible: !Platform.isIOS,
                child: SizedBox(
                  height: 16,
                ))
          ],
        ),
      ),
    );
  }
}
