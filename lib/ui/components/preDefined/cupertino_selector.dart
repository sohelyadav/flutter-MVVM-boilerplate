import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mvvm_boilerplate/app/app.locator.dart';
import 'package:flutter_mvvm_boilerplate/resources/color.dart';
import 'package:flutter_mvvm_boilerplate/resources/demins.dart';
import 'package:flutter_mvvm_boilerplate/resources/themes.dart';
import 'package:flutter_mvvm_boilerplate/resources/translation.dart';
import 'package:stacked_services/stacked_services.dart';

// (index)=>newValue=mylist[index]''
customCupertinoSelector(
    {List<String>? selectingList,
    Function(int index)? callBack,
    String? initialValue}) async {
  NavigationService _navigationService = locator<NavigationService>();
  int selectedIndex = 0;

  await showCupertinoModalPopup(
      context: StackedService.navigatorKey!.currentContext!,
      builder: (BuildContext context) {
        return Material(
          child: Container(
            color: kWhite,
            height: 250,
            child: Column(
              children: [
                InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () {
                    callBack!(selectedIndex);
                    _navigationService.back();
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        vertical: 12, horizontal: kAppPadding),
                    color: kGrey,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "Done",
                          style: appTheme.textTheme.bodyText1
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: CupertinoPicker(
                    scrollController: FixedExtentScrollController(
                        initialItem: selectingList!
                            .indexWhere((element) => element == initialValue)),
                    backgroundColor: Colors.white,
                    onSelectedItemChanged: (value) {
                      selectedIndex = value;
                    },
                    itemExtent: 30.0,
                    children: selectingList.map((e) => Text(e)).toList(),
                  ),
                ),
              ],
            ),
          ),
        );
      });
}
