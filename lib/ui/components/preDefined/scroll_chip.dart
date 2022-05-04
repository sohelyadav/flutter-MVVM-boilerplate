import 'package:flutter/material.dart';
import 'package:flutter_mvvm_boilerplate/resources/color.dart';
import 'package:flutter_mvvm_boilerplate/resources/demins.dart';
import 'package:flutter_mvvm_boilerplate/resources/themes.dart';

class ScrollChip extends StatelessWidget {
  List<String>? text;
  final double? cornerRadius;
  final Color? textColor;
  final Color? borderColor;
  final Color? bodyColor;

  ScrollChip(
      {Key? key,
      this.text,
      this.cornerRadius = kAppCornerXLRadius,
      this.textColor = kPrimaryColor,
      this.borderColor = kPrimaryColor,
      this.bodyColor = kWhite})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (text?.isEmpty ?? true)
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: kWidgetMPadding),
        child: Text(
          "N/A",
          style: appTheme.textTheme.subtitle1!
              .copyWith(fontWeight: FontWeight.bold),
        ),
      );
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 0),
      height: 40,
      child: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: text!.length,
        // padding: const EdgeInsets.only(
        //     left: kWidgetMPadding, right: kWidgetMPadding),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => _scrollText(text![index]),
      ),
    );
  }

  Widget _scrollText(String text) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(
          horizontal: kWidgetSPadding, vertical: kWidgetMPadding),
      padding: EdgeInsets.symmetric(horizontal: kWidgetSPadding, vertical: 2),
      // height: 20,
      // width: 90,
      decoration: BoxDecoration(
          color: bodyColor,
          border: Border.all(color: borderColor!),
          borderRadius: BorderRadius.circular(cornerRadius!)),
      child: Center(
        child: Text(
          text,
          maxLines: 1,
          textAlign: TextAlign.center,
          style: appTheme.textTheme.subtitle2!.copyWith(
            color: textColor,
          ),
        ),
      ),
    );
  }
}
