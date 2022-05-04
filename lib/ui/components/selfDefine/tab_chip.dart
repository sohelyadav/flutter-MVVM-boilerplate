import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mvvm_boilerplate/resources/color.dart';
import 'package:flutter_mvvm_boilerplate/resources/demins.dart';
import 'package:flutter_mvvm_boilerplate/resources/themes.dart';
import 'package:stacked_services/stacked_services.dart';

class PTabChips extends StatefulWidget {
  final int? initGroupValue;
  final Map<int, String>? tabs;
  final Function(int)? onTabChanged;
  const PTabChips(
      {Key? key, this.tabs, this.onTabChanged, this.initGroupValue = 0})
      : super(key: key);
  @override
  _PTabChipsState createState() => _PTabChipsState();
}

class _PTabChipsState extends State<PTabChips> {
  int groupValue = 0;
  Map<int, Widget> get children {
    Map<int, Widget> selectors = {};
    for (var i = 0; i < widget.tabs!.entries.length; i++) {
      selectors.addAll({
        widget.tabs!.entries.toList()[i].key: Container(
            alignment: Alignment.center,
            // width: SizeConfig.screenWidth,
            height: 34,
            child: Text(
              widget.tabs!.entries.toList()[i].value,
              style: appTheme.textTheme.subtitle2!.copyWith(
                  color: (widget.tabs![groupValue] == "FILING STATUS" ||
                              widget.tabs![groupValue] == 'REPORTS') &&
                          i == 2
                      ? kWhite
                      : (groupValue) == i
                          ? kWhite
                          : kBlack,
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2),
            ))
      });
    }
    return selectors;
  }

  @override
  void initState() {
    if (widget.initGroupValue != null) groupValue = widget.initGroupValue!;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return children.isEmpty
        ? Container()
        : Container(
            margin: EdgeInsets.symmetric(horizontal: kWidgetMPadding),
            padding: EdgeInsets.symmetric(horizontal: 1),
            height: 39,
            width: MediaQuery.of(context).size.width,

            decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.circular(kAppCornerMRadius),
            ),

            // elevation: 0,
            child: CupertinoSlidingSegmentedControl(
              thumbColor: kPrimaryColor,
              groupValue: groupValue,
              backgroundColor: kWhite,
              onValueChanged: (int? index) {
                if (groupValue != index) {
                  setState(() {
                    groupValue = index!;
                  });
                  if (widget.onTabChanged != null) {
                    widget.onTabChanged!(index!);
                  }
                }
              },
              children: children,
            ),
          );
  }
}
