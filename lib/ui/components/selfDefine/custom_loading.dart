import 'package:flutter/material.dart';
import 'package:flutter_mvvm_boilerplate/resources/color.dart';
import 'package:flutter_mvvm_boilerplate/resources/demins.dart';
import 'package:flutter_mvvm_boilerplate/resources/themes.dart';

class CustomLoading extends StatelessWidget {
  final double height;
  final bool isTranslucent;

  const CustomLoading({Key? key, this.height = 50, this.isTranslucent = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: isTranslucent ? kBlack.withOpacity(0.5) : Colors.transparent,
        // height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                      color: kBlack.withOpacity(0.1),
                      blurRadius: 3,
                      spreadRadius: 3)
                ],
                color: kWhite,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset(
                        "assets/images/logo.png",
                        height: 35,
                      ),
                      SizedBox(
                          width: height,
                          height: height,
                          child: CircularProgressIndicator(
                            strokeWidth: 2.0,
                            color: kPrimaryColor,
                          ))
                    ],
                  ),
                  SizedBox(height: kWidgetMPadding),
                  Text(
                    "Please wait...",
                    style: appTheme.textTheme.bodyText1!.copyWith(
                        color: kBlack,
                        fontWeight: FontWeight.w400,
                        fontSize: 12),
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
