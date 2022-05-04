import 'package:flutter/material.dart';
import 'package:flutter_mvvm_boilerplate/resources/color.dart';

class YourClassNameIcon extends StatelessWidget {
  IconData? icon;
  Color? color;
  double? size;
  double? padding;

  YourClassNameIcon(
      {Key? key,
      @required this.icon,
      this.color = kWhite,
      this.size = 25,
      this.padding = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(padding!),
      child: Icon(
        icon,
        color: color,
        size: size,
      ),
    );
  }
}
