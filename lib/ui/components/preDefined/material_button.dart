import 'package:flutter_mvvm_boilerplate/resources/color.dart';
import 'package:flutter_mvvm_boilerplate/resources/demins.dart';
import 'package:flutter_mvvm_boilerplate/resources/themes.dart';
import 'package:flutter/material.dart';

class PMaterialButton extends StatelessWidget {
  final Function()? onPressed;
  final double? elevation;
  final Widget? child;
  final Color? color;
  final EdgeInsets? padding;
  final double? borderRadius;
  final ShapeBorder? borderShape;
  final MaterialTapTargetSize? materialTapTargetSize;
  const PMaterialButton(
      {Key? key,
      this.onPressed,
      this.elevation = 0,
      this.borderShape,
      this.borderRadius = 0,
      this.materialTapTargetSize = MaterialTapTargetSize.shrinkWrap,
      this.padding = EdgeInsets.zero,
      this.child,
      this.color = kWhite})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        elevation: elevation,
        materialTapTargetSize: materialTapTargetSize,
        padding: padding,
        shape: borderShape ??
            RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius!)),
        onPressed: onPressed,
        child: child);
  }
}
