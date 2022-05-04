import 'dart:ui';

import 'package:flutter_mvvm_boilerplate/resources/color.dart';
import 'package:flutter_mvvm_boilerplate/resources/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class YourClassNameRadioButton extends StatelessWidget {
  Function(int)? onChange;
  int? value;
  int? groupValue;

  Color activeColor;

  YourClassNameRadioButton({
    Key? key,
    @required this.value,
    this.activeColor = kPrimaryColor,
    @required this.groupValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CircleAvatar(
        radius: 11,
        backgroundColor: kWhite,
        child: CircleAvatar(
          radius: 10,
          backgroundColor: kPrimaryColor,
          child: CircleAvatar(
            radius: 7,
            backgroundColor: value == groupValue ? kWhite : kPrimaryColor,
          ),
        ),
      ),
    );
  }
}
