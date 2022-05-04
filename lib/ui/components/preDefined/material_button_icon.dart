import 'package:flutter_mvvm_boilerplate/resources/color.dart';
import 'package:flutter_mvvm_boilerplate/resources/demins.dart';
import 'package:flutter_mvvm_boilerplate/resources/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class PMaterialButtonIcon extends StatelessWidget {
  final Function()? onPressed;
  final String? text;
  final IconData? icon;
  final Color? color;
  final EdgeInsets? padding;
  final ShapeBorder? shape;
  const PMaterialButtonIcon(
      {Key? key,
      this.onPressed,
      this.padding,
      this.text,
      this.icon,
      this.color = kWhite,
      this.shape})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget textWiget = text!.isEmpty
        ? Container()
        : Text(
            text!,
            style: appTheme.textTheme.bodyText2!
                .copyWith(color: color, fontWeight: FontWeight.bold),
          );
    Widget iconWidget = icon == null
        ? Container()
        : Icon(
            icon,
            color: kWhite,
          );
    return MaterialButton(
      padding: padding,
      shape: shape ??
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),

      // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
      onPressed: onPressed,
      child: Row(
        children: [
          textWiget,
          SizedBox(
            width: kWidgetMPadding,
          ),
          iconWidget
        ],
      ),
    );
  }
}
