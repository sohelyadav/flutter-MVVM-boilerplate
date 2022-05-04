import 'package:flutter_mvvm_boilerplate/resources/color.dart';
import 'package:flutter/material.dart';

class PDivider extends StatelessWidget {
  final Color? color;
  final double? height;
  final double? width;
  const PDivider(
      {Key? key,
      this.color = kGrey,
      this.height = 1,
      this.width = double.infinity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      width: width,
      height: height,
    );
  }
}
