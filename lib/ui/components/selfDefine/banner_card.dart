import 'package:flutter_mvvm_boilerplate/resources/color.dart';
import 'package:flutter_mvvm_boilerplate/resources/demins.dart';
import 'package:flutter_mvvm_boilerplate/resources/themes.dart';
import 'package:flutter/material.dart';

class BannerCard extends StatelessWidget {
  final String title;
  final String subtitle;
  // final String image;
  final Color backgroundColor;
  final Color textColor;
  final double width;
  const BannerCard(
      {this.title = "Explore our Heath Tips",
      this.subtitle = "Explore deals, offers, health updates and more",
      // this.image = Images.bannerImage,
      this.backgroundColor = kPrimaryColor,
      this.textColor = kWhite,
      this.width = double.infinity})
      : super();

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.2,
      child: Container(
        width: width,
        padding: EdgeInsets.only(
            top: kWidgetLPadding,
            left: kWidgetLPadding,
            right: kWidgetLPadding),
        color: backgroundColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: appTheme.textTheme.headline5!
                  .copyWith(color: textColor, fontWeight: FontWeight.bold),
            ),
            Text(
              subtitle,
              style: appTheme.textTheme.subtitle1!.copyWith(
                color: textColor,
              ),
            ),
            SizedBox(
              height: kWidgetXLPadding,
            ),
          ],
        ),
      ),
    );
  }
}
